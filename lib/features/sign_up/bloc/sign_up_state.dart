part of 'sign_up_bloc.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    required bool isLoading,
    required Option<Either<UserFailure, Unit>> failureOrSuccess,
    required FormGroup form,
  }) = _Initial;

  factory SignUpState.initial() => SignUpState(
      isLoading: false,
      failureOrSuccess: none(),
      form: FormGroup({
        'email': FormControl<String>(
          validators: [
            Validators.required,
            Validators.email,
          ],
          asyncValidators: [
            UniqueEmailAsyncValidator(),
          ],
          asyncValidatorsDebounceTime: 1000,
        ),
        'password': FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(8),
          ],
        ),
        'confirmPassword': FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(8),
          ],
        ),
      }, validators: [
        Validators.mustMatch('password', 'confirmPassword'),
      ]));
}
