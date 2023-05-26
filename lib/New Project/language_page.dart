import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:mfi_flutter/New%20Project/otp_page.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  final items = ["English", "Tamil", "Hindi", "Telugu", "Malayalam"];
  String? value;

  @override
  Widget build(BuildContext context) {
    Widget bottomPaintSection() {
      return Positioned(
        bottom: 0,
        child: Stack(children: [
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width,
                (MediaQuery.of(context).size.height * 0.8).toDouble()),
            painter: BlueCustomPaint(),
          ),
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width,
                (MediaQuery.of(context).size.height * 0.8).toDouble()),
            painter: GreyCustomPaint(),
          ),
        ]),
      );
    }

    Widget mySizedBox(double height) {
      return SizedBox(
        height: height,
      );
    }

    Widget titleSubTitleSection() {
      return Column(
        children: [
          Text(
            "Please select your Language",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          mySizedBox(15),
          Text(
            "You can change the language",
            style: TextStyle(
                color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400),
          ),
          Text(
            "at any time",
            style: TextStyle(
                color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400),
          )
        ],
      );
    }

    Widget dropDownSection() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: MediaQuery.of(context).size.height * 6 / 100,
        width: MediaQuery.of(context).size.width * 60 / 100,
        decoration: BoxDecoration(color: Colors.white, border: Border.all()),
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          hint: Text("Select your language"),
          underline: SizedBox(),
          items: items.map(buildMenuItem).toList(),
          onChanged: (value) => setState(() => this.value = value),
        ),
      );
    }

    Widget buttonSection() {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 6 / 100,
        width: MediaQuery.of(context).size.width * 60 / 100,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Otppage()));
          },
          child: Text(
            "NEXT",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 41, 4, 141)),
        ),
      );
    }

    Widget imageSection() {
      return Icon(
        Icons.photo_outlined,
        size: 60,
      );
    }

    Widget mainSection() {
      return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageSection(),
            mySizedBox(20),
            titleSubTitleSection(),
            mySizedBox(25),
            dropDownSection(),
            mySizedBox(25),
            buttonSection()
          ],
        ),
      );
    }

    return Scaffold(
      body: Stack(children: [bottomPaintSection(), mainSection()]),
    );
  }
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
    ));

class GreyCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Color.fromRGBO(130, 121, 121, 0.6)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.8496951);
    path0.quadraticBezierTo(size.width * 0.1721000, size.height * 0.9201220,
        size.width * 0.3981250, size.height * 0.8682927);
    path0.quadraticBezierTo(size.width * 0.6116500, size.height * 0.7922683,
        size.width * 0.8886000, size.height * 0.8583049);
    path0.lineTo(size.width, size.height * 0.8723537);
    path0.lineTo(size.width, size.height * 1.0121829);
    path0.lineTo(0, size.height * 1.0040488);

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BlueCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Color.fromARGB(255, 59, 170, 235)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(0, size.height * 0.8496951);
    path0.quadraticBezierTo(size.width * 0.2555000, size.height * 0.7921220,
        size.width * 0.4690250, size.height * 0.8682927);
    path0.quadraticBezierTo(size.width * 0.7116250, size.height * 0.9467439,
        size.width, size.height * 0.8723537);

    path0.lineTo(size.width, size.height * 1.0121829);
    path0.lineTo(0, size.height * 1.0040488);

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
