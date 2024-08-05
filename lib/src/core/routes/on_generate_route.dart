import 'package:flutter/material.dart';
import 'package:instagram_app_clone/src/core/routes/names_route.dart';
import 'package:instagram_app_clone/src/features/presentation/page/credential/sign_in_page.dart';
import 'package:instagram_app_clone/src/features/presentation/page/credential/sign_up_page.dart';
import 'package:instagram_app_clone/src/features/presentation/page/post/comment/comment_page.dart';
import 'package:instagram_app_clone/src/features/presentation/page/post/update_post_page.dart';
import 'package:instagram_app_clone/src/features/presentation/page/profile/edit_profile_page.dart';

class OnGenerateRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case PageConst.signInPage:
        {
          return routeBuilder(const SignInPage());
        }
      case PageConst.signUpPage:
        {
          return routeBuilder(const SignUpPage());
        }
      case PageConst.editProfilePage:
        {
          return routeBuilder(const EditProfilePage());
        }
      case PageConst.updatePostPage:
        {
          return routeBuilder(const UpdatePostPage());
        }
      case PageConst.commentPage:
        {
          return routeBuilder(const CommentPage());
        }
      default:
        {
          const NoPageFound();
        }
    }
    return null;
  }
}

dynamic routeBuilder(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}

class NoPageFound extends StatelessWidget {
  const NoPageFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page not found"),
      ),
      body: const Center(
        child: Text("Page not found"),
      ),
    );
  }
}
