import 'package:eagle_valet_parking_mobile/core/constants/values_manager.dart';
import 'package:eagle_valet_parking_mobile/core/widgets/dialogs.dart';
import 'package:eagle_valet_parking_mobile/features/add_new_parking/controller/bloc/parking_bloc/parking_bloc.dart';
import 'package:eagle_valet_parking_mobile/features/add_new_parking/controller/bloc/parking_bloc/parking_states.dart';
import 'package:eagle_valet_parking_mobile/features/available_parking/controller/bloc/live_overview_cubit/live_overview_cubit.dart';
import 'package:eagle_valet_parking_mobile/features/available_parking/presentaion/pages/available_parking.dart';
import 'package:eagle_valet_parking_mobile/features/edit_parking/presentation/pages/edit_parking_infromation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';
import '../../../add_new_parking/models/parking_model.dart';
import '../widgets/bottomsheet_body.dart';
import '../widgets/choice.dart';


class EditParking extends StatelessWidget {
  const EditParking({super.key});
  @override
  Widget build(BuildContext context) {
    ParkingModel parking =
        ModalRoute.of(context)!.settings.arguments as ParkingModel;
    return BlocProvider(
      create: (_) => LiveOverViewCubit()..listenToDocument(parking.parkingId!),
      child: Scaffold(
        appBar: AppBar(
          title: Text("${S.current.edit} ${parking.parkingName}"),
        ),
        body: BlocBuilder<LiveOverViewCubit, DocumentState>(
          builder: (BuildContext context, DocumentState state) => Padding(
            padding: const EdgeInsets.all(PaddingManager.pMainPadding),
            child: BlocBuilder<ParkingBloc, ParkingStates>(
              builder: (BuildContext context, ParkingStates parkingState) =>
                  parkingState is LoadingParking
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const CircularProgressIndicator(),
                              const SizedBox(height: 10),
                              Text(parkingState.progress),
                            ],
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Choice(
                                onPressed: () => Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          EditParkingInfromation(
                                        parking: state.data!,
                                      ),
                                    )),
                                icon: Icons.local_parking_rounded,
                                color: Theme.of(context).colorScheme.primary,
                                title:
                                    "${S.current.edit} ${S.current.parkingInformation}"),
                            //  const SizedBox(height: 20,),

                            Choice(
                                icon: Icons.person,
                                title: S.current.employers,
                                color: Theme.of(context).colorScheme.onPrimary,
                                onPressed: () {
                                //  print(state.data!.capacity!);
                                  showModalBottomSheet(
                                      context: context,
                                      backgroundColor: Colors.transparent,
                                      useSafeArea: true,
                                      builder: (context) => BottomSheetBody(
                                          parkingId: state.data!.parkingId!,
                                          employersId:
                                              state.data!.employerIds!));
                                }),
                            Choice(
                              icon: Icons.delete,
                              title: S.current.delete,
                              color: Theme.of(context).colorScheme.error,
                              onPressed: () async {
                                await context
                                    .read<ParkingBloc>()
                                    .deleteThisParking(state.data!.parkingId!,
                                        state.data!.employerIds!)
                                    .then((_) {
                                  Navigator.of(context).pop();
                                  showSnackBarDialog(
                                    context: context,
                                    title: S.current.parkingDeletedSuccessfully,
                                    screen: const AvailableParking(),
                                  );
                                });
                              },
                            ),
                          ],
                        ),
            ),
          ),
        ),
      ),
    );
  }
}
