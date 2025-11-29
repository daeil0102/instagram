import 'package:instagram/model/user_model.dart';

class FeedModel {
  final int id;
  final String description;
  final UserModel userModel;
  final int favoriteCount;
  final int commentCount;
  final int sharedCount;
  final List<String> contents;

  FeedModel(
    this.id,
    this.description,
    this.userModel,
    this.favoriteCount,
    this.commentCount,
    this.sharedCount,
    this.contents
  );
}