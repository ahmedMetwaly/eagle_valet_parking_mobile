import 'package:eagle_valet_parking_mobile/features/auth/presentation/pages/signup/presentation/widgets/name.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/values.dart';
import '../../../../core/widgets/input_number.dart';
import '../../../../generated/l10n.dart';

class ParkingInformation extends StatelessWidget {
  const ParkingInformation({
    super.key,
    required this.parkingName,
    required this.capacity,
    required this.parkingFee,
  });
  final TextEditingController parkingName;
  final TextEditingController capacity;
  final TextEditingController parkingFee;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(PaddingManager.pInternalPadding),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          borderRadius: BorderRadius.circular(SizeManager.borderRadius),
          border: Border.all(
            color: Theme.of(context).colorScheme.onPrimary,
          )),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.local_parking_rounded,
                size: 30,
              ),
              const SizedBox(
                width: SizeManager.sSpace,
              ),
              Text(
                S.current.parkingInformation,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          ),
          const SizedBox(height: SizeManager.sSpace16),
          Name(nameController: parkingName, title: S.current.parkingName),
          const SizedBox(height: 10),
          InputNumber(controller: capacity, label: S.current.capacity),
          const SizedBox(height: 10),
          InputNumber(controller: parkingFee, label: S.current.parkingFee),
        ],
      ),
    );
  }
}
