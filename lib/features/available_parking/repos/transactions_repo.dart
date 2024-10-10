import 'package:eagle_valet_parking_mobile/features/auth/data/models/income_of_day/income_of_day.dart';

import '../../add_new_parking/models/ticket.dart';

class TransactionsRepo {
  double getAllTransaction({required List<IncomeOfDay> incomes}) {
    try {
      double totalIncome = 0.0;

      for (int i = 0; i < incomes.length; i++) {
        totalIncome += incomes[i].income!;
      }
     // print(totalIncome);

      return totalIncome;
    } catch (error) {
      throw Exception("error while getting month transaction $error");
    }
  }

  double totalIncomsOfMonth(List<IncomeOfDay> incoms, String month) {
    double incomsOfMonth = 0.0;
    for (int i = 0; i < incoms.length; i++) {
      if (incoms[i].date!.contains(month)) {
        incomsOfMonth += incoms[i].income!;
      }
    }
    return incomsOfMonth;
  }

  List<IncomeOfDay> getInconmsOfMonth(List<IncomeOfDay> incoms, String month) {
    List<IncomeOfDay> incomsOfMonth = [];
    for (int i = 0; i < incoms.length; i++) {
      if (incoms[i].date!.contains(month)) {
        incomsOfMonth.add(incoms[i]);
      }
    }
    return incomsOfMonth;
  }

  List<TicketModel> getTicketsOfDay(
      List<TicketModel> ticketsFromFirebase, String date) {
    List<TicketModel> tickets = [];
    for (int i = 0; i < ticketsFromFirebase.length; i++) {
      if (ticketsFromFirebase[i].id!.contains(date)) {
        tickets.add(ticketsFromFirebase[i]);
      }
    }
    return tickets;
  }
}
