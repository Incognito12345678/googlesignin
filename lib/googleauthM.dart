import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:googlesignin_youtube/autenticator.dart';

class GoogleAuthM extends StatelessWidget {
  GoogleAuthM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () async {
            User? user = await Authenticator.IniciarSesion(context: context);
            print(user?.displayName);
          },
          color: Colors.blue,
          //child: Icon()
          //textColor: Colors.white,
        ),
      ),
    );
  }
}
