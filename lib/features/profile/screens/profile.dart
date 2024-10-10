import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "../../../../generated/l10n.dart";
import "../../../core/constants/values_manager.dart";
import "../../../core/utils/routes.dart";
import "../../../core/widgets/image_from_network.dart";
import "../../auth/controller/auth_bloc/auth_bloc.dart";
import "../../auth/controller/auth_bloc/auth_events.dart";
import "../../auth/controller/auth_bloc/auth_states.dart";
import "../../auth/data/models/user/user.dart";
import "../widgets/change_lang.dart";
import "../widgets/change_profile_image.dart";
import "../widgets/edit_name.dart";
import "../widgets/user_info.dart";

class Profile extends StatelessWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            S.current.myProfile,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        body: BlocConsumer<AuthenticationBloc, AuthenticationStates>(
          builder: (BuildContext context, AuthenticationStates state) =>
              SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(PaddingManager.pMainPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  state is AuthenticationSuccessState
                      ? const ChangeProfileImageWidget()
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(150),
                          child: ImageFromNetwork(
                            imagePath: AuthenticationBloc.user.imageUrl ?? "",
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                  const UserInfo(),
                  // const ChangeTheme(),

                  const EditProfile(),
                  Divider(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.4)),
                  BlocListener<AuthenticationBloc, AuthenticationStates>(
                    listener:
                        (BuildContext context, AuthenticationStates state) {
                      if (state is ForgetPasswordEmailSentState) {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed(Routes.resetEmail);
                      }
                    },
                    child: ListTile(
                      onTap: () {
                        // AuthenticationBloc.user.email ;
                        context
                            .read<AuthenticationBloc>()
                            .add(ForgetPasswordEvent());
                      },
                      contentPadding: const EdgeInsets.all(0),
                      title: Text(S.current.changePassword,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.primary)),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ),
                  Divider(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.4)),
                  const ChangeLanguageWidget(),

                  const Spacer(),
                  ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                            Theme.of(context).colorScheme.primary),
                        foregroundColor: WidgetStateProperty.all(
                            Theme.of(context).colorScheme.surface),
                      ),
                      onPressed: () {
                        if (state is AuthenticationSuccessState) {
                          showDialog<bool>(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(S.current.confirmLogout),
                                content: Text(S.current.logoutDescription),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        context
                                            .read<AuthenticationBloc>()
                                            .add(SignOutEvent());
                                        Navigator.pop(context, true);
                                      },
                                      child: Text(S.current.ok)),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, true),
                                    child: Text(S.current.cancel),
                                  )
                                ],
                              );
                            },
                          );
                        }
                        if (state is AuthLogedOutState) {
                          Navigator.of(context).pushNamed(Routes.logIn);
                        }
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          state is AuthenticationSuccessState
                              ? S.current.logOut
                              : S.current.logIn,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.surface),
                        ),
                      )),
                ],
              ),
            ),
          ),
          listener: (BuildContext context, AuthenticationStates state) {
            if (state is AuthLogedOutState) {
              AuthenticationBloc.user = UserModel(
                uid: "0",
                name: S.current.guest,
                email: "",
                imageUrl: "",
                password: "",
                phoneNumber: "",
              );
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(Routes.logIn, (route) => false);
            }
          },
        ));
  }
}
