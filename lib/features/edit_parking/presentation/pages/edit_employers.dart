import 'package:eagle_valet_parking_mobile/features/add_new_parking/controller/bloc/add_employers_bloc/employer_bloc.dart';
import 'package:eagle_valet_parking_mobile/features/add_new_parking/controller/bloc/add_employers_bloc/employer_states.dart';
import 'package:eagle_valet_parking_mobile/features/edit_parking/presentation/pages/display_employers_in_parking.dart';
import 'package:eagle_valet_parking_mobile/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_employers_to_parking.dart';

class EditEmployers extends StatelessWidget {
  const EditEmployers(
      {super.key, required this.employersIds, required this.parkingId});
  final List<String> employersIds;
  final String parkingId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${S.current.edit} ${S.current.employers}")),
      body: BlocBuilder<AddEmployersCubit, EmployerStates>(
        builder: (BuildContext context, EmployerStates state) => Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddEmployersToParking(
                      parkingId: parkingId, emplyersIds: employersIds),
                ));
              },
              title: Text(S.current.addEmployers),
            ),
            ListTile(
              onTap: () {
                context.read<AddEmployersCubit>().readEmployers(parkingId);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const DisplayEmployersInParking(),
                ));
              },
              title: Text("${S.current.edit} ${S.current.employers}"),
            ),
          ],
        ),
      ),
    );
  }
}
