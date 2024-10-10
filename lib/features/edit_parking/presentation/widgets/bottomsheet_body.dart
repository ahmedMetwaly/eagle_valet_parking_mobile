import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/values_manager.dart';
import '../../../../generated/l10n.dart';
import '../../../add_new_parking/controller/bloc/add_employers_bloc/employer_bloc.dart';
import '../../../add_new_parking/controller/bloc/add_employers_bloc/employer_states.dart';
import '../pages/add_employers_to_parking.dart';
import '../pages/display_employers_in_parking.dart';
import 'which_edit.dart';

class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({
    super.key, required this.parkingId, required this.employersId,
  });
final String parkingId;
final List<String> employersId;
  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<AddEmployersCubit, EmployerStates>(
                    builder: (BuildContext context,
                            EmployerStates employerStates) =>Container(
        height:
            MediaQuery.of(context).size.height *
                0.3,
        width: double.infinity,
        padding: const EdgeInsets.all(
            PaddingManager.pInternalPadding),
        decoration: BoxDecoration(
          color: Theme.of(context)
              .colorScheme
              .surface,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(
                  SizeManager.bottomSheetRadius),
              topRight: Radius.circular(
                  SizeManager.bottomSheetRadius)),
        ),
        child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.center,
            mainAxisAlignment:
                MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: SizeManager.sSpace,
              ),
              Center(
                child: Text(
                  S.current.employers,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall,
                ),
              ),
              Divider(
                  color: Theme.of(context)
                      .colorScheme
                      .primary
                      .withOpacity(0.4)),
              Row(
                children: [
                  Expanded(
                    child: WhichEdit(
                        title: S
                            .current.addEmployers,
                        icon: Icons
                            .person_add_rounded,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  AddEmployersToParking(
                                      parkingId: parkingId,
                                      emplyersIds: employersId)));
                        }),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                      child: WhichEdit(
                          onPressed: () {
                            context
                                .read<
                                    AddEmployersCubit>()
                                .readEmployers(parkingId);
                            Navigator.of(context)
                                .push(
                                    MaterialPageRoute(
                              builder: (context) =>
                                  const DisplayEmployersInParking(),
                            ));
                          },
                          icon: Icons.edit,
                          title:
                              S.current.editEmployees)),
                ],
              )
            ])));
  }
}
