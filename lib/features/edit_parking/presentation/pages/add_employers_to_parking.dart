import 'package:eagle_valet_parking_mobile/features/add_new_parking/controller/bloc/add_employers_bloc/employer_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/values_manager.dart';
import '../../../../core/widgets/dialogs.dart';
import '../../../../generated/l10n.dart';
import '../../../add_new_parking/controller/bloc/add_employers_bloc/employer_bloc.dart';
import '../../../add_new_parking/models/employer_model.dart';
import '../../../add_new_parking/presentation/widgets/delete_employer.dart';
import '../../../auth/presentation/pages/login/presentation/widgets/password.dart';
import '../../../auth/presentation/pages/signup/presentation/widgets/name.dart';
import '../../../auth/presentation/pages/signup/presentation/widgets/national_id.dart';
import '../../../auth/presentation/pages/signup/presentation/widgets/phone.dart';

class AddEmployersToParking extends StatefulWidget {
  const AddEmployersToParking(
      {super.key, required this.parkingId, required this.emplyersIds});
  final String parkingId;
  final List<String> emplyersIds;
  @override
  State<AddEmployersToParking> createState() => _AddEmployersToParkingState();
}

class _AddEmployersToParkingState extends State<AddEmployersToParking> {
  List<List<TextEditingController>> employers = [
    [
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController()
    ]
  ];
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddEmployersCubit, EmployerStates>(
      builder: (BuildContext context, EmployerStates state) => Scaffold(
        appBar: AppBar(
          title: Text(S.current.addEmployers),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: PaddingManager.pMainPadding),
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                    Theme.of(context).colorScheme.primary),
                foregroundColor: WidgetStateProperty.all(
                    Theme.of(context).colorScheme.surface)),
            onPressed: () {
              List<EmployerModel> emplayersData = [];
              if (formKey.currentState!.validate()) {
                for (int i = 0; i < employers.length; i++) {
                  emplayersData.add(EmployerModel(
                      parkingId: "",
                      name: employers[i][0].text,
                      userName: employers[i][1].text,
                      imageUrl: "",
                      nationalId: employers[i][2].text,
                      phoneNumber: employers[i][3].text,
                      password: employers[i][4].text));
                }
                context
                    .read<AddEmployersCubit>()
                    .addNewEmployers(
                        widget.parkingId, emplayersData, widget.emplyersIds)
                    .then((_) {
                  showSnackBarDialog(
                      context: context, title: S.current.employersAddedSucss);
                  // Navigator.of(context).pop();
                });
              }
            },
            child: Text(S.current.save),
          ),
        ),
        body: state is EmployerLoading
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
                  padding: const EdgeInsets.all(PaddingManager.pMainPadding),
                  child: Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.all(PaddingManager.pInternalPadding),
                    decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.2),
                        borderRadius:
                            BorderRadius.circular(SizeManager.borderRadius),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.onPrimary,
                        )),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.person_add_rounded, size: 30),
                              const SizedBox(width: SizeManager.sSpace),
                              Text(
                                S.current.addEmployers,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ],
                          ),
                          ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    index == 0
                                        ? const SizedBox()
                                        : DeleteEmployerBtn(
                                            function: () =>
                                                deleteEmployer(index: index)),
                                    const SizedBox(height: SizeManager.sSpace),
                                    Name(
                                      nameController: employers[index][0],
                                      title: S.current.name,
                                      onChange: (value) {
                                        employers[index][0].text = value;
                                        employers[index][1].text = value;
                                      },
                                    ),
                                    const SizedBox(height: 10),
                                    NationalId(
                                      controller: employers[index][2],
                                      onChange: (value) {
                                        if (value.toString().length == 14) {
                                          employers[index][1].text += value
                                              .toString()
                                              .substring(
                                                  value.toString().length - 4);
                                        } else {
                                          employers[index][1].text =
                                              employers[index][0].text;
                                        }
                                      },
                                    ),
                                    const SizedBox(height: 10),
                                    Phone(controller: employers[index][3]),
                                    const SizedBox(height: 10),
                                    Name(
                                      nameController: employers[index][1],
                                      title: S.current.userName,
                                      readOnly: true,
                                    ),
                                    const SizedBox(height: 10),
                                    Passsword(
                                      inputController: employers[index][4],
                                      insideSignInPage: false,
                                    ),
                                    const SizedBox(height: 10),
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 10),
                              itemCount: employers.length),
                          const SizedBox(height: SizeManager.sSpace16),
                          TextButton.icon(
                              onPressed: () => addNewEmployer(),
                              icon:
                                  const Icon(Icons.add_circle_outline_rounded),
                              label: Text(S.current.addNewEmployer))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  void addNewEmployer() {
    setState(() {
      employers.add([
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        TextEditingController(),
        TextEditingController()
      ]);
    });
  }

  void deleteEmployer({required int index}) {
    setState(() {
      employers.removeAt(index);
    });
    //  employersOfSpecificParking.removeAt(index);
  }
}
