import 'package:eagle_valet_parking_mobile/core/utils/routes.dart';
import 'package:eagle_valet_parking_mobile/core/utils/translate.dart';
import 'package:eagle_valet_parking_mobile/core/utils/values.dart';
import 'package:eagle_valet_parking_mobile/features/available_parking/presentaion/widgets/dropdown_button.dart';
import 'package:eagle_valet_parking_mobile/features/available_parking/models/parking_data.dart';
import 'package:eagle_valet_parking_mobile/features/available_parking/repos/date.dart';
import 'package:eagle_valet_parking_mobile/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../controller/bloc/live_overview_cubit/live_overview_cubit.dart';
import '../widgets/counter.dart';
import '../widgets/transaction.dart';

class DisplayParking extends StatelessWidget {
  const DisplayParking({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ParkingData parking =
        ModalRoute.of(context)!.settings.arguments as ParkingData;
    Map<String, String> monthsList = {
      "January": S.current.January,
      "February": S.current.February,
      "March": S.current.March,
      "April": S.current.April,
      "May": S.current.May,
      "June": S.current.June,
      "July": S.current.July,
      "August": S.current.August,
      "September": S.current.September,
      "October": S.current.October,
      "November": S.current.November,
      "December": S.current.December,
    };

    return BlocProvider(
      create: (_) => LiveOverViewCubit()..listenToDocument(parking.parkingId),
      child: Scaffold(
        appBar: AppBar(
          title: Text(parking.parkingTitle),
          actions: [
            BlocBuilder<LiveOverViewCubit, DocumentState>(
              builder: (BuildContext context, DocumentState state) => Padding(
                padding:
                    const EdgeInsets.only(right: PaddingManager.pMainPadding),
                child: IconButton.outlined(
                    icon: Icon(
                      Icons.edit,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: () {
                      /*  context
                          .read<AddEmployersCubit>()
                          .getEmployersWorkAtParking(parking.parkingId); */
                    /*   print(
                          context.read<LiveOverViewCubit>().parking.parkingId);
                    */   Navigator.pushNamed(context, Routes.editParking,
                          arguments: state.data);
                    }),
              ),
            )
          ],
        ),
        body: BlocBuilder<LiveOverViewCubit, DocumentState>(
            builder: (context, state) {
          if (state.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.errorMessage != null) {
            return Padding(
              padding: const EdgeInsets.all(PaddingManager.pMainPadding),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${state.errorMessage}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(
                            Theme.of(context).colorScheme.primary),
                        foregroundColor: WidgetStateProperty.all(
                            Theme.of(context).colorScheme.surface)),
                    onPressed: () {
                      context
                          .read<LiveOverViewCubit>()
                          .listenToDocument(parking.parkingId);
                    },
                    child: Text(S.current.retry),
                  ),
                ],
              )),
            );
          } else {
            if (state.data!.incomeOfDay!.isEmpty) {
              return Center(child: Text(S.current.thisParkingIsStillClosing));
            } else {
              return Padding(
                padding: const EdgeInsets.all(PaddingManager.pMainPadding),
                child: Column(
                  children: [
                    Expanded(
                        flex: 1,
                        child: state.data!.incomeOfDay!.last.date !=
                                Date().convert3(DateTime.now().toString())
                            ? Container(
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
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(0.4),
                                    )),
                                child: Center(
                                    child: Text(
                                        S.current.thisParkingIsStillClosing,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium!
                                            .copyWith(
                                                fontSize: 20,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary))))
                            : Container(
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
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(0.4),
                                    )),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      S.current.liveOverView,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!
                                          .copyWith(
                                              fontSize: 20,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                    ),
                                    Row(children: [
                                      Text(
                                        "${S.current.totalCustomersOfToday}: ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(fontSize: 16),
                                      ),
                                      Container(
                                          width: 40,
                                          height: 40,
                                          padding: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary
                                                  .withOpacity(0.8),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: SlideCountdown(
                                            number: Intl.getCurrentLocale() ==
                                                    "ar"
                                                ? Translate()
                                                    .translateNumberToArabic(state
                                                        .data!
                                                        .incomeOfDay!
                                                        .last
                                                        .totalCustomersOfToday
                                                        .toString())
                                                : state.data!.incomeOfDay!.last
                                                    .totalCustomersOfToday
                                                    .toString(),
                                          ))
                                    ]),
                                    Row(children: [
                                      Text(
                                        "${S.current.totalIncome}: ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(fontSize: 16),
                                      ),
                                      Container(
                                        width: 40,
                                        height: 40,
                                        padding: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary
                                                .withOpacity(0.8),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: SlideCountdown(
                                          number: Intl.getCurrentLocale() ==
                                                  "ar"
                                              ? Translate()
                                                  .translateNumberToArabic(state
                                                      .data!
                                                      .incomeOfDay!
                                                      .last
                                                      .income
                                                      .toString())
                                              : state.data!.incomeOfDay!.last
                                                  .income
                                                  .toString(),
                                        ),
                                      ),
                                     
                                    ]),
                                  ],
                                ),
                              )),
                    const SizedBox(height: 10),
                    Expanded(
                        flex: 3,
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
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.4),
                              )),
                          child: Column(children: [
                            Row(
                              children: [
                                Text(S.current.transactionOf,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(fontSize: 16)),
                                const SizedBox(width: 10),
                                Expanded(
                                    child: MyDropDownBtn(
                                  items: monthsList,
                                  incomes: state.data!.incomeOfDay!,
                                )),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment:  CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "${S.current.totalIncome}: ${Intl.getCurrentLocale() == "ar" ? Translate().translateNumberToArabic(state.totalIncome.toString()) : state.totalIncome}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(color: Colors.deepOrange[900])),
                                          Text(
                                    "${S.current.totalCustomer}: ${Intl.getCurrentLocale() == "ar" ? Translate().translateNumberToArabic(state.data!.tickets!.length.toString()) : state.data!.tickets!.length.toString()}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(color: Colors.deepOrange[900])),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Expanded(
                              child: TransactionBody(
                                tickets: state.data!.tickets!,
                                incoms: state.incoms!.reversed.toList(),
                              ),
                            ),
                          ]),
                        )),
                  ],
                ),
              );
            }
          }
        }),
      ),
    );
  }
}
