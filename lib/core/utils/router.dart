import 'package:eagle_valet_parking_mobile/features/add_new_parking/presentation/pages/add_new_parking.dart';
import 'package:eagle_valet_parking_mobile/features/auth/presentation/pages/signup/presentation/screens/forget_password.dart';
import 'package:eagle_valet_parking_mobile/features/available_parking/presentaion/pages/available_parking.dart';
import 'package:flutter/material.dart';
import '../../features/auth/presentation/pages/first_time_opened/presentation/pages/first_time_opened.dart';
import '../../features/auth/presentation/pages/login/presentation/pages/login.dart';

import '../../features/auth/presentation/pages/signup/presentation/screens/reset_email.dart';
import '../../features/auth/presentation/pages/signup/presentation/screens/signup.dart';
import '../../features/auth/presentation/pages/splash_screen/splash_screen.dart';

import '../../features/available_parking/presentaion/pages/display_parking.dart';
import '../../features/edit_parking/presentation/pages/edit_parking.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/profile/screens/profile.dart';
import '../../generated/l10n.dart';
import 'routes.dart';

class RoutesGeneratour {
  static Route<dynamic> getRoute(RouteSettings route) {
    switch (route.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.appStarts:
        return MaterialPageRoute(builder: (_) => const AppStarts());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUp());

      case Routes.logIn:
        return MaterialPageRoute(builder: (_) => const LogIn());
      case Routes.profile:
        return MaterialPageRoute(
            builder: (_) => const Profile(), settings: route);
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case Routes.addNewParking:
        return MaterialPageRoute(builder: (_) => const AddNewParking());
      case Routes.availableParking:
        return MaterialPageRoute(builder: (_) => const AvailableParking());

      case Routes.displayParking:
        return MaterialPageRoute(
            builder: (_) => const DisplayParking(), settings: route);
      case Routes.editParking:
        return MaterialPageRoute(
            builder: (_) => const EditParking(), settings: route);
      case Routes.resetEmail:
        return MaterialPageRoute(
            builder: (_) => const ResetEmail(), settings: route);
      case Routes.forgetPassword:
        return MaterialPageRoute(
            builder: (_) => const ForgetPassword(), settings: route);

      default:
        return unFoundedRoute();
    }
  }

  static Route<dynamic> unFoundedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(title: Text(S.current.noRoute)),
              body: Center(child: Text(S.current.noRouteBody)),
            ));
  }
}
