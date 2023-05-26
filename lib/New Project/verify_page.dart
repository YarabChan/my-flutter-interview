import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mfi_flutter/New%20Project/profile_page.dart';
import 'package:otp_autofill/otp_autofill.dart';

class Verifypage extends StatefulWidget {
  String verificationIdReceived;
  Verifypage(this.verificationIdReceived, {super.key});

  @override
  State<Verifypage> createState() => _VerifypageState();
}

class _VerifypageState extends State<Verifypage> {
  late OTPInteractor _otpInteractor;
  TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _otpInteractor = OTPInteractor();
    _otpInteractor
        .getAppSignature()
        .then((value) => print('signature - $value'));

    otpController = OTPTextEditController(
      codeLength: 6,
      onCodeReceive: (code) => print('Your Application receive code - $code'),
      otpInteractor: _otpInteractor,
    )..startListenUserConsent(
        (code) {
          final exp = RegExp(r'(\d{5})');
          return exp.stringMatch(code ?? '') ?? '';
        },
        strategies: [
          //SampleStrategy(),
        ],
      );
  }

  Widget arrowIcon() {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          onPressed: () {},
          icon: Icon(
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
        Text(
          "Verify Phone",
          style: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        mySizedBox(15),
        Text(
          "Code is sent to 8094508485",
          style: TextStyle(
              color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget otpBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(color: Color.fromARGB(255, 81, 169, 241)),
          child: TextFormField(
            controller: otpController,
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(color: Color.fromARGB(255, 84, 160, 223)),
          child: TextFormField(
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(color: Color.fromARGB(255, 89, 158, 214)),
          child: TextFormField(
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(color: Color.fromARGB(255, 92, 154, 204)),
          child: TextFormField(
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(color: Color.fromARGB(255, 92, 154, 204)),
          child: TextFormField(
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(color: Color.fromARGB(255, 92, 154, 204)),
          child: TextFormField(
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ],
          ),
        ),
      ],
    );
  }

  Widget richText() {
    return RichText(
      text: TextSpan(
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
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Profile()));
        },
        child: Text(
          " VERIFY AND CONTINUE",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 41, 4, 141)),
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
