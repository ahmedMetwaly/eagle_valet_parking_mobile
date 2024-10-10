import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../auth/controller/auth_bloc/auth_bloc.dart';
import '../../../../auth/domain/user_domain/user_repo.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvents, UserState> {
  UserBloc() : super(InitialFirestore()) {
    on<ChangeProfileImage>(_changeProfileImage);
    on<UpdateUserDataEvent>(_updateUserData);
  }

  late XFile profileImage;
  FutureOr<void> _changeProfileImage(
      ChangeProfileImage event, Emitter<UserState> emit) async {
    try {
      emit(UpdatindDataState());
      await UserRepo()
          .uploadImage(
              userId: AuthenticationBloc.user.uid ?? "0", image: profileImage)
          .then((value) {
        //print("image uploaded");
        AuthenticationBloc.user.imageUrl = value;
        return emit(UpdatedUserDataState(user: AuthenticationBloc.user));
      });
    } catch (error) {
      emit(UpdateFailedDataState(errorMessage: error.toString()));
    }
  }

  FutureOr<void> _updateUserData(
      UpdateUserDataEvent event, Emitter<UserState> emit) async {
    try {
      emit(UpdatindDataState());
      await UserRepo()
          .updataUserData(
              userId: AuthenticationBloc.user.uid!,
              field: "name",
              data: AuthenticationBloc.user.name);
              await UserRepo()
          .updataUserData(
              userId: AuthenticationBloc.user.uid!,
              field: "phoneNumber",
              data: AuthenticationBloc.user.phoneNumber)
          .then((value) {
        emit(UpdatedUserDataState(user: AuthenticationBloc.user));
      });
    } catch (error) {
      emit(UpdateFailedDataState(errorMessage: error.toString()));
    }
  }
}
