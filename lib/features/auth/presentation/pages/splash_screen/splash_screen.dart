import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

import "package:flutter_bloc/flutter_bloc.dart";

import "../../../../../core/utils/image_manager.dart";
import "../../../../../core/utils/routes.dart";
import "../../../../../../core/utils/values.dart";
import "../../../controller/auth_bloc/auth_bloc.dart";
import "../../../controller/auth_bloc/auth_states.dart";
import "../../../controller/shared_pref_bloc/sharedpref_bloc.dart";
import "../../../controller/shared_pref_bloc/sharedpref_state.dart";


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationStates>(
      builder: (BuildContext context, AuthenticationStates authState) {
      //  print(authState);
        return BlocListener<SharedPrefBloc, SettingsStates>(
            listener: (context, state) {
              if (state is SettingsLoadedSuccessfully) {
              /*   print("in shared");
                print("isOpenedBefore : ${state.isOpenedBefore}");
              */   if (state.isOpenedBefore! && authState is AuthLogedOutState) {
                  Navigator.of(context).pushReplacementNamed(Routes.logIn);
                } else if (state.isOpenedBefore! &&
                    authState is AuthenticationSuccessState) {
                  Navigator.of(context).pushReplacementNamed(Routes.home);
                } else if (!state.isOpenedBefore!) {
                  Navigator.of(context).pushReplacementNamed(Routes.appStarts);
                }
              }
            },
            child: Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageManager.splash,
                      height: SizeManager.splashIconSize,
                      width: SizeManager.splashIconSize,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: SizeManager.sSpace,
                    ),
                    const CircularProgressIndicator(),
                  ],
                ),
              ),
            ));
      },
      listener: (BuildContext context, AuthenticationStates state)  {
          final currentUser =  FirebaseAuth.instance.currentUser;
          if (state is AuthenticationSuccessState &&
               currentUser!=null) {
            //print("the email verified");
            Navigator.of(context).pushReplacementNamed(Routes.home);
          }
        
      },
    );
  }
}
