import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/constants/values_manager.dart';
import '../../../core/widgets/image_from_network.dart';
import '../../auth/controller/auth_bloc/auth_bloc.dart';
import '../controller/bloc/user_bloc/user_bloc.dart';
import '../controller/bloc/user_bloc/user_state.dart';
import 'image_source.dart';

class ChangeProfileImageWidget extends StatelessWidget {
  const ChangeProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        //print(state);
        if (state is UpdatindDataState) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(150),
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
              ),
              child: const Center(child: CircularProgressIndicator()),
            ),
          );
        }
        return GestureDetector(
          onTap: () async {
            showModalBottomSheet(
              backgroundColor: Colors.transparent,
              builder: (context) => Container(
                padding: const EdgeInsets.all(50),
                height: MediaQuery.of(context).size.height * 0.25,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(SizeManager.bottomSheetRadius),
                        topRight:
                            Radius.circular(SizeManager.bottomSheetRadius))),
                child: const SizedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: MyImageSource(
                        imageSource: ImageSource.camera,
                      )),
                      SizedBox(width: 25),
                      Expanded(
                          child: MyImageSource(
                        imageSource: ImageSource.gallery,
                      ))
                    ],
                  ),
                ),
              ),
              context: context,
            );
          },
          child: Stack(alignment: AlignmentDirectional.bottomEnd, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(150),
              child: ImageFromNetwork(
                imagePath: AuthenticationBloc.user.imageUrl ?? "",
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Icon(Icons.edit,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ]),
        );
      },
    );
  }
}
