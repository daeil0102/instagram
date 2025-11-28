import 'package:flutter/material.dart';
import 'package:instargram/Provider/app_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      appProvider.loadFollowerStoryList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 54,
            child: ListView.builder(
              itemCount: appProvider.followerStoryList?.length ?? 0,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final currentStory = appProvider.followerStoryList![index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {

                      });
                    },
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(currentStory.creator.profileImageUrl)
                                  )
                              ),
                            ),
                            if (currentStory.creator.id == appProvider.myProfile?.id)
                              Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Icon(Icons.add_circle, color: Colors.blue)
                              )
                          ],
                        ),
                        Text(
                            currentStory.creator.name,
                            style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}
