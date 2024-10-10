import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

//import "../../../../../../../../core/constants/constants.dart";
//import "../../../../../../../../core/constants/image_manager.dart";
import "../../../../../../../core/utils/routes.dart";
import "../../../../../../../../core/constants/values_manager.dart";
import "../../../../../../../../core/widgets/elevated_button.dart";
import "../../../../../../../../generated/l10n.dart";
import "../../../../../controller/auth_bloc/auth_bloc.dart";
import "../../../../../controller/auth_bloc/auth_events.dart";
import "../../../../../controller/auth_bloc/auth_states.dart";
import "../widgets/email.dart";
import "../widgets/password.dart";
//import "../widgets/socialmedia_btn.dart";

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(PaddingManager.pMainPadding),
        child: BlocConsumer<AuthenticationBloc, AuthenticationStates>(
          builder: (BuildContext context, AuthenticationStates state) {
            return Form(
              key: formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.current.logIn,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: SizeManager.s80),
                    Column(
                      children: [
                        Email(inputController: emailController),
                        const SizedBox(height: SizeManager.sSpace),
                        Passsword(
                            inputController: passwordController,
                            insideSignInPage: true),
                        const SizedBox(height: SizeManager.sSpace16),
                       GestureDetector(
                          onTap: () => Navigator.of(context)
                              .pushNamed(Routes.forgetPassword),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(S.current.forgotPassword),
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
                          title: S.current.logIn.toUpperCase(),
                          onPress: () {
                            if (formKey.currentState!.validate()) {
                              AuthenticationBloc.user.email =
                                  emailController.text.trim().toString();
                              AuthenticationBloc.user.password =
                                  passwordController.text.trim().toString();
                              context
                                  .read<AuthenticationBloc>()
                                  .add(SignInWithEmailEvent());
                          //    print("valide");
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: SizeManager.sSpace16),
                    Center(child: Text(S.current.or)),
                    const SizedBox(height: SizeManager.sSpace16),
                    MyElevatedButton(
                      onPress: () => Navigator.of(context)
                          .pushReplacementNamed(Routes.signUp),
                      title: S.current.createAccount,
                    ),
                  ],
                ),
              ),
            );
          },
          listener: (BuildContext context, AuthenticationStates state) {
           // print(state);
            if (state is AuthenticationSuccessState) {
              final currentUser = FirebaseAuth.instance.currentUser;
              // Navigator.pop(context);

              if (currentUser != null) {
                Navigator.pushReplacementNamed(context, Routes.home);
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
              // Navigator.pop(context);
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
        ),
      )),
    );
  }
}
