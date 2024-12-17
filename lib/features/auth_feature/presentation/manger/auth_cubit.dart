import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:swe_medical/features/auth_feature/data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  AuthRepo authRepo;
  static AuthCubit get(context)=>BlocProvider.of(context);
  signUp(String email, String password) async {
    var result = await authRepo.signUp(email, password);
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
