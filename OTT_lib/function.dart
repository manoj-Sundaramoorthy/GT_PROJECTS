import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';




class AuthServices {
//google login
  signInWithGoogle() async {

    final GoogleSignInAccount? gUSer = await GoogleSignIn(
      clientId:"978419317696-u3nk0vdm83vap9hpllp0iv7q1m3ness8.apps.googleusercontent.com",
    ).signIn();

    final GoogleSignInAuthentication gAuth = await gUSer!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    final UserCredential userCredential =
    await FirebaseAuth.instance.signInWithCredential(credential);

    return userCredential.user;
  }

  //login
  signInWithEmailPassword(String email, String password) async {
    final userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    return userCredential.user;

  }
//sign up
  registerWithEmailPassword(String email, String password) async {
    final UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    return userCredential.user;
  }
//signout
  signOut() async {
    try {
      await FirebaseAuth.instance.signOut();

      await GoogleSignIn().disconnect();
      await GoogleSignIn().signOut();
      return true;
    } catch (e) {
      print("Error while signout!");
      return false;
    }
  }
}
