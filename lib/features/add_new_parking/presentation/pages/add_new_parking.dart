import 'package:eagle_valet_parking_mobile/core/utils/routes.dart';
import 'package:eagle_valet_parking_mobile/features/add_new_parking/controller/bloc/add_employers_bloc/employer_states.dart';
import 'package:eagle_valet_parking_mobile/features/add_new_parking/controller/bloc/parking_bloc/parking_bloc.dart';
import 'package:eagle_valet_parking_mobile/features/add_new_parking/controller/bloc/parking_bloc/parking_states.dart';
import 'package:eagle_valet_parking_mobile/features/add_new_parking/models/parking_model.dart';
import 'package:eagle_valet_parking_mobile/features/add_new_parking/presentation/widgets/emplayers.dart';
import 'package:eagle_valet_parking_mobile/features/add_new_parking/models/employer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/values_manager.dart';
import '../../../../generated/l10n.dart';
import '../../controller/bloc/add_employers_bloc/employer_bloc.dart';
import '../widgets/parking_information.dart';

class AddNewParking extends StatelessWidget {
  const AddNewParking({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController parkingName = TextEditingController();
    final TextEditingController capacity = TextEditingController();
    final TextEditingController parkingFee = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return BlocConsumer<ParkingBloc, ParkingStates>(
      builder: (BuildContext context, ParkingStates state) => state
              is LoadingParking
          ? Scaffold(
              appBar: AppBar(
                title: Text(S.current.addNewParking),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 10),
                    Text(state.progress),
                  ],
                ),
              ),
            )
          : Form(
              key: formKey,
              child: Scaffold(
                appBar: AppBar(
                  title: Text(S.current.addNewParking),
                  leading: BlocBuilder<AddEmployersCubit, EmployerStates>(
                    builder: (BuildContext context, EmployerStates state) =>
                        IconButton(
                            onPressed: () {
                                context.read<AddEmployersCubit>().getInitial();
                            Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.arrow_back)),
                  ),
                ),
                bottomNavigationBar: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, bottom: 10.0),
                  child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          ParkingBloc.parking = ParkingModel(
                            parkingId: "",
                            parkingName: parkingName.text,
                            price: int.parse(parkingFee.text),
                            capacity: int.parse(capacity.text),
                            employerIds: [],
                            incomeOfDay: [],
                            tickets: [],
                          );
                          for (int i = 0;
                              i < AddEmployersCubit.employers.length;
                              i++) {
                            ParkingBloc.employers.add(EmployerModel(
                                parkingId: "",
                                name: AddEmployersCubit.employers[i][0].text,
                                userName:
                                    AddEmployersCubit.employers[i][1].text,
                                imageUrl: "",
                                nationalId:
                                    AddEmployersCubit.employers[i][2].text,
                                phoneNumber:
                                    AddEmployersCubit.employers[i][3].text,
                                password:
                                    AddEmployersCubit.employers[i][4].text));
                          }
                          context.read<ParkingBloc>().addNewParking();
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            Theme.of(context).colorScheme.primary),
                      ),
                      child: Text(
                        S.current.addParking,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.surface),
                      )),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(PaddingManager.pMainPadding),
                  child: SingleChildScrollView(
                    child: Column(children: [
                      ParkingInformation(
                          parkingName: parkingName,
                          capacity: capacity,
                          parkingFee: parkingFee),
                      const SizedBox(height: SizeManager.sSpace16),
                      const Employers(),
                    ]),
                  ),
                ),
              ),
            ),
      listener: (BuildContext context, ParkingStates state) {
        if (state is ParkingAddded) {
          Navigator.pushNamed(context, Routes.home);
          ParkingBloc.employers = [];
          ParkingBloc.parking = ParkingModel();
          AddEmployersCubit.employers = [
            [
              TextEditingController(),
              TextEditingController(),
              TextEditingController(),
              TextEditingController(),
              TextEditingController()
            ]
          ];
        }
        /* if (state is LoadingParking) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } */

        if (state is ParkingFailed) {
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
              content: Text(state.error),
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
    );
  }
}
