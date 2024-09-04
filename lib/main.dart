import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_app_clone/firebase_options.dart';
import 'package:instagram_app_clone/src/core/routes/on_generate_route.dart';
import 'package:instagram_app_clone/src/features/presentation/logic/auth/auth_cubit.dart';
import 'package:instagram_app_clone/src/features/presentation/logic/credential/credential_cubit.dart';
import 'package:instagram_app_clone/src/features/presentation/logic/user/get_single_user/get_single_user_cubit.dart';
import 'package:instagram_app_clone/src/features/presentation/logic/user/user_cubit.dart';
import 'package:instagram_app_clone/src/features/presentation/page/credential/sign_in_page.dart';
import 'package:instagram_app_clone/src/features/presentation/page/main/main_screen.dart';
import 'package:instagram_app_clone/injection_container.dart' as di;

Future<void> main() async {
  // it was issues

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<AuthCubit>()..appStarted(context),
        ),
        BlocProvider(
          create: (context) => di.sl<CredentialCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<UserCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<GetSingleUserCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: false,
        ),
        onGenerateRoute: OnGenerateRoute.route,
        initialRoute: "/",
        routes: {
          "/": (context) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return MainScreen(uid: authState.uid);
                } else {
                  return const SignInPage();
                }
              },
            );
          }
        },
      ),
    );
  }
}
