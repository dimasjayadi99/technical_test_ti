import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talent_insider_test/app/core/shared/custom_button.dart';
import 'package:talent_insider_test/app/core/shared/gap.dart';
import 'package:talent_insider_test/app/features/course/domain/entities/chapter_entity.dart';
import 'package:talent_insider_test/app/features/course/presentation/bloc/course_detail_bloc.dart';
import '../../../../core/consts/path.dart';
import '../../../../core/consts/style.dart';
import '../../../../core/dependency/injection_container.dart';
import '../../../../core/shared/custom_divider.dart';
import 'lesson_page.dart';

class CourseDetailPage extends StatelessWidget {
  final String id;

  const CourseDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final bloc = sl<CourseDetailBloc>();
        bloc.fetchDetailBloc(id);
        return bloc;
      },
      child: BlocBuilder<CourseDetailBloc, CourseDetailState>(
        builder: (context, state) {
          if (state is CourseDetailLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CourseDetailFailedState) {
            return Center(child: Text(state.message));
          } else if (state is CourseDetailSuccessState) {
            final data = state.data;
            final chapter = state.chapter;
            return DefaultTabController(
              length: 3,
              child: Scaffold(
                bottomNavigationBar: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomButton()
                      .fillButton(context, 'Continue Last', () {}),
                ),
                body: Column(
                  children: [
                    Image.network(
                      data.pathUrls.first,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.title,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const Gap.v(h: 16),
                          Wrap(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.grey[850],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.code,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    const Gap.h(w: 8),
                                    Text(
                                      data.category,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Gap.v(h: 16),
                          Row(
                            children: [
                              Text(
                                'Created by ${data.author ?? 'Anonymous'}',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              const Spacer(),
                              ClipOval(
                                child: Image.asset(
                                  PathConst.defaultFlag,
                                  width: 24,
                                  height: 24,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Gap.h(w: 8),
                              Text(
                                'in English',
                                style: Theme.of(context).textTheme.labelMedium,
                              )
                            ],
                          ),
                          const Gap.v(h: 16),
                          Text(
                              '${data.chapterIds.length} Chapters || 10 Lesson || 30m 15s Total Length'),
                        ],
                      ),
                    ),
                    const Gap.v(h: 24),
                    TabBar(
                      dividerColor: Colors.transparent,
                      indicatorColor: StyleConst.whiteColor,
                      labelColor: StyleConst.whiteColor,
                      tabs: const [
                        Tab(text: 'Overview'),
                        Tab(text: 'Contents'),
                        Tab(text: 'More Like This'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          const Center(child: Text('Overview Content')),
                          ContentsTab(
                            chaptersTitle: chapter,
                          ),
                          const Center(child: Text('More Like This Content')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
                child: Text('Terjadi kesalahan saat menampilkan halaman'));
          }
        },
      ),
    );
  }
}

class ContentsTab extends StatefulWidget {
  final List<ChapterEntity> chaptersTitle;

  const ContentsTab({super.key, required this.chaptersTitle});

  @override
  State<ContentsTab> createState() => _ContentsTabState();
}

class _ContentsTabState extends State<ContentsTab> {
  late List<bool> _isExpandedList;

  @override
  void initState() {
    super.initState();
    _isExpandedList = List<bool>.filled(widget.chaptersTitle.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: widget.chaptersTitle.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;

          return Column(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _isExpandedList[index] = !_isExpandedList[index];
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Chapter ${index + 1}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const Spacer(),
                          Text(
                            '${item.lessonId.split(',').length} lessons || 18 min',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      const Gap.v(h: 8),
                      Text(
                        item.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ),
              if (_isExpandedList[index])
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LessonPage(
                              idLesson: item.lessonId.split(", ")[index],
                              titleLesson: item.lessonTitle.split(", ")[index],
                            )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListTile(
                      title: Text(
                        item.lessonTitle,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ),
              CustomDivider().styleDivider(),
            ],
          );
        }).toList(),
      ),
    );
  }
}
