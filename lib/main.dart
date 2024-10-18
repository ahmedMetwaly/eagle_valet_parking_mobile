import 'package:eagle_valet_parking_mobile/features/add_new_parking/controller/bloc/add_employers_bloc/employer_bloc.dart';
import 'package:eagle_valet_parking_mobile/features/add_new_parking/controller/bloc/parking_bloc/parking_bloc.dart';
import 'package:eagle_valet_parking_mobile/features/available_parking/controller/bloc/live_overview_cubit/live_overview_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/utils/router.dart';
import 'core/utils/routes.dart';
import 'core/utils/theme_manager.dart';
import 'features/auth/controller/auth_bloc/auth_bloc.dart';
import 'features/auth/controller/auth_bloc/auth_events.dart';
import 'features/auth/controller/shared_pref_bloc/sharedpref_bloc.dart';
import 'features/auth/controller/shared_pref_bloc/sharedpref_state.dart';
import 'features/profile/controller/bloc/user_bloc/user_bloc.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseAppCheck.instance.activate(); // Ensure activation.

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => SharedPrefBloc()..appStarted(),
      lazy: false,
    ),
    BlocProvider(
      create: (context) => AuthenticationBloc()..add(AppStarted()),
      lazy: false,
    ),
    BlocProvider(create: (context) => UserBloc()),
    BlocProvider(
      create: (context) => ParkingBloc()..getAvailableParking(),
    ),
    BlocProvider(
      create: (context) => AddEmployersCubit(),
    ),
    BlocProvider(
      create: (context) => LiveOverViewCubit(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SharedPrefBloc, SettingsStates>(
      builder: (BuildContext context, SettingsStates state) => MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: Locale(context.read<SharedPrefBloc>().lang),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        title: 'Eagle valet parking',
        theme: ThemeManager.lightTheme,
        initialRoute: Routes.splashScreen,
        onGenerateRoute: (settings) => RoutesGeneratour.getRoute(settings),
      ),
    );
  }
}
