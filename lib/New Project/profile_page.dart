import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isSelected = false;

  Widget title() {
    return const Align(
      alignment: Alignment.center,
      child: Text(
        "Please select your profile",
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget mySizedBox(height, width) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * height,
      width: MediaQuery.of(context).size.height * width,
    );
  }

  Widget container() {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = true;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 12 / 100,
        width: MediaQuery.of(context).size.width * 90 / 100,
        decoration: BoxDecoration(color: Colors.white, border: Border.all()),
        child: Row(
          children: [
            mySizedBox(0, 1 / 100),
            isSelected == false
                ? const Icon(
                    Icons.circle_outlined,
                    color: Colors.grey,
                  )
                : const Icon(Icons.radio_button_checked),
            mySizedBox(0, 1 / 100),
            const Icon(
              Icons.store_mall_directory,
              size: 60,
            ),
            mySizedBox(0, 1 / 100),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                mySizedBox(2 / 100, 0),
                const Text(
                  "Shipper",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
                mySizedBox(1 / 100, 0),
                const Text(
                  "Lorem ipsum dolor sit amet,",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                const Text(
                  "consectetur adipiscing",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget container2() {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 12 / 100,
        width: MediaQuery.of(context).size.width * 90 / 100,
        decoration: BoxDecoration(color: Colors.white, border: Border.all()),
        child: Row(
          children: [
            mySizedBox(0, 1 / 100),
            isSelected == true
                ? const Icon(
                    Icons.circle_outlined,
                    color: Colors.grey,
                  )
                : const Icon(Icons.radio_button_checked),
            mySizedBox(0, 1.5 / 100),
            const Icon(
              Icons.fire_truck_rounded,
              size: 60,
            ),
            mySizedBox(0, 1.5 / 100),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                mySizedBox(2.5 / 100, 0),
                const Text(
                  "Transporter",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
                mySizedBox(1 / 100, 0),
                const Text(
                  "Lorem ipsum dolor sit amet,",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                const Text(
                  "consectetur adipiscing",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget button() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 7 / 100,
      width: MediaQuery.of(context).size.width * 90 / 100,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 41, 4, 141)),
        child: const Text(
          "CONTINUE",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          mySizedBox(20 / 100, 0),
          title(),
          mySizedBox(3 / 100, 0),
          container(),
          mySizedBox(3 / 100, 0),
          container2(),
          mySizedBox(4 / 100, 0),
          button(),
        ],
      ),
    );
  }
}
