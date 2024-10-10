
import 'package:flutter/material.dart';

import '../../../../core/constants/values_manager.dart';
import '../../../../core/utils/image_manager.dart';

class AvailableParkingImage extends StatelessWidget {
  const AvailableParkingImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius:
              BorderRadius.circular(SizeManager.sBorderRadius),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context)
                  .colorScheme
                  .onPrimary
                  .withOpacity(0.3),
              offset: const Offset(5, 10),
              blurRadius: 10,
              spreadRadius: 5,
            )
          ]),
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(SizeManager.sBorderRadius),
        child: Image.asset(
          ImageManager.availableParking,
          width: double.infinity,
          frameBuilder: (context, child, frame,
                  wasSynchronouslyLoaded) =>
              frame == null
                  ? const Center(child:  CircularProgressIndicator())
                  : child,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
