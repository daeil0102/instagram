import 'package:instagram/model/user_model.dart';

class FeedModel {
  final int id;
  final String description;
  final UserModel userModel;
  final int favoriteCount;
  final int commentCount;
  final int sharedCount;
  final List<String> contents;

  FeedModel({
    required this.id,
    required this.description,
    required this.userModel,
    required this.favoriteCount,
    required this.commentCount,
    required this.sharedCount,
    required this.contents,
  });
}

final feedList = [
  FeedModel(
      id: 1,
      description: null,
      userModel: userList[0],
      favoriteCount: 2323,
      commentCount: 1212,
      sharedCount: 5656,
      contents: [
        "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxODA3MDdfOCAg%2FMDAxNTMwOTU5NTQ3NDYx.DL7mf7Iw9Vfml1USRgWy59wLaBM8CPazgZr8D69aWSwg.eRU1SiO1DdJHlMYONW6CZZvUUbbgjepM2Sb3-ytiZkEg.JPEG.tpgml6817%2FP20180706_175346402_22F6A383-5BD8-4C35-99DD-BE3EE99CF13F.JPG&type=sc960_832"
      ]
  ),

  FeedModel(
      id: 2,
      description: "게시물 입니다.",
      userModel: userList[1],
      favoriteCount: 84848,
      commentCount: 01092,
      sharedCount: 68499,
      contents: [
        "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDA1MzBfMjM2%2FMDAxNzE3MDM2MTc1Mzk1.FhZOpRMOPaMkZWZ9S5UGXmrHTE4JKVpJZRlbJ_8FBwkg.bj24NEzllSZDU6RhHr1br3P9fr0jS-vRS9nS1qaYB3Qg.JPEG%2F6.JPG&type=sc960_832",
        "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxODA3MDRfMjk5%2FMDAxNTMwNzE0NDY4NTEz.OemrOJ8e1lximkEkuHaP_GmavSvlT_JQFuVYGulbmOYg.fX0V2mfxj1scBQYuMc-mVzbOEluB1dt0abJhv7AMWL8g.JPEG.tpgml6817%2FP20180702_012616565_F4DDB8FC-A598-416E-83E3-C00558EAB5F7.JPG&type=sc960_832"
      ]
  )
];