import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//import '../../../../../../../../core/constants/constants.dart';
//import '../../../../../../../../core/constants/image_manager.dart';
import '../../../../../../../core/utils/routes.dart';
import '../../../../../../../../core/utils/values.dart';
import '../../../../../../../../core/widgets/elevated_button.dart';
import '../../../../../../../../generated/l10n.dart';

import '../../../../../controller/auth_bloc/auth_bloc.dart';
import '../../../../../controller/auth_bloc/auth_events.dart';
import '../../../../../controller/auth_bloc/auth_states.dart';
import '../../../../../data/models/user/user.dart';
import '../../../login/presentation/widgets/email.dart';
import '../../../login/presentation/widgets/password.dart';

import '../widgets/name.dart';
import '../widgets/phone.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final phoneNumber = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(PaddingManager.pMainPadding),
        child: BlocListener<AuthenticationBloc, AuthenticationStates>(
          listener: (BuildContext context, AuthenticationStates state) {
           // print(state);
            if (state is AuthenticationSuccessState) {
              final currentUser = FirebaseAuth.instance.currentUser;

              if (currentUser != null) {
                Navigator.pushReplacementNamed(context, Routes.home);
              } else {
               // print('no user found');
              }
            }
            if (state is AuthinticationLoadingState) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (state is LoadedState) {
              Navigator.pop(context);
            }
            if (state is AuthenticationFailedState) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => AlertDialog(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.current.error,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.error)),
                      Divider(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ],
                  ),
                  content: Text(state.errorMessage),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: Text(S.current.ok),
                    ),
                  ],
                ),
              );
            }
          },
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.current.signup,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: SizeManager.sSpace32),
                  Column(
                    children: [
                      Name(
                        nameController: nameController,
                        title: S.current.name,
                      ),
                      const SizedBox(
                        height: SizeManager.sSpace,
                      ),
                      Email(inputController: emailController),
                      const SizedBox(
                        height: SizeManager.sSpace,
                      ),
                      Passsword(
                          inputController: passwordController,
                          insideSignInPage: false),
                      const SizedBox(
                        height: SizeManager.sSpace,
                      ),
                      PhoneNumber(controller: phoneNumber),
                      const SizedBox(
                        height: SizeManager.sSpace,
                      ),
                      //  const Address(),
                      const SizedBox(height: SizeManager.sSpace16),
                      GestureDetector(
                        onTap: () => Navigator.of(context)
                            .pushReplacementNamed(Routes.logIn),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(S.current.alreadyHaveAccoount),
                            Icon(
                              Icons.arrow_forward_rounded,
                              size: SizeManager.sIconSize,
                              color: Theme.of(context).colorScheme.primary,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: SizeManager.sSpace32),
                      MyElevatedButton(
                        key: const Key("goHome"),
                        title: S.current.signup.toUpperCase(),
                        onPress: () {
                          if (formKey.currentState!.validate()) {
                            AuthenticationBloc.user = UserModel(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              imageUrl: AuthenticationBloc.user.imageUrl,
                              phoneNumber: phoneNumber.text,
                            );
                            context
                                .read<AuthenticationBloc>()
                                .add(SignUpEvent());
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
