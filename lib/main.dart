import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:talent_insider_test/app/core/consts/style.dart';
import 'package:talent_insider_test/app/core/dependency/injection_container.dart';
import 'package:talent_insider_test/app/features/auth/presentation/pages/login_page.dart';
import 'package:talent_insider_test/app/features/course/presentation/pages/course_page.dart';
import 'package:talent_insider_test/app/features/home/presentation/pages/profile_page.dart';
import 'package:talent_insider_test/app/features/introduction/presentation/pages/on_boarding_page.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'app/features/home/presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  await dotenv.load(fileName: '.env');
  setupLocator();
  await sl.allReady();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: StyleConst.blackColor,
      statusBarIconBrightness: Brightness.light,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: StyleConst.myTextTheme,
          scaffoldBackgroundColor: Colors.black),
      initialRoute: '/',
      routes: {
        '/': (context) => const MediaQueryWrapper(child: OnBoardingPage()),
        '/login': (context) => MediaQueryWrapper(child: LoginPage()),
        '/main': (context) => const BottomNav(),
        '/course': (context) => CoursePage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}

class MediaQueryWrapper extends StatelessWidget {
  final Widget child;

  const MediaQueryWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.all(24),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: child,
      ),
    );
  }
}

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  BottomNavState createState() => BottomNavState();
}

class BottomNavState extends State<BottomNav> {
  @override
  void initState() {
    super.initState();
  }

  int selectedPage = 0;

  List<Widget> _pageOptions() {
    return [
      HomePage(),
      const Center(
        child: Text('Course'),
      ),
      const Center(
        child: Text('Profile'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: StyleConst.primaryColor,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      backgroundColor: StyleConst.primaryColor,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: _pageOptions()[selectedPage],
      ),
      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.add_home_outlined, size: 30), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.ondemand_video_rounded, size: 30),
              label: 'Course'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded, size: 30),
              label: 'Profile'),
        ],
        selectedItemColor: StyleConst.whiteColor,
        unselectedItemColor: Colors.grey.withOpacity(0.8),
        currentIndex: selectedPage,
        backgroundColor: StyleConst.blackColor,
        onTap: (index) {
          setState(() {
            selectedPage = index;
          });
        },
      ),
    );
  }
}
