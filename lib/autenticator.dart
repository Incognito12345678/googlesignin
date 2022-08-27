import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:google_sign_in/google_sign_in.dart';

class Authenticator {
  static Future<User?> IniciarSesion({required BuildContext context}) async {
    FirebaseAuth authenticator = FirebaseAuth.instance;
    User? user;
    GoogleSignIn objGooglesignIn = GoogleSignIn();
    GoogleSignInAccount? objGooglesignInAccount =
        await objGooglesignIn.signIn();

    if (objGooglesignInAccount != null) {
      GoogleSignInAuthentication objGoogleSignInAuthentication =
          await objGooglesignInAccount.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: objGoogleSignInAuthentication.accessToken,
          idToken: objGoogleSignInAuthentication.idToken);
      try {
        UserCredential userCredential =
            await authenticator.signInWithCredential(credential);
        user = userCredential.user;
        return user;
      } on FirebaseAuthException catch (e) {
        print("error de auth");
      }
    }
  }
}
