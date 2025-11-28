import 'package:flutter/material.dart';
import 'package:instargram/Provider/app_provider.dart';
import 'package:instargram/screen/home_screen.dart';

class MainTabScreen extends StatefulWidget {
  const MainTabScreen({super.key});

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    appProvider.loadMyProfile();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      appProvider.loadMyProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset(
          "assets/Instagram_logo.svg.png",
          color: Colors.white,
          width: 120,
        ),
        actions: [
          Icon(Icons.favorite_border, color: Colors.white),
          SizedBox(width: 14),
          Icon(Icons.send_outlined, color: Colors.white),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_filled),
            label: "",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.search),
            activeIcon: Icon(Icons.search, weight: 800),
            label: "",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.add_box_outlined),
            activeIcon: Icon(Icons.add_box),
            label: "",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(Icons.play_circle_outlined),
            activeIcon: Icon(Icons.play_circle),
            label: "",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: NetworkImage(appProvider.myProfile!.profileImageUrl)),
              ),
            ),
            activeIcon: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1),
                shape: BoxShape.circle,
                image: DecorationImage(image: NetworkImage(appProvider.myProfile!.profileImageUrl)),
              ),
            ),
            label: "",
          ),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [
          HomeScreen(),
          Placeholder(),
          Placeholder(),
          Placeholder(),
          Placeholder(),
        ],
      ),
    );
  }
}
