import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:liveasy_project/entermobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Image.asset("assets/images/undraw_Typing_re_d4sq.png",
                    fit: BoxFit.cover)),
            const Text('Please Select Your Language',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'You can change the language \n at any time',
                  textAlign: TextAlign.center,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 72, right: 72),
              child: DropdownButtonFormField<String>(
                items: <String>[
                  'English-US',
                  'English-UK',
                  'English-AU',
                  'English-IND'
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (_) {
                  check = true;
                },
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 72, left: 72, top: 25),
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (check) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EnterMobile()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Please select the language first!')));
                      }
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.deepPurple),
                    child: const Text(
                      'NEXT',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
            Expanded(
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        Image.asset(
                          "assets/images/waves-back.png",
                          fit: BoxFit.fill,
                        ),
                        Image.asset(
                          "assets/images/waves-front.png",
                          fit: BoxFit.fill,
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
