import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:kitoob_app/utls/font_size.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String userEmail = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.asset('asset/images/images.png'),
                const Text('KITOOB',
                  style: TextStyle(
                      fontSize: FontsizeResources.font_size_30,
                      fontWeight: fontWeights_Resources.font_weight_700
                  ),),
              ],
            ),
            Column(
              children: <Widget>[
                SocialLoginButton(
                  buttonType: SocialLoginButtonType.google,
                  onPressed: () async{
                    await signInWithGoogle();
                    setState(() {

                    });
                  },
                ),
                const SizedBox(
                  height: 30.0,
                ),
                SocialLoginButton(
                  buttonType: SocialLoginButtonType.facebook,
                  onPressed: (){

                  },
                ),
              ],
            ),
            Column(
              children: [
                Text('User Email:'),
                Text(userEmail),
              ],
            )
          ],
        ),
      ),
    );
  }
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    userEmail = googleUser!.email;

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
