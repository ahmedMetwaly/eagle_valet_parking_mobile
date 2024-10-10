import 'dart:math';

import 'package:eagle_valet_parking_mobile/core/constants/values_manager.dart';
import 'package:eagle_valet_parking_mobile/core/utils/image_manager.dart';
import 'package:eagle_valet_parking_mobile/features/add_new_parking/controller/bloc/add_employers_bloc/employer_bloc.dart';
import 'package:eagle_valet_parking_mobile/features/add_new_parking/controller/bloc/add_employers_bloc/employer_states.dart';
import 'package:eagle_valet_parking_mobile/features/edit_parking/presentation/pages/edit_employers_in_parking.dart';
import 'package:eagle_valet_parking_mobile/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../core/utils/media_query_utils.dart';

class DisplayEmployersInParking extends StatelessWidget {
  const DisplayEmployersInParking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${S.current.edit}  ${S.current.employers}"),
      ),
      body: BlocBuilder<AddEmployersCubit, EmployerStates>(
        builder: (context, state) {
          if (state is EmployerLoading) {
            return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(),
                      const SizedBox(height: 10),
                      Text(state.progress)
                    ]),
              )
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              
              ;
          }
          return Padding(
            padding: const EdgeInsets.all(PaddingManager.pMainPadding),
            child: ListView.builder(
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditEmployersINParking(
                            employer: AddEmployersCubit
                                .employersOfSpecificParking[index]),
                      ));
                },
                child: Stack(children: [
                  SizedBox(
                      height:
                          MediaQueryUtils.getHeightPercentage(context, 0.33),
                      width: double.infinity,
                      child: Intl.getCurrentLocale() == "ar"
                          ? Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()
                                ..rotateY(pi), // Flip horizontally
                              child: Image.asset(
                                ImageManager.card,
                                height: MediaQueryUtils.getHeightPercentage(
                                    context, 0.33),
                                fit: BoxFit.fitWidth,
                              ), // Replace with your image asset
                            )
                          : Image.asset(
                              ImageManager.card,
                              height: MediaQueryUtils.getHeightPercentage(
                                  context, 0.33),
                              fit: BoxFit.fitWidth,
                            )),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQueryUtils.getHeightPercentage(context, 0.1),
                      bottom:
                          MediaQueryUtils.getHeightPercentage(context, 0.02),
                      left: MediaQueryUtils.getHeightPercentage(context, 0.02),
                      right: MediaQueryUtils.getHeightPercentage(context, 0.02),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${S.current.name}: ${AddEmployersCubit.employersOfSpecificParking[index].name}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                          fontSize: 22,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface)),
                              Text(
                                  "${S.current.nationalId}: ${AddEmployersCubit.employersOfSpecificParking[index].nationalId}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface
                                              .withOpacity(0.8))),
                              Text(
                                  "${S.current.phoneNumber}: ${AddEmployersCubit.employersOfSpecificParking[index].phoneNumber}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface
                                              .withOpacity(0.8))),
                              Text(
                                  "${S.current.userName}: ${AddEmployersCubit.employersOfSpecificParking[index].userName}",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface
                                              .withOpacity(0.8))),
                              Text(
                                  "${S.current.password}: ${AddEmployersCubit.employersOfSpecificParking[index].password}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface
                                              .withOpacity(0.8))),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
              ),
              itemCount: AddEmployersCubit.employersOfSpecificParking.length,
            ),
          );
        },
      ),
    );
  }
}
