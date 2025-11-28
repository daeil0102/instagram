import 'package:flutter/material.dart';

class MainTabScreen extends StatefulWidget {
  const MainTabScreen({super.key});

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  int currentIndex = 0;


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
                image: DecorationImage(image: NetworkImage("https://media.istockphoto.com/id/1317804584/ko/%EC%82%AC%EC%A7%84/%ED%95%9C-%EC%82%AC%EC%97%85%EA%B0%80-%EC%8A%A4%ED%8A%9C%EB%94%94%EC%98%A4-%EC%B4%88%EC%83%81%ED%99%94%EA%B0%80-%EC%B9%B4%EB%A9%94%EB%9D%BC%EB%A5%BC-%EB%B0%94%EB%9D%BC%EB%B3%B4%EA%B3%A0-%EC%9E%88%EC%8A%B5%EB%8B%88%EB%8B%A4.jpg?s=612x612&w=0&k=20&c=Omb6e3yrf3T4guoERlyoYQEoaiORC2v_nb_1lUx3uSU=")),
              ),
            ),
            activeIcon: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1),
                shape: BoxShape.circle,
                image: DecorationImage(image: NetworkImage("https://media.istockphoto.com/id/1317804584/ko/%EC%82%AC%EC%A7%84/%ED%95%9C-%EC%82%AC%EC%97%85%EA%B0%80-%EC%8A%A4%ED%8A%9C%EB%94%94%EC%98%A4-%EC%B4%88%EC%83%81%ED%99%94%EA%B0%80-%EC%B9%B4%EB%A9%94%EB%9D%BC%EB%A5%BC-%EB%B0%94%EB%9D%BC%EB%B3%B4%EA%B3%A0-%EC%9E%88%EC%8A%B5%EB%8B%88%EB%8B%A4.jpg?s=612x612&w=0&k=20&c=Omb6e3yrf3T4guoERlyoYQEoaiORC2v_nb_1lUx3uSU=")),
              ),
            ),
            label: "",
          ),
        ],
      ),
    );
  }
}
