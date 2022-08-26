import 'package:flutter/material.dart';
import 'package:liveasy_project/verifymobile.dart';

class EnterMobile extends StatefulWidget {
  const EnterMobile({Key? key}) : super(key: key);

  @override
  State<EnterMobile> createState() => _EnterMobileState();
}

class _EnterMobileState extends State<EnterMobile> {
  TextEditingController phonecontroller = TextEditingController();
  late String phonenumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Center(
          child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Column(
                children: [
                  const Text(
                    "Please enter your mobile number",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        'You will receive a 4-digit code \n to verify next',
                        textAlign: TextAlign.center,
                      )),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 18, right: 18),
                    child: TextFormField(
                      controller: phonecontroller,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Enter your mobile number",
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text("+91"),
                        ),
                        prefixIconConstraints:
                            BoxConstraints(minWidth: 0, minHeight: 0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 2),
                        ),
                      ),
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return 'Enter mobile number';
                        } else {
                          if (phonecontroller.text.length == 10) {
                            phonenumber = phonecontroller.text;
                          }
                        }
                        return null;
                      }),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 18, left: 18, top: 25),
                    child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (phonecontroller.text.length == 10) {
                              phonenumber = phonecontroller.text;
                              print(phonenumber);
                            }
                            if (phonenumber.length == 10) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VerifyPhone(
                                            phonenumber: phonenumber,
                                          )));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Please enter the correct 10-digit phone number!')));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple),
                          child: const Text(
                            'CONTINUE',
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
                                "assets/images/mobilenotwo.png",
                                fit: BoxFit.fill,
                              ),
                              Image.asset(
                                "assets/images/mobilenoone.png",
                                fit: BoxFit.fill,
                              )
                            ],
                          )))
                ],
              ))),
    );
  }
}
