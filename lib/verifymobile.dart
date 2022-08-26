import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liveasy_project/postauth.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pinput/pinput.dart';
import 'package:pinput/src/pinput.dart' as mypinput;

class VerifyPhone extends StatefulWidget {
  final String phonenumber;
  const VerifyPhone({Key? key, required this.phonenumber}) : super(key: key);

  @override
  State<VerifyPhone> createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  late String _verificationcode = ' ';
  bool authcheck = false;
  @override
  Widget build(BuildContext context) {
    String phnno = widget.phonenumber;
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
                  "Verify Phone",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'The code is sent to +91-$phnno',
                      textAlign: TextAlign.center,
                    )),
                Center(
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Pinput(
                          androidSmsAutofillMethod:
                              AndroidSmsAutofillMethod.smsRetrieverApi,
                          onCompleted: (value) async {
                            try {
                              print(_verificationcode);
                              await FirebaseAuth.instance
                                  .signInWithCredential(
                                      PhoneAuthProvider.credential(
                                          verificationId: _verificationcode,
                                          smsCode: value))
                                  .then((value) async {
                                if (value.user != null) {
                                  print('Pass to home!');
                                  authcheck = true;
                                }
                              });
                            } catch (e) {
                              FocusScope.of(context).unfocus();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Invalid verification code!')));
                            }
                          },
                          length: 6,
                          validator: (s) {
                            return s == _verificationcode
                                ? 'Pin is correct!'
                                : 'Pin is incorrect!';
                          },
                          onSubmitted: (value) async {
                            try {
                              await FirebaseAuth.instance
                                  .signInWithCredential(
                                      PhoneAuthProvider.credential(
                                          verificationId: _verificationcode,
                                          smsCode: value))
                                  .then((value) async {
                                if (value.user != null) {
                                  print('Pass to home!');
                                  authcheck = true;
                                }
                              });
                            } catch (e) {
                              FocusScope.of(context).unfocus();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Invalid verification code!')));
                            }
                          },
                          defaultPinTheme: mypinput.PinTheme(
                            width: 48,
                            height: 48,
                            textStyle: const TextStyle(
                                fontSize: 20, color: Colors.white),
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              border: Border.all(
                                  color:
                                      const Color.fromRGBO(234, 239, 243, 1)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ))),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18, left: 18, top: 25),
                  child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (authcheck) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PostAuth()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Invalid Authentication code!')));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.deepPurple),
                        child: const Text(
                          'VERIFY AND CONTINUE',
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
            )),
      ),
    );
  }

  verifyotp() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91${widget.phonenumber}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) async {
          if (value.user != null) print("User successfully logged in!");
        });
        authcheck = true;
      },
      verificationFailed: (FirebaseAuthException error) {
        print(error.message);
      },
      timeout: const Duration(seconds: 120),
      codeSent: (verificationId, forceResendingToken) {
        setState(() {
          _verificationcode = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (verificationId) {
        setState(() {
          _verificationcode = verificationId;
        });
      },
    );
  }

  newcode() {}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verifyotp();
  }
}
