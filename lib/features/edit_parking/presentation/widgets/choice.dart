
import 'package:flutter/material.dart';

import '../../../../core/utils/media_query_utils.dart';

class Choice extends StatelessWidget {
  const Choice(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.title,
      required this.color,
      });
  final Function onPressed;
  final IconData icon;
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onPressed(),
        child: Container(
          height: MediaQueryUtils.getHeightPercentage(context, 0.2),
          decoration: BoxDecoration(
            color:color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(icon,
                  size: 45, color: Theme.of(context).colorScheme.surface),
              Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize:
                          MediaQueryUtils.getWidthPercentage(context, 0.065),
                      color: Theme.of(context).colorScheme.surface),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ));
  }
}
