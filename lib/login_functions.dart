import 'package:animated_login/animated_login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:neop/src/providers/appwrite_client.dart';
import 'package:appwrite/appwrite.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:neop/src/widgets/dialogs/animated_dialog.dart';

import 'dialog_builders.dart';

class LoginFunctions {
  /// Collection of functions will be performed on login/signup.
  /// * e.g. [onLogin], [onSignup], [socialLogin], and [onForgotPassword]
  const LoginFunctions(this.context);
  final BuildContext context;

  /// Login action that will be performed on click to action button in login mode.

  Future<String?> onLogin(LoginData loginData) async {
    //await Future.delayed(const Duration(seconds: 1));
    //return null;
    //erase this code after testing

    try {
      Client client = AppwriteClient.getClient();
      Account account = Account(client);
      final result = await account.createEmailSession(
        email: loginData.email,
        password: loginData.password,
      );
      return result.$id;
    } on AppwriteException catch (e) {
      DialogBuilder(context).showResultDialog(
        'Error ${e.message}',
      );
      if (kDebugMode) {
        print(e.message);
      }
    }
    return null;
  }

  /// Sign up action that will be performed on click to action button in sign up mode.
  Future<String?> onSignup(SignUpData signupData) async {
    if (signupData.password != signupData.confirmPassword) {
      return 'The passwords you entered do not match, check again.';
    }
    /*
    await Future.delayed(const Duration(seconds: 5));
    return null; */
    else {
      //implement appwrite signup, Remove the code incase not working
      try {
        Client client = AppwriteClient.getClient();
        Account account = Account(client);
        final result = await account.create(
          userId: ID.unique(),
          email: signupData.email,
          password: signupData.password,
          name: signupData.name,
        );

        //Navigator.of(context).pushNamed('/signupverification');
        // final user = result.name;
        /*
        DialogBuilder(context).showResultDialog(
          'succsess $user',

        );  */

        //showDataAlert(context);
        showDataAlert(context);

        return result.email;
      } on AppwriteException catch (e) {
        if (kDebugMode) {
          print(e.message);
        }
        DialogBuilder(context).showResultDialog(
          'Error ${e.message}',
        );
        return null;
      }
    }
  }

  /// Social login callback example.
  Future<String?> socialLogin(String type) async {
    await Future.delayed(const Duration(seconds: 2));
    return null;
  }

  /// Action that will be performed on click to "Forgot Password?" text/CTA.
  /// Probably you will navigate user to a page to create a new password after the verification.
  Future<String?> onForgotPassword(String email) async {
    DialogBuilder(context).showLoadingDialog();
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed('/forgotPass');
    return null;
  }
}

// Create a function that shows the verification dialog
showDataAlert(BuildContext context) async {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20.0,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.only(
            top: 10.0,
          ),
          title: const Text(
            "Verification",
            style: TextStyle(fontSize: 24.0),
          ),
          content: Container(
            height: 400,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Enter the code sent to your email address",
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: const TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter code here',
                          labelText: 'Code'),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 60,
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        // fixedSize: Size(250, 50),
                      ),
                      child: const Text(
                        "Submit",
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Note'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'If you did not receive the code, please check your spam folder or click on the resend button below.\n'
                      'By continuing, you agree to our Terms of Service and Privacy Policy',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

//create a function for sending verification code to email adress
Future<String?> sendVerificationCode(LoginData loginData) async {
  try {
    Client client = AppwriteClient.getClient();
    Account account = Account(client);
    final result = await account.createVerification(
      url: 'https://example.com/verification',
    );
    return result.$id;
  } on AppwriteException catch (e) {
    if (kDebugMode) {
      print(e.message);
    }
    return null;
  }
}
