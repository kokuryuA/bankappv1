import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pfef/auth/signupwithemailandpassword.dart';
import 'package:pfef/pages/hold.dart';
import 'package:pfef/pages/homepage.dart';
import 'package:pfef/pages/signin1.dart';
import 'package:pfef/pages/signin2.dart';
import 'package:pfef/pages/verification.dart';

import 'failurelogin.dart';

class authentification extends GetxController {
  static authentification get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId=''.obs;
  String phoneno = phoneController.toString();

  static get phoneController => null;
  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const homepage());
    } else {
      Get.offAll(() => const hold());
    }
  }
  Future<void> phoneauth(String phoneNumber) async {

    print(phoneNumber);
    print('this is the phone no');
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneno,
        verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e){
          if (e.code == 'invalid-phone-number'){
            Get.snackbar ('Error',
                'The provided phone number is not valid.');
          }else{
            Get. snackbar ('Error', 'Something went wrong. Try again.');
          }
        },
        codeSent: (verificationId, resendToken){
        this.verificationId.value = verificationId;

        },
        codeAutoRetrievalTimeout: (verificationId){
          this.verificationId.value = verificationId;
        },
    );

  }
  Future<bool> verifyOTP(String otp)async{

    var credentionals = await
    _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: this.verificationId.value, smsCode: otp));
    return credentionals.user != null ? true : false;

  }

  Future<String?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      return ex.message;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      return ex.message;
    }
    return null;
  }
  Future<String?> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = LogInWithEmailAndPasswordFailure.fromCode(e.code);
      return ex.message;
    } catch (_) {
      const ex = LogInWithEmailAndPasswordFailure();
      return ex.message;
    }
    return null;
  }

  Future<void> logout() async => await _auth.signOut();
}
