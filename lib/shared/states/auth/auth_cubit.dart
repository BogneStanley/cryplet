import 'package:bloc/bloc.dart';
import 'package:cryplet/shared/data/auth/models/user_model.dart';
import 'package:cryplet/shared/data/auth/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  AuthCubit(this._authRepository) : super(AuthState());

  Future<void> login({required String email, required String password}) async {
    emit(state.copyWith(loginInProgess: true));

    final loginResponse =
        await _authRepository.login(email: email, password: password);

    loginResponse.fold(
      (l) => emit(state.copyWith(
        loginInProgess: false,
        errorMessage: l.message,
      )),
      (r) {
        emit(state.copyWith(
          loginInProgess: false,
          user: r.user,
          errorMessage: null,
        ));

        _authRepository.saveUser(r.user!);
        _authRepository.saveApiToken(r.token!);
      },
    );
  }

  Future<String?> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirm,
    String? avatar,
  }) async {
    emit(state.copyWith(registerInProgess: true));

    final registerResponse = await _authRepository.register(
      name: name,
      email: email,
      password: password,
      passwordConfirm: passwordConfirm,
      avatar: avatar,
    );

    return registerResponse.fold<String?>(
      (l) {
        emit(state.copyWith(
          registerInProgess: false,
          errorMessage: l.message,
        ));

        return l.message;
      },
      (r) {
        emit(state.copyWith(
          registerInProgess: false,
          user: null,
          errorMessage: null,
        ));

        return null;
      },
    );
  }

  void logout() {
    _authRepository.logout();
    emit(state.copyWith(
      user: null,
      loginInProgess: false,
      errorMessage: null,
    ));
  }

  Future<String?> me(String id) async {
    emit(state.copyWith(gettingUserInProgess: true));
    final user = await _authRepository.me(id);

    return user.fold((l) {
      emit(state.copyWith(
        gettingUserInProgess: false,
        errorMessage: l.message,
      ));
      return l.message;
    }, (r) {
      print(r);
      emit(state.copyWith(
        gettingUserInProgess: false,
        user: r,
        errorMessage: null,
      ));
      _authRepository.saveUser(r);
      return null;
    });
  }

  void enableOfflineMode() {
    emit(state.copyWith(isOfflineMode: true));
  }

  void disableOfflineMode() {
    emit(state.copyWith(isOfflineMode: false));
  }

  void setUser(UserModel user) {
    emit(state.copyWith(user: user));
  }
}
