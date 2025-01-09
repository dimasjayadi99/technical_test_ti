import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent_insider_test/app/core/consts/path.dart';
import 'package:talent_insider_test/app/core/shared/custom_divider.dart';
import 'package:talent_insider_test/app/core/shared/gap.dart';
import 'package:talent_insider_test/app/core/utils/date_format_util.dart';
import 'package:talent_insider_test/app/features/course/presentation/bloc/course_bloc.dart';
import 'package:talent_insider_test/app/features/course/presentation/pages/course_detail_page.dart';
import '../../../../core/consts/style.dart';
import '../../../../core/dependency/injection_container.dart';

class CoursePage extends StatelessWidget {
  CoursePage({super.key});

  final List<String> listTab = [
    'For You',
    'Recent',
    'Trending',
    'Technology',
    'Health',
    'Business'
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CourseBloc>(
      create: (context) {
        final bloc = sl<CourseBloc>();
        bloc.fetchList();
        return bloc;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: StyleConst.blackColor,
          title: const Text('Course'),
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_outlined,
              color: StyleConst.whiteColor,
            ),
          ),
          titleTextStyle: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: StyleConst.whiteColor),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(
                Icons.menu,
                color: StyleConst.whiteColor,
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(
                        Icons.tune,
                        color: Colors.white,
                      ),
                      hintText: 'Title, mentor, or keywords...',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)))),
                  style: TextStyle(color: Colors.white),
                ),
                const Gap.v(h: 24),
                SizedBox(
                  height: 50,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey[850],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            listTab[index],
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Gap.h(
                      w: 8,
                    ),
                    itemCount: listTab.length,
                  ),
                ),
                const Gap.v(h: 24),
                Expanded(
                  child: BlocBuilder<CourseBloc, CourseState>(
                    builder: (context, state) {
                      if (state is CourseLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is CourseFailedState) {
                        return Center(child: Text(state.message));
                      } else if (state is CourseSuccessState) {
                        final listCourse = state.list;
                        return ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => CourseDetailPage(
                                            id: listCourse[index].id,
                                          )));
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        width: 90,
                                        height: 90,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.network(
                                            listCourse[index].pathUrls[index],
                                            fit: BoxFit.cover,
                                          ),
                                        )),
                                    const Gap.h(w: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            listCourse[index].title,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const Gap.v(h: 8),
                                          Row(
                                            children: [
                                              SizedBox(
                                                  width: 24,
                                                  height: 24,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            2),
                                                    child: Image.asset(
                                                      PathConst.defaultProfile,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  )),
                                              const Gap.h(w: 8),
                                              Text(
                                                listCourse[index].author ??
                                                    'Anonymous',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium,
                                              ),
                                              const Spacer(),
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 4),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: Border.all(
                                                      color:
                                                          StyleConst.whiteColor,
                                                      width: 1,
                                                    )),
                                                child: Center(
                                                  child: Text(
                                                    'Intermediate',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelSmall,
                                                  ),
                                                ),
                                              ),
                                              const Gap.h(
                                                w: 8,
                                              ),
                                              ClipOval(
                                                  child: Image.asset(
                                                PathConst.defaultFlag,
                                                width: 24,
                                                height: 24,
                                                fit: BoxFit.cover,
                                              ))
                                            ],
                                          ),
                                          const Gap.v(h: 8),
                                          Row(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 4),
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[850],
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Center(
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.code,
                                                        color: StyleConst
                                                            .whiteColor,
                                                        size: 16,
                                                      ),
                                                      const Gap.h(w: 8),
                                                      Text(
                                                        listCourse[index]
                                                            .category,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelSmall,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const Spacer(),
                                              Text(
                                                listCourse[index]
                                                    .chapterIds
                                                    .length
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium,
                                              ),
                                              const Gap.h(w: 4),
                                              Icon(
                                                Icons.book_outlined,
                                                color: StyleConst.whiteColor,
                                                size: 16,
                                              ),
                                              const Gap.h(w: 8),
                                              Text(
                                                formatTime(listCourse[index]
                                                    .createdAt),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return CustomDivider().styleDivider();
                            },
                            itemCount: listCourse.length);
                      } else {
                        return const Center(
                            child: Text(
                                'Terjadi kesalahan saat menampilkan halaman'));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
