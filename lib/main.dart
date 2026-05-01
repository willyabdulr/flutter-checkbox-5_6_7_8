import 'package:flutter/material.dart';
import 'package:pertemuan5/page/list_page.dart';
import 'package:pertemuan5/page/dashboard.dart';
// import 'package:pertemuan5/page/profile_page.dart';
import 'package:pertemuan5/page/profile.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final List<Widget> _pages = [DashboardPage(), ProfilePage()];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: _pages[currentPage],
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: currentPage,
          onTap: (i) => setState(() => currentPage = i),
          items: [
            // Beranda
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text('Beranda'),
              selectedColor: Colors.blue,
            ),
            // Profile
            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text('Profile'),
              selectedColor: Colors.blue,
            ),

            // List
            SalomonBottomBarItem(
              icon: Icon(Icons.list),
              title: Text("List"),
              selectedColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
