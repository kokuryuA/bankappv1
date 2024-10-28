class LogInWithEmailAndPasswordFailure {
  final String message;

  const LogInWithEmailAndPasswordFailure([this.message = 'An unknown error occurred.']);

  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure('Invalid email address.');
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure('This user account has been disabled.');
      case 'user-not-found':
        return const LogInWithEmailAndPasswordFailure('User with this email address not found.');
      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure('Invalid password.');
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }
}
