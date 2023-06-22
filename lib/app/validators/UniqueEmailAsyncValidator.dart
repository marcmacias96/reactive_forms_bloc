import 'package:reactive_forms/reactive_forms.dart';

class UniqueEmailAsyncValidator extends AsyncValidator<dynamic> {
  @override
  Future<Map<String, dynamic>?> validate(
      AbstractControl<dynamic> control) async {
    final error = {'unique': false};

    final isUniqueEmail = await _getIsUniqueEmail(control.value);
    if (!isUniqueEmail) {
      control.markAsTouched();
      return error;
    }

    return null;
  }

  /// Simulates a time consuming operation (i.e. a Server request)
  Future<bool> _getIsUniqueEmail(String email) {
    // simple array that simulates emails stored in the Server DB.
    final storedEmails = ['johndoe@email.com', 'john@email.com'];
    print('email: $email');
    print(storedEmails.contains(email));
    return Future.delayed(
      const Duration(seconds: 5),
      () => storedEmails.contains(email),
    );
  }
}