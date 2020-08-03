import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartx/dartx.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod/riverpod.dart';

Provider<GoogleSignIn> createGoogleSignIn(GoogleSignIn signIn) =>
    Provider((ref) => signIn);

Provider<RiverFireAuth> createRiverFireAuth(
        Provider<FirebaseApp> app, Provider<GoogleSignIn> signIn) =>
    Provider<RiverFireAuth>(
        (ref) => RiverFireAuth(ref, ref.read(app), ref.read(signIn)));

class RiverFireAuth {
  RiverFireAuth(this.ref, this.app, this.signInWithGoogle) {
    _auth = FirebaseAuth.instance;
  }
  final ProviderReference ref;
  final FirebaseApp app;
  final GoogleSignIn signInWithGoogle;
  FirebaseAuth _auth;
  FirebaseAuth get auth => _auth;
  FirebaseUser user;
  Stream<FirebaseUser> get authState => auth.onAuthStateChanged;

  Future<FirebaseUser> signInAnonymously() async {
    print('Signing in anonymously');
    try {
      final authResult = await auth.signInAnonymously();
      user = authResult.user;
      print('signed in ${user.displayName} silently');
      return user;
    } on Exception catch (e, st) {
      print(e);
      print(st);
    }
    return user;
  }

  Future<FirebaseUser> signIn() async {
    print('Signing in');
    try {
      final googleUser = await signInWithGoogle.signInSilently();
      if (googleUser == null) {
        try {
          final googleUser = await signInWithGoogle.signIn();
          final googleAuth = await googleUser.authentication;
          final googleCredential = GoogleAuthProvider.getCredential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );
          user = (await auth.signInWithCredential(googleCredential)).user;
          print('signed in ${user.displayName}');
          return user;
        } on Exception catch (e, st) {
          print(e);
          print(st);
        }
      } else {
        final googleAuth = await googleUser.authentication;
        final googleCredential = GoogleAuthProvider.getCredential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        user = (await auth.signInWithCredential(googleCredential)).user;
        print('signed in ${user.displayName} silently');
        return user;
      }
    } on Exception catch (e, st) {
      print(e);
      print(st);
    }

    Future.delayed(1000.milliseconds, () {
      print(user);
    });
    return user;
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}
