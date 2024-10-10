
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/utils/values.dart';
import '../../../generated/l10n.dart';
import '../controller/bloc/user_bloc/user_bloc.dart';
import '../controller/bloc/user_bloc/user_event.dart';

class MyImageSource extends StatelessWidget {
  const MyImageSource({
    super.key,
    required this.imageSource,
  });
  final ImageSource imageSource;
  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();

    return GestureDetector(
      onTap: () async {
        await picker
            .pickImage(
          source: imageSource, // Or ImageSource.camera
        )
            .then((value) {
          if (value != null) {
            context.read<UserBloc>().profileImage = value;
            context.read<UserBloc>().add(ChangeProfileImage());
          }
          return null;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(PaddingManager.pInternalPadding),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.primary),
          borderRadius: BorderRadius.circular(SizeManager.borderRadius),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(imageSource == ImageSource.camera
                ? Icons.camera_alt_rounded
                : Icons.collections, 
                color: Theme.of(context).colorScheme.primary,
                ),
            Text(imageSource == ImageSource.camera
                ? S.current.camera
                : S.current.gallery),
          ],
        ),
      ),
    );
  }
}
