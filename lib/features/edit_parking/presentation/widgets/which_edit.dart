
import 'package:flutter/material.dart';

import '../../../../core/constants/values_manager.dart';

class WhichEdit extends StatelessWidget {
  const WhichEdit({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.title,
  });
  final Function onPressed;
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
          padding: const EdgeInsets.all(PaddingManager.pInternalPadding),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SizeManager.radiusOfBNB),
              border: Border.all(color: Theme.of(context).colorScheme.primary)),
          child: Center(
            child: Column(
              children: [
                Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primary,
                  size: 30,
                ),
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 15),
                ),
              ],
            ),
          )),
    );
  }
}
