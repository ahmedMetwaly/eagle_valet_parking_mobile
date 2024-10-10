import 'package:eagle_valet_parking_mobile/core/utils/translate.dart';
import 'package:eagle_valet_parking_mobile/features/available_parking/presentaion/widgets/tickets.dart';
import 'package:eagle_valet_parking_mobile/features/available_parking/repos/transactions_repo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../generated/l10n.dart';
import '../../../add_new_parking/models/ticket.dart';
import '../../../auth/data/models/income_of_day/income_of_day.dart';

class TransactionBody extends StatelessWidget {
  const TransactionBody({
    super.key,
    required this.incoms,
    required this.tickets,
  });
  final List<IncomeOfDay> incoms;
  final List<TicketModel> tickets;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Intl.getCurrentLocale() == "ar"
                      ? Translate().translateDate(incoms[index].date.toString())
                      : incoms[index].date.toString(),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16),
                ),
                Row(
                  children: [
                    Text("${S.current.totalCustomersOfToday}: "),
                    Text(Intl.getCurrentLocale() == "ar"
                        ? Translate().translateNumberToArabic(
                            incoms[index].totalCustomersOfToday.toString())
                        : incoms[index].totalCustomersOfToday.toString()),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          Text("${S.current.totalIncome}: "),
                          Text(Intl.getCurrentLocale() == "ar"
                        ? Translate().translateNumberToArabic(
                           incoms[index].income.toString())
                        :incoms[index].income.toString()),
                          
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                  Theme.of(context).colorScheme.primary),
                              foregroundColor: WidgetStateProperty.all(
                                  Theme.of(context).colorScheme.surface),
                              padding: WidgetStateProperty.all(
                                const EdgeInsets.all(4),
                              )),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Tickets(
                                      tickets: TransactionsRepo()
                                          .getTicketsOfDay(
                                              tickets, incoms[index].date!)
                                          .reversed
                                          .toList(),
                                    )));
                          },
                          child: Text(S.current.viewDetails),
                        )),
                  ],
                ),
              ],
            ),
        separatorBuilder: (context, index) => Divider(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
            ),
        itemCount: incoms.length);
  }
}
