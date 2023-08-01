import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthProvider extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> signIn(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> signUp(String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    return await _auth.signOut();
  }

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  User? get currentUser => _auth.currentUser;

  String? get currentUserId => _auth.currentUser?.uid;

  String? get currentUserEmail => _auth.currentUser?.email;

  String? get currentUserDisplayName => _auth.currentUser?.displayName;

  String? get currentUserPhotoUrl => _auth.currentUser?.photoURL;

  String? get currentUserPhoneNumber => _auth.currentUser?.phoneNumber;

  bool get isAnonymous => _auth.currentUser?.isAnonymous ?? false;

  bool get isEmailVerified => _auth.currentUser?.emailVerified ?? false;

  bool get isUserSignedIn => _auth.currentUser != null;

  Future<void> reloadUser() async {
    return await _auth.currentUser?.reload();
  }

  Future<void> sendEmailVerification() async {
    return await _auth.currentUser?.sendEmailVerification();
  }

  Future<void> updateEmail(String email) async {
    return await _auth.currentUser?.updateEmail(email);
  }

  Future<void> updatePassword(String password) async {
    return await _auth.currentUser?.updatePassword(password);
  }

  Future<void> updatePhoneNumber(PhoneAuthCredential phoneAuthCredential) async {
    return await _auth.currentUser?.updatePhoneNumber(phoneAuthCredential);
  }

  // Future<void> updateProfile({String? displayName, String? photoUrl}) async {
  //     return await _auth.currentUser?.updateProfile(displayName: displayName, photoURL: photoUrl);
  // }

  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required Duration timeout,
    required int forceResendingToken,
    required PhoneVerificationCompleted verificationCompleted,
    required PhoneVerificationFailed verificationFailed,
    required PhoneCodeSent codeSent,
    required PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
  }) async {
    return await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: timeout,
      forceResendingToken: forceResendingToken,
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }
}
