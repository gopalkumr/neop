import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final TextEditingController onsignupverification = TextEditingController();

class Signupverification extends StatefulWidget {
  const Signupverification({super.key});

  @override
  State<Signupverification> createState() => _SignupverificationState();
}

class _SignupverificationState extends State<Signupverification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          "sign up verification",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Icon(
              CupertinoIcons.check_mark_circled,
              color: Colors.black,
            ),
            SizedBox(height: 20),
            Text(
              'Get ready to verify your email',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  //implement hint text
                  hintText: 'Enter your verification code',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {},
              child: Text('Verify'),
              color: Colors.black,
              textColor: Colors.white,
              height: 50,
              shape: RoundedRectangleBorder(
                //increasing the button height

                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
