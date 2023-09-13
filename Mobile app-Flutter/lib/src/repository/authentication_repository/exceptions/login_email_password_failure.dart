import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginWithEmailAndPasswordFailure {
  final String message;

  const LoginWithEmailAndPasswordFailure(
      [this.message = "An Unknown error occurred."]);

  factory LoginWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'week-password':
        return const LoginWithEmailAndPasswordFailure(
            'Please enter a stronger password');
      case 'invalid-email':
        return const LoginWithEmailAndPasswordFailure(
            'Email is not valid or badly formatted');
      case 'invalid-password':
        return const LoginWithEmailAndPasswordFailure(
          'Wrong Password'
        );
      case 'operation-not-allowed':
        return const LoginWithEmailAndPasswordFailure(
            'Operation is not allowed. Please contact support for help');
      case 'user-disabled':
        return const LoginWithEmailAndPasswordFailure(
            'This user has been disabled. Please contact support for help');
      default:
        return const LoginWithEmailAndPasswordFailure();
    }
  }
}
