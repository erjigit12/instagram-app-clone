// ignore_for_file: overridden_fields

import 'package:instagram_app_clone/src/features/domain/entities/user/user_entity.dart';

class UserModel extends UserEntity {
  @override
  final String? uid;
  @override
  final String? username;
  @override
  final String? name;
  @override
  final String? bio;
  @override
  final String? website;
  @override
  final String? email;
  @override
  final String? profileUrl;
  @override
  final List? followers;
  @override
  final List? following;
  @override
  final num? totalFollowers;
  @override
  final num? totalFollowing;
  @override
  final num? totalPosts;

  const UserModel(
      {this.uid,
      this.username,
      this.name,
      this.bio,
      this.website,
      this.email,
      this.profileUrl,
      this.followers,
      this.following,
      this.totalFollowers,
      this.totalFollowing,
      this.totalPosts})
      : super(
          uid: uid,
          totalFollowing: totalFollowing,
          followers: followers,
          totalFollowers: totalFollowers,
          username: username,
          profileUrl: profileUrl,
          website: website,
          following: following,
          bio: bio,
          name: name,
          email: email,
          totalPosts: totalPosts,
        );

  factory UserModel.fromSnapshot(Map<String, dynamic> snapshot) {
    // var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel(
      email: snapshot['email'],
      name: snapshot['name'],
      bio: snapshot['bio'],
      username: snapshot['username'],
      totalFollowers: snapshot['totalFollowers'],
      totalFollowing: snapshot['totalFollowing'],
      totalPosts: snapshot['totalPosts'],
      uid: snapshot['uid'],
      website: snapshot['website'],
      profileUrl: snapshot['profileUrl'],
      followers: snapshot['followers'],
      following: snapshot["following"],
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
        "name": name,
        "username": username,
        "totalFollowers": totalFollowers,
        "totalFollowing": totalFollowing,
        "totalPosts": totalPosts,
        "website": website,
        "bio": bio,
        "profileUrl": profileUrl,
        "followers": followers,
        "following": following,
      };
}
