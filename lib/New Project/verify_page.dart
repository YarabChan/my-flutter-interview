import 'package:flutter/material.dart';
import 'package:mfi_flutter/New%20Project/profile_page.dart';
import 'package:sms_autofill/sms_autofill.dart';

// ignore: must_be_immutable
class Verifypage extends StatefulWidget {
  String verificationIdReceived;
  String mobileController;
  Verifypage(this.verificationIdReceived, this.mobileController, {super.key});

  @override
  State<Verifypage> createState() => _VerifypageState();
}

class _VerifypageState extends State<Verifypage> with CodeAutoFill {
  TextEditingController otpController = TextEditingController();

  String codeValue = "";

  @override
  void codeUpdated() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    listenOtp();
  }

  listenOtp() async {
    await SmsAutoFill().unregisterListener();
    listenForCode();
    await SmsAutoFill().listenForCode();
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  Widget arrowIcon() {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_rounded,
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
      children: [
        const Text(
          "Verify Phone",
          style: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        mySizedBox(15),
        Text(
          "Code is sent to ${widget.mobileController} ",
          style: const TextStyle(
              color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget otpBox() {
    return Column(
      children: [
        Center(
          child: PinFieldAutoFill(
              decoration: UnderlineDecoration(
                textStyle: const TextStyle(fontSize: 20, color: Colors.black),
                colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
              ),
              codeLength: 6,
              currentCode: codeValue,
              onCodeChanged: (code) {
                setState(() {
                  codeValue = code.toString();
                });
              },
              onCodeSubmitted: (val) {}),
        )
      ],
    );
  }

  Widget richText() {
    return RichText(
      text: const TextSpan(
          text: "Didn't receive the code?",
          style: TextStyle(
              color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w400),
          children: <TextSpan>[
            TextSpan(
                text: "Request Again",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500))
          ]),
    );
  }

  Widget button() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 7 / 100,
      width: MediaQuery.of(context).size.width * 100 / 100,
      child: ElevatedButton(
        onPressed: () async {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Profile()));
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 41, 4, 141)),
        child: const Text(
          " VERIFY AND CONTINUE",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            mySizedBox(25),
            arrowIcon(),
            mySizedBox(20),
            titleSubtitle(),
            mySizedBox(25),
            otpBox(),
            mySizedBox(20),
            richText(),
            mySizedBox(38),
            button(),
          ],
        ),
      ),
    );
  }
}
