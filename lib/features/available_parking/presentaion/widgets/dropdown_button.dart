import 'package:eagle_valet_parking_mobile/features/auth/data/models/income_of_day/income_of_day.dart';
import 'package:eagle_valet_parking_mobile/features/available_parking/controller/bloc/live_overview_cubit/live_overview_cubit.dart';
import 'package:eagle_valet_parking_mobile/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyDropDownBtn extends StatefulWidget {
  const MyDropDownBtn({super.key, required this.items, required this.incomes});
  final Map<String,String> items;
  final List<IncomeOfDay> incomes;
  @override
  State<MyDropDownBtn> createState() => _MyDropDownBtnState();
}

class _MyDropDownBtnState extends State<MyDropDownBtn> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedItem,
      isExpanded: true,
      items: widget.items.entries.toList().map((MapEntry<String,String> item) {
        return DropdownMenuItem<String>(
          value: item.key,
          child: Center(
            child: Text(item.value),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedItem = newValue;
        });
        context.read<LiveOverViewCubit>().changeMonth(selectedItem!);
      },
      hint: Text(S.current.allMonths), // Optional hint text
    );
  }
}
