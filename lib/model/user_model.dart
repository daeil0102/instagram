class UserModel {
  final int id;
  final String name;
  final String profileImageUrl;
  final String nickname;
  final List<int> follower;
  final List<int> following;
  final String description;

  UserModel({
    required this.id,
    required this.name,
    required this.nickname,
    required this.follower,
    required this.following,
    required this.description,
    required this.profileImageUrl
  });
}

final userList = [
  UserModel(id: 1,
      name: "TestName",
      profileImageUrl: "https://search.pstatic.net/sunny/?src=https%3A%2F%2Fyt3.googleusercontent.com%2Fd3DLEqK1sjhpPnJUkptKZMe00fhBTRLW7WilzAL8E3u1VkzkVQ3UOELzkS-bwkusDMrxXqU7c3g%3Ds900-c-k-c0x00ffffff-no-rj&type=a340",
      nickname: "TestNickName",
      follower: [2, 3, 4],
      following: [2, 3, 4],
      description: "Hello World!"
  ),
  UserModel(id: 2,
      name: "TestName2",
      profileImageUrl: "https://search.pstatic.net/sunny/?src=https%3A%2F%2Fimages-na.ssl-images-amazon.com%2Fimages%2FS%2Famzn-author-media-prod%2Fnhmp3k5m9h1421kj4o7ivrssfv.jpg&type=a340",
      nickname: "TestNickName2",
      follower: [1, 3, 4],
      following: [1, 3, 4],
      description: "Hello World!"
  ),
  UserModel(id: 3,
      name: "TestName3",
      profileImageUrl: "https://search.pstatic.net/sunny/?src=https%3A%2F%2Fstatic.vecteezy.com%2Fsystem%2Fresources%2Fpreviews%2F003%2F597%2F508%2Fnon_2x%2Fportrait-of-a-woman-with-long-earrings-free-vector.jpg&type=a340",
      nickname: "TestNickName3",
      follower: [2, 1, 4],
      following: [2, 1, 4],
      description: "Hello World!"
  ),
  UserModel(id: 4,
      name: "TestName4",
      profileImageUrl: "https://search.pstatic.net/sunny/?src=https%3A%2F%2Fimages.pexels.com%2Fphotos%2F8234782%2Fpexels-photo-8234782.jpeg%3Fauto%3Dcompress%26cs%3Dtinysrgb%26dpr%3D1%26w%3D500&type=a340",
      nickname: "TestNickName4",
      follower: [2, 3, 1],
      following: [2, 3, 1],
      description: "Hello World!"
  ),
];