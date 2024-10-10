import 'package:eagle_valet_parking_mobile/core/constants/values_manager.dart';
import 'package:eagle_valet_parking_mobile/core/utils/media_query_utils.dart';
import 'package:eagle_valet_parking_mobile/features/add_new_parking/controller/bloc/add_employers_bloc/employer_bloc.dart';
import 'package:eagle_valet_parking_mobile/features/add_new_parking/controller/bloc/add_employers_bloc/employer_states.dart';
import 'package:eagle_valet_parking_mobile/features/add_new_parking/models/employer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/dialogs.dart';
import '../../../../core/widgets/input_number.dart';
import '../../../../generated/l10n.dart';
import '../../../auth/presentation/pages/login/presentation/widgets/password.dart';
import '../../../auth/presentation/pages/signup/presentation/widgets/name.dart';
import '../../../auth/presentation/pages/signup/presentation/widgets/phone.dart';

class EditEmployersINParking extends StatelessWidget {
  const EditEmployersINParking({super.key, required this.employer});
  final EmployerModel employer;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController name = TextEditingController(text: employer.name);
    TextEditingController userName =
        TextEditingController(text: employer.userName);
    TextEditingController nationalId =
        TextEditingController(text: employer.nationalId);
    TextEditingController phone =
        TextEditingController(text: employer.phoneNumber);
    TextEditingController password =
        TextEditingController(text: employer.password);
    return BlocBuilder<AddEmployersCubit, EmployerStates>(
      builder: (BuildContext context, EmployerStates state) => Scaffold(
        appBar: AppBar(
          title: Text("${S.current.edit} ${employer.name}"),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(PaddingManager.pMainPadding),
          child: SizedBox(
            height: MediaQueryUtils.getHeightPercentage(context, 0.131),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //save edit
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                        Theme.of(context).colorScheme.primary),
                    foregroundColor: WidgetStateProperty.all(
                        Theme.of(context).colorScheme.surface),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context
                          .read<AddEmployersCubit>()
                          .updateEmployer(
                              parkingId: employer.parkingId!,
                              employerId: employer.uid!,
                              name: name.text,
                              userName: userName.text,
                              nationalId: nationalId.text,
                              phoneNumber: phone.text,
                              password: password.text)
                          .then((_) {
                        showSnackBarDialog(
                            context: context,
                            title: S.current.employerEditSuccess);
                      });
                    }
                  },
                  child: Text(S.current.save),
                ),
                // delete employer
                ElevatedButton(
                  style: ButtonStyle(
                    side: WidgetStateProperty.all(BorderSide(
                      color: Theme.of(context).colorScheme.error,
                    )),
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                                title: Text(S.of(context).delete),
                                content:
                                    Text(S.of(context).delete_employer_message),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      context
                                          .read<AddEmployersCubit>()
                                          .deleteEmployer(employer.uid!)
                                          .then((_) {
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    child: Text(S.of(context).ok),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(S.of(context).cancel),
                                  ),
                                ]));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.delete,
                          color: Theme.of(context).colorScheme.error),
                      const SizedBox(width: 10),
                      Text(
                        S.current.delete,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.error),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: state is EmployerLoading
              ? Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(),
                        const SizedBox(height: 10),
                        Text(state.progress)
                      ]),
                )
              : Form(
                  key: formKey,
                  child: Padding(
                      padding:
                          const EdgeInsets.all(PaddingManager.pMainPadding),
                      child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(
                              PaddingManager.pInternalPadding),
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.2),
                              borderRadius: BorderRadius.circular(
                                  SizeManager.borderRadius),
                              border: Border.all(
                                color: Theme.of(context).colorScheme.onPrimary,
                              )),
                          child: SingleChildScrollView(
                            child: Column(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(Icons.edit, size: 30),
                                  const SizedBox(width: SizeManager.sSpace),
                                  Text(
                                    "${S.current.edit} ${S.current.employer}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Name(
                                nameController: name,
                                title: S.current.name,
                              ),
                              const SizedBox(height: 10),
                              Name(
                                nameController: userName,
                                title: S.current.userName,
                              ),
                              const SizedBox(height: 10),
                              InputNumber(
                                  controller: nationalId,
                                  label: S.current.nationalId),
                              const SizedBox(height: 10),
                              Phone(controller: phone),
                              const SizedBox(height: 10),
                              Passsword(
                                inputController: password,
                                insideSignInPage: false,
                              ),
                              const SizedBox(height: 10),
                            ]),
                          )))),
        ),
      ),
    );
  }
}
