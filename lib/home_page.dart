import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:intra_media/login_screen/sign_up.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _pracitceState();
}

class _pracitceState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              color: const Color.fromARGB(255, 163, 4, 57),
              child: Center(
                child: Text(
                  "RedEx",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          offset: Offset(-10.0, 10.0),
                          blurRadius: 15.0,
                          color: Color.fromARGB(255, 9, 0, 0),
                        ),
                      ]),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Servies",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: InkWell(
                        onTap: () {

                        },
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 173, 54, 11),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                              child: Icon(
                                Icons.send_to_mobile_outlined,
                                color: Colors.white,
                                size: 50.0,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: InkWell(
                    onTap: () {

                    },
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 173, 54, 11),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                          child: Icon(
                            Icons.payment_outlined,
                            color: Colors.white,
                            size: 50.0,
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: InkWell(
                    onTap: () {

                    },
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 173, 54, 11),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        Icons.money,
                        color: Colors.white,
                        size: 50.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Payment",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: InkWell(
                        onTap: () {

                        },
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 173, 54, 11),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                              child: Icon(
                                Icons.payment_outlined,
                                color: Colors.white,
                                size: 50.0,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: InkWell(
                    onTap: () {

                    },
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 173, 54, 11),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                          child: Icon(
                            Icons.payment_outlined,
                            color: Colors.white,
                            size: 50.0,
                          )),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Others",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(11.0),
                        child: InkWell(
                          onTap: () {

                          },
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 173, 54, 11),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                                child: Icon(
                                  Icons.payment_outlined,
                                  color: Colors.white,
                                  size: 50.0,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: InkWell(
                      onTap: () {

                      },
                      child:
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 173, 54, 11),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                            child: Icon(
                              Icons.payment_outlined,
                              color: Colors.white,
                              size: 50.0,
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: InkWell(
                      onTap: () {

                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 173, 54, 11),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                            child: Icon(
                              Icons.payment_outlined,
                              color: Colors.white,
                              size: 50.0,
                            )),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: InkWell(
                      onTap: () {

                      },
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 173, 54, 11),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                            child: Icon(
                              Icons.payment_outlined,
                              color: Colors.white,
                              size: 50.0,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}