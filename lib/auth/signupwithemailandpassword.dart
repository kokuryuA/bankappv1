
class SignUpWithEmailAndPasswordFailure {
final String message;
const SignUpWithEmailAndPasswordFailure([this.message = "an unknown error occurred."]);
factory SignUpWithEmailAndPasswordFailure.code(String code){
  switch(code){
    case 'weake-password':
      return const SignUpWithEmailAndPasswordFailure('please enter a stronger password');
    case 'invalid-email':
      return const SignUpWithEmailAndPasswordFailure('Email is not valid or badly formatted');
    case 'email-already-in-use':
      return const SignUpWithEmailAndPasswordFailure('An account already exists for that email');
    case 'operation-not-allowed':
      return const SignUpWithEmailAndPasswordFailure('Operation is not allowed. Please contact support');
    case 'user-disabled':
      return const SignUpWithEmailAndPasswordFailure('This user has disabled. please contact support for help');
    default:
      return const SignUpWithEmailAndPasswordFailure();

  }
}
}