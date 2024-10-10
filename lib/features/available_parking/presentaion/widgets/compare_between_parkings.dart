import 'package:eagle_valet_parking_mobile/features/available_parking/repos/transactions_repo.dart';
import 'package:eagle_valet_parking_mobile/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../add_new_parking/models/parking_model.dart';

class CompareBetweenParkings extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  const CompareBetweenParkings({super.key, required this.parkings});
  final List<ParkingModel> parkings;
  @override
  CompareBetweenParkingsState createState() => CompareBetweenParkingsState();
}

class CompareBetweenParkingsState extends State<CompareBetweenParkings> {
  @override
  Widget build(BuildContext context) {
    List<_SalesData> data = List.generate(widget.parkings.length, (index) {
      return _SalesData(
          widget.parkings[index].parkingName!,
          TransactionsRepo()
              .getAllTransaction(incomes: widget.parkings[index].incomeOfDay!));
    });
    return Column(children: [
      //Initialize the chart widget
      SfCartesianChart(
          primaryXAxis: const CategoryAxis(),
          // Chart title
          title: ChartTitle(text: S.current.compare_between_parkings),
          // Enable legend
          legend: const Legend(
            isVisible: true,
          ),
          // Enable tooltip
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <CartesianSeries<_SalesData, String>>[
            LineSeries<_SalesData, String>(
                dataSource: data,
                color: Theme.of(context).colorScheme.primary,
                xValueMapper: (_SalesData sales, _) => sales.parkingName,
                yValueMapper: (_SalesData sales, _) => sales.totalIncome,
                name: S.current.sales,
                // Enable data label
                dataLabelSettings: const DataLabelSettings(isVisible: true))
          ]),
    ]);
  }
}

class _SalesData {
  _SalesData(this.parkingName, this.totalIncome);

  final String parkingName;
  final double totalIncome;
}
