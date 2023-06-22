part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required bool isLoading,
    required Option<Either<UserFailure, Unit>> failureOrSuccess,
    required FormGroup form,
  }) = _Initial;

  factory LoginState.initial() => LoginState(
      isLoading: false,
      failureOrSuccess: none(),
      form: fb.group({
        'email': ['', Validators.required, Validators.email],
        'password': Validators.required,
      }));
}
