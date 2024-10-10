import 'package:eagle_valet_parking_mobile/core/constants/values_manager.dart';
import 'package:eagle_valet_parking_mobile/core/utils/image_manager.dart';
import 'package:eagle_valet_parking_mobile/core/utils/media_query_utils.dart';
import 'package:eagle_valet_parking_mobile/core/utils/routes.dart';
import 'package:eagle_valet_parking_mobile/core/widgets/image_from_network.dart';
import 'package:eagle_valet_parking_mobile/features/auth/controller/auth_bloc/auth_bloc.dart';
import 'package:eagle_valet_parking_mobile/features/profile/controller/bloc/user_bloc/user_bloc.dart';
import 'package:eagle_valet_parking_mobile/features/profile/controller/bloc/user_bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';
import '../../../add_new_parking/controller/bloc/parking_bloc/parking_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(PaddingManager.pMainPadding),
        child: Column(
          children: [
            Row(
              children: [
                BlocBuilder<UserBloc, UserState>(
                  builder: (BuildContext context, UserState state) => ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: ImageFromNetwork(
                        imagePath: AuthenticationBloc.user.imageUrl!,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                    width: MediaQueryUtils.getWidthPercentage(context, 0.02)),
                Expanded(
                    flex: 2,
                    child: Text(
                          "${S.current.hello}, ${AuthenticationBloc.user.name!}"),
                    ),
              ],
            ),
            Expanded(
                flex: 2,
                child: Image.asset(
                  ImageManager.splash,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: MediaQueryUtils.getWidthPercentage(context, 0.2),
                )),
            Expanded(
                flex: 3,
                child: ListView(
                  children: [
                    ListTile(
                      
                      title: Text(S.current.addNewParking,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.primary)),
                      onTap: () =>
                          Navigator.of(context).pushNamed(Routes.addNewParking),
                      trailing: const Icon(Icons.arrow_forward_ios_outlined),
                    ),
                    Divider(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.4)),
                    ListTile(
                      title: Text(S.current.availableParking,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.primary)),
                      onTap: () {
                        context.read<ParkingBloc>().getAvailableParking();
                        Navigator.of(context)
                            .pushNamed(Routes.availableParking);
                      },
                      trailing: const Icon(Icons.arrow_forward_ios_outlined),
                    ),
                    Divider(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.4)),
                    ListTile(
                      title: Text(S.current.profile,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.primary)),
                      onTap: () =>
                          Navigator.of(context).pushNamed(Routes.profile),
                      trailing: const Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  ],
                )),
          ],
        ),
      )),
    );
  }
}
