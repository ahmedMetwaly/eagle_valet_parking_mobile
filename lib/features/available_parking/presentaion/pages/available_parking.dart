import 'package:eagle_valet_parking_mobile/core/constants/values_manager.dart';
import 'package:eagle_valet_parking_mobile/core/utils/translate.dart';
import 'package:eagle_valet_parking_mobile/features/add_new_parking/controller/bloc/parking_bloc/parking_bloc.dart';
import 'package:eagle_valet_parking_mobile/features/add_new_parking/controller/bloc/parking_bloc/parking_states.dart';
import 'package:eagle_valet_parking_mobile/features/available_parking/models/parking_data.dart';
import 'package:eagle_valet_parking_mobile/features/available_parking/presentaion/widgets/compare_between_parkings.dart';
import 'package:eagle_valet_parking_mobile/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../core/utils/routes.dart';
import '../widgets/search_parking.dart';

class AvailableParking extends StatelessWidget {
  const AvailableParking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(S.current.availableParking),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.home);
              },
            ),
          
          actions: [
            IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: MySearchDelegate(context
                          .read<ParkingBloc>()
                          .parkings
                          .map((parking) => ParkingData(
                              parkingId: parking.parkingId!,
                              parkingTitle: parking.parkingName!))
                          .toList()));
                })
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(PaddingManager.pMainPadding),
            child: BlocBuilder<ParkingBloc, ParkingStates>(
                builder: (context, state) {
              if (state is LoadingParking) {
                return Center(
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
              if (state is GetAvailableParking) {
                return Column(
                  children: [
                    CompareBetweenParkings(
                      parkings: state.availableParking,
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      flex: 3,
                      child: ListView.separated(
                        itemCount: context.read<ParkingBloc>().parkings.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              title: Text(
                                state.availableParking[index].parkingName!,
                                style: const TextStyle(fontSize: 18),
                              ),
                              subtitle: Text(state
                                      .availableParking[index].tickets!.isEmpty
                                  ? "${S.current.totalCustomersOfToday}: ٠"
                                  : "${S.current.totalCustomersOfToday}: ${Intl.getCurrentLocale() == "ar" ? Translate().translateNumberToArabic(state.availableParking[index].tickets!.length.toString()) : state.availableParking[index].tickets!.length}"),
                              trailing: Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Theme.of(context).colorScheme.primary,
                                size: 20,
                              ),
                              onTap: () {
                                ParkingData data = ParkingData(
                                    parkingId: context
                                        .read<ParkingBloc>()
                                        .parkings[index]
                                        .parkingId!,
                                    parkingTitle: context
                                        .read<ParkingBloc>()
                                        .parkings[index]
                                        .parkingName!);
                               // print(data.parkingId);
                                Navigator.of(context).pushNamed(
                                    Routes.displayParking,
                                    arguments: data);
                              });
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                      ),
                    ),
                  ],
                );
              }
              if (state is ParkingFailed) {
                return Center(child: Text(state.error));
              }
              return const Center(child: CircularProgressIndicator());
            })));
  }
}
