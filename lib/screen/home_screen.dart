import 'package:flutter/material.dart';
import 'package:instagram/Provider/app_provider.dart';
import 'package:instagram/screen/story_detail_screen.dart';

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
      appProvider.loadFeedList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
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
                          return StoryDetailScreen();
                        }));
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
            ListView.builder(
              //shrinkWrap를 false로 하면 메모리를 줄일 수 있지만,
              //미리 빌드하지 않기 때문에 크기를 알 수 없어 오류가 날 수 있다.
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: appProvider.homeFeedList.length,
              itemBuilder: (context, index) {
                final currentFeed = appProvider.homeFeedList[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        spacing: 8,
                        children: [
                          SizedBox(
                            width: 30,
                            height: 30,
                            child: CircleAvatar(
                                foregroundImage: NetworkImage(currentFeed.creator.profileImageUrl)
                            ),
                          ),
                          Text(
                            currentFeed.creator.name,
                            style: TextStyle(color: Colors.white)
                          ),
                          Spacer(),
                          Icon(Icons.more_horiz, color: Colors.white)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.widthOf(context) * 0.6,
                      width: MediaQuery.widthOf(context),
                      child: PageView.builder(
                        itemCount: currentFeed.contents.length,
                        itemBuilder: (context, index) {
                          return Image.network(
                              height: MediaQuery.widthOf(context) * 0.6,
                              width: MediaQuery.widthOf(context),
                              fit: BoxFit.cover,
                              currentFeed.contents[index]
                          );
                        }
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              appProvider.toggleFavoriteFeed(currentFeed.id);
                            },
                            child: Icon(
                              appProvider.isFavoriteFeed(currentFeed.id)
                                ? Icons.favorite
                                : Icons.favorite_border,
                              color: appProvider.isFavoriteFeed(currentFeed.id)
                                ? Colors.redAccent
                                : Colors.white,
                            ),
                          ),

                          Text(
                            currentFeed.favoriteCount.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 14),

                          Icon(Icons.comment, color: Colors.white),
                          Text(
                            currentFeed.commentCount.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 14),

                          Icon(Icons.send_outlined, color: Colors.white),
                          Text(
                            currentFeed.sharedCount.toString(),
                            style: TextStyle(color: Colors.white),
                          ),

                          Spacer(),
                          Icon(Icons.bookmark_outline, color: Colors.white,)
                        ],
                      ),
                    ),
                    if (currentFeed.description != null)
                      Text(
                        currentFeed.description!,
                        maxLines: appProvider.isMoveFeed(currentFeed.id)
                            ? null
                            : 1,
                        overflow: appProvider.isMoveFeed(currentFeed.id)
                            ? null
                            : TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white),
                      )
                    ,
                    GestureDetector(
                      onTap: () {
                        appProvider.toggleMoveFeed(currentFeed.id);
                      },
                      child: Text(
                        appProvider.isMoveFeed(currentFeed.id)
                          ? "자세히 보기"
                          : "간략히 보기",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
