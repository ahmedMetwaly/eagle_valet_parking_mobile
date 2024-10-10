import 'package:eagle_valet_parking_mobile/features/auth/presentation/pages/signup/presentation/widgets/phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/values_manager.dart';
import '../../../generated/l10n.dart';
import '../../auth/controller/auth_bloc/auth_bloc.dart';
import '../../auth/presentation/pages/signup/presentation/widgets/name.dart';
import '../controller/bloc/user_bloc/user_bloc.dart';
import '../controller/bloc/user_bloc/user_event.dart';
import '../controller/bloc/user_bloc/user_state.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (BuildContext context, UserState state) => ListTile(
          onTap: () {
            TextEditingController nameController =
                TextEditingController(text: AuthenticationBloc.user.name);
            TextEditingController phoneController = TextEditingController(
                text: AuthenticationBloc.user.phoneNumber);
            final formKey = GlobalKey<FormState>();
            showBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              //  useSafeArea: true,
              builder: (ctx) => Form(
                key: formKey,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  padding:
                      const EdgeInsets.all(PaddingManager.pInternalPadding),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 204, 173, 81),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(SizeManager.bottomSheetRadius),
                        topRight:
                            Radius.circular(SizeManager.bottomSheetRadius)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: SizeManager.sSpace,
                          ),
                          Center(
                            child: Text(
                              S.current.editProfile,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                          Divider(
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.4),
                          ),
                        ],
                      ),
                      Name(
                          nameController: nameController,
                          title: S.current.name,
                          maxLines: 1),
                    //  const SizedBox(height: 10),
                      Phone(controller: phoneController),
                      ElevatedButton(
                          style: ButtonStyle(
                              padding: const WidgetStatePropertyAll(
                                  EdgeInsets.symmetric(horizontal: 80)),
                              backgroundColor: WidgetStatePropertyAll(
                                  Theme.of(context).colorScheme.primary),
                              foregroundColor: WidgetStatePropertyAll(
                                  Theme.of(context).colorScheme.surface)),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              AuthenticationBloc.user.name =
                                  nameController.text;
                                    AuthenticationBloc.user.phoneNumber =
                                  phoneController.text;
                              context
                                  .read<UserBloc>()
                                  .add(UpdateUserDataEvent());
                              Navigator.of(context).pop();
                            }
                          },
                          child: Text(S.current.save))
                    ],
                  ),
                ),
              ),
            );
          },
          contentPadding: const EdgeInsets.all(0),
          title: Text(S.current.editProfile,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary)),
          trailing: const Icon(Icons.arrow_forward_ios_rounded)),
    );
  }
}
