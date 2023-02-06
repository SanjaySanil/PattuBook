class SignUpWithEmailPasswordFailure {
  final String message;

  SignUpWithEmailPasswordFailure([this.message = "An Unknown error occurred"]);

  factory SignUpWithEmailPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return SignUpWithEmailPasswordFailure('Please enter a strong Password');
      case 'invalid-email':
        return SignUpWithEmailPasswordFailure('Email is not valid or badly formatted');
      case 'email-already-in-use':
        return SignUpWithEmailPasswordFailure('An account already exists for that email');

      case 'operation-not-allowed':
        return SignUpWithEmailPasswordFailure('Operation is not allowed .Please contact support.');

      case'user-disabled':
        return SignUpWithEmailPasswordFailure('This user has been disabled .Please contact for help.');
      default:
        SignUpWithEmailPasswordFailure();
    }
    return SignUpWithEmailPasswordFailure.code(code);
  }
}
