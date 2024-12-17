import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:swe_medical/features/auth_feature/data/model/request/UserRequest.dart';
import 'package:swe_medical/features/auth_feature/data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  AuthRepo authRepo;
  static AuthCubit get(context)=>BlocProvider.of(context);
  signUp(UserRequest userRequest) async {
    emit(AuthLoadingState());
    var result = await authRepo.signUp( userRequest);
    result.fold(
      (l) {
        emit(AuthErrorState(l.message));
      },
      (r) {
        emit(AuthSuccessState(r));
      },
    );
  }


  signIn(String email, String password) async {
    emit(AuthLoadingState());
    var result = await authRepo.signIn(email, password);
    result.fold(
      (l) {
        emit(AuthErrorState(l.message));
      },
      (r) {
        emit(AuthSuccessState(r));
      },
    );
  }
}
