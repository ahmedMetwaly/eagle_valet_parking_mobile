import 'package:eagle_valet_parking_mobile/core/constants/values_manager.dart';
import 'package:eagle_valet_parking_mobile/features/add_new_parking/controller/bloc/parking_bloc/parking_bloc.dart';
import 'package:eagle_valet_parking_mobile/features/add_new_parking/controller/bloc/parking_bloc/parking_states.dart';
import 'package:eagle_valet_parking_mobile/features/add_new_parking/presentation/widgets/parking_information.dart';
import 'package:eagle_valet_parking_mobile/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../add_new_parking/models/parking_model.dart';

class EditParkingInfromation extends StatelessWidget {
  const EditParkingInfromation({
    super.key,
    required this.parking,
  });
  final ParkingModel parking;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${S.current.edit} ${S.current.parkingInformation}"),
      ),
      body: BlocBuilder<ParkingBloc, ParkingStates>(
                builder: (BuildContext context, ParkingStates state) {
               //   print(state);
      final TextEditingController parkingName =
          TextEditingController(text: parking.parkingName);
      final TextEditingController capacity =
          TextEditingController(text: parking.capacity.toString());
      final TextEditingController parkingFee =
          TextEditingController(text: parking.price.toString());
      final formKey = GlobalKey<FormState>();
      if(state is LoadingParking){
        return  Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                   const CircularProgressIndicator(),
                    const SizedBox(height: 10),
                    Text(state.progress),
                  ],
                ),
              );
      }
      return Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(PaddingManager.pMainPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ParkingInformation(
                  parkingName: parkingName,
                  capacity: capacity,
                  parkingFee: parkingFee),
                  const SizedBox(height: 20),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                        Theme.of(context).colorScheme.primary),
                    foregroundColor: WidgetStateProperty.all(
                        Theme.of(context).colorScheme.surface),
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      ParkingModel garge = ParkingModel(
                          parkingId: parking.parkingId,
                          parkingName: parkingName.text,
                          capacity: int.parse(capacity.text),
                          price: int.parse(parkingFee.text));
                      context
                          .read<ParkingBloc>()
                          .editParkingInfromation(garge)
                          .then((_) {
                        Navigator.of(context).pop();
                      });
                    }
                  },
                  child: Text(S.current.save))
            ],
          ),
        ),
      );
                },
              ),
    );
  }
}
