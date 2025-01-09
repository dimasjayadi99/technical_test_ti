import 'package:flutter/material.dart';

import '../../../../core/consts/style.dart';
import '../../../../core/shared/gap.dart';

class AudioBookPage extends StatelessWidget {
  const AudioBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StyleConst.blackColor,
        title: const Text('Audio Book'),
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
                  hintText: 'Search Keywords',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              const Gap.v(h: 24),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Text(
                      'Best-Sellers',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const Gap.v(h: 16),
                    SizedBox(
                      height: 250,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 120,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(
                                    'https://static.get-headway.com/9032dbf2efaa45f9a447-15cefef9cb0fb3.jpg',
                                    fit: BoxFit.cover,
                                    height: 185,
                                  ),
                                ),
                                const Gap.v(h: 16),
                                const Text(
                                  'The Power of Habit',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  'Kev Freeman',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const Gap.h(w: 24),
                        itemCount: 8,
                      ),
                    ),
                    const Gap.v(h: 32),
                    Text(
                      'More Books',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const Gap.v(h: 24),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 60,
                                height: 60,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    'https://www.uscreen.tv/wp-content/uploads/2021/10/how-to-sell-courses-online.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const Gap.h(w: 16),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Good to Great',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                            ),
                                            Text(
                                              'by Deena Roberts',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium,
                                            ),
                                          ],
                                        ),
                                        Icon(
                                          Icons.bookmark_border,
                                          color: StyleConst.whiteColor,
                                        ),
                                      ],
                                    ),
                                    const Gap.v(h: 8),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '16 Chapters',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.headset,
                                              size: 14,
                                              color: StyleConst.whiteColor,
                                            ),
                                            const Gap.h(w: 4),
                                            Text(
                                              '45 min',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall,
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Column(
                          children: [
                            const Gap.v(h: 16),
                            Container(
                              height: 1,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    StyleConst.blackColor,
                                    StyleConst.whiteColor.withOpacity(0.3),
                                    StyleConst.blackColor,
                                  ],
                                  stops: const [0.0, 0.5, 1.0],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                            ),
                            const Gap.v(h: 16),
                          ],
                        );
                      },
                      itemCount: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
