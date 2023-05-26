import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mfi_flutter/New%20Project/verify_page.dart';

class Otppage extends StatefulWidget {
  const Otppage({super.key});

  @override
  State<Otppage> createState() => _OtppageState();
}

class _OtppageState extends State<Otppage> {
  TextEditingController mobileController = TextEditingController();

  String verificationIdReceived = "";

  void verifyNumber() {
    auth.verifyPhoneNumber(
        phoneNumber: " +91 ${mobileController.text}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth
              .signInWithCredential(credential)
              .then((value) => {print("Your are Login Succesfully")});
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception.message);
        },
        codeSent: (String verificationID, int? resendToken) {
          verificationIdReceived = verificationID;
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
  }

  Widget closeIcon() {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.close_rounded,
            color: Colors.black,
          )),
    );
  }

  Widget mySizedBox(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget titleSubtitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Please enter Your mobile number",
          style: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        mySizedBox(20),
        Text(
          "You 'll receive a 4 digit code",
          style: TextStyle(
              color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Text(
          "to verify next",
          style: TextStyle(
              color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget textField() {
    return IntlPhoneField(
      controller: mobileController,
      decoration: const InputDecoration(
        hintText: 'Mobile Number',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget button() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 7 / 100,
      width: MediaQuery.of(context).size.width * 100 / 100,
      child: ElevatedButton(
        onPressed: () {
          verifyNumber();

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Verifypage(verificationIdReceived)));
        },
        child: const Text(
          "CONTINUE",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 41, 4, 141)),
      ),
    );
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        mySizedBox(28),
        closeIcon(),
        mySizedBox(20),
        titleSubtitle(),
        mySizedBox(20),
        textField(),
        mySizedBox(25),
        button(),
      ]),
    ));
  }
}
