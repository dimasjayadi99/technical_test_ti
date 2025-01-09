import 'package:flutter/material.dart';
import 'package:talent_insider_test/app/core/consts/style.dart';
import 'package:talent_insider_test/app/features/home/presentation/pages/audio_book_page.dart';
import 'package:talent_insider_test/app/features/course/presentation/pages/course_page.dart';
import '../../../../core/consts/path.dart';
import '../../widgets/menu_item_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<MenuItemModel> listMenu = [
    MenuItemModel(
      iconData: Icons.ondemand_video_outlined,
      label: 'Course',
    ),
    MenuItemModel(
      iconData: Icons.book_outlined,
      label: 'Audio Book',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              AppBar(
                toolbarHeight: 100,
                backgroundColor: StyleConst.primaryColor,
                title: Image.asset(
                  PathConst.appBarLogoPath,
                  width: 150,
                ),
                centerTitle: true,
              ),
              Expanded(
                child: Container(
                  color: StyleConst.blackColor,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 40),
                          height: 100,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: listMenu.length,
                              itemBuilder: (context, index) {
                                final menuItem = listMenu[index];
                                return buildMenuItem(
                                    menuItem: menuItem,
                                    context: context,
                                    onTap: () {
                                      switch (index) {
                                        case 0:
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CoursePage()));
                                          break;
                                        case 1:
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AudioBookPage()));
                                          break;
                                        default:
                                          break;
                                      }
                                    });
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Courses, Insights or Events',
                    hintStyle: TextStyle(color: Colors.white70, fontSize: 16),
                    prefixIcon: Icon(Icons.search, color: Colors.white70),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuItemModel {
  final IconData iconData;
  final String label;

  MenuItemModel({required this.iconData, required this.label});
}
