import 'package:eagle_valet_parking_mobile/features/profile/controller/bloc/user_bloc/user_bloc.dart';
import 'package:eagle_valet_parking_mobile/features/profile/controller/bloc/user_bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/values_manager.dart';
import '../../auth/controller/auth_bloc/auth_bloc.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (BuildContext context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: SizeManager.sSpace),
                Text(
                  AuthenticationBloc.user.name!,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 24),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  AuthenticationBloc.user.email!,
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
