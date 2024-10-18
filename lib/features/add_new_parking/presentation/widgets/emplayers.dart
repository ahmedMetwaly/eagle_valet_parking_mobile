import 'package:eagle_valet_parking_mobile/features/auth/presentation/pages/login/presentation/widgets/password.dart';
import 'package:eagle_valet_parking_mobile/features/auth/presentation/pages/signup/presentation/widgets/phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../generated/l10n.dart';
import '../../../../core/constants/values_manager.dart';
import '../../../auth/presentation/pages/signup/presentation/widgets/name.dart';
import '../../../auth/presentation/pages/signup/presentation/widgets/national_id.dart';
import '../../controller/bloc/add_employers_bloc/employer_bloc.dart';
import '../../controller/bloc/add_employers_bloc/employer_states.dart';
import 'delete_employer.dart';

class Employers extends StatelessWidget {
  const Employers({
    super.key,
    this.fromEdit,
  });
  final bool? fromEdit;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddEmployersCubit, EmployerStates>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(PaddingManager.pInternalPadding),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(SizeManager.borderRadius),
              border: Border.all(
                color: Theme.of(context).colorScheme.onPrimary,
              )),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                      fromEdit == true
                          ? Icons.person
                          : Icons.person_add_rounded,
                      size: 30),
                  const SizedBox(width: SizeManager.sSpace),
                  Text(
                    fromEdit == true
                        ? S.current.employers
                        : S.current.addEmployers,
                    style: Theme.of(context).textTheme.headlineSmall,
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
                            ? fromEdit == true
                                ? DeleteEmployerBtn(
                                    index: index,
                                  )
                                : Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      S.current.firstEmployer,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ))
                            : DeleteEmployerBtn(
                                index: index,
                              ),
                        const SizedBox(height: SizeManager.sSpace),
                        Name(
                          nameController: AddEmployersCubit.employers[index][0],
                          title: S.current.name,
                          onChange: (value) {
                            AddEmployersCubit.employers[index][0].text = value;
                            AddEmployersCubit.employers[index][1].text = value;
                          },
                        ),
                        const SizedBox(height: 10),
                        NationalId(
                          controller: AddEmployersCubit.employers[index][2],
                          onChange: (value) {
                            if (value.toString().length == 12) {
                              AddEmployersCubit.employers[index][1].text +=
                                  value
                                      .toString()
                                      .substring(value.toString().length - 4);
                            } else {
                              AddEmployersCubit.employers[index][1].text =
                                  AddEmployersCubit.employers[index][0].text;
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        PhoneNumber(
                            controller: AddEmployersCubit.employers[index][3]),
                        const SizedBox(height: 10),
                        Name(
                          nameController: AddEmployersCubit.employers[index][1],
                          title: S.current.userName,
                          readOnly: true,
                        ),
                        const SizedBox(height: 10),
                        Passsword(
                          inputController: AddEmployersCubit.employers[index]
                              [4],
                          insideSignInPage: false,
                        ),
                        const SizedBox(height: 10),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemCount: AddEmployersCubit.employers.length),
              const SizedBox(height: SizeManager.sSpace16),
              TextButton.icon(
                  onPressed: () =>
                      context.read<AddEmployersCubit>().addNewEmployerCubit(),
                  icon: const Icon(Icons.add_circle_outline_rounded),
                  label: Text(S.current.addNewEmployer))
            ],
          ),
        );
      },
    );
  }
}
