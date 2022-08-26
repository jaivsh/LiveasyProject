import 'package:flutter/material.dart';

class PostAuth extends StatefulWidget {
  const PostAuth({Key? key}) : super(key: key);

  @override
  State<PostAuth> createState() => _PostAuthState();
}

class _PostAuthState extends State<PostAuth> {
  int groupvalue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.transparent,
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(children: [
            const Text(
              'Please select your profile',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 0, right: 0),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 16, right: 16),
                  child: Container(
                    height: 100,
                    child: Card(
                      semanticContainer: true,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black, width: 3),
                          borderRadius: BorderRadius.circular(2)),
                      child: Row(
                        children: [
                          Radio(
                              value: 1,
                              groupValue: groupvalue,
                              onChanged: (value) {
                                setState(() {
                                  groupvalue = 1;
                                });
                              }),
                          Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Image.asset(
                                "assets/images/shipperouter.png",
                                fit: BoxFit.fill,
                              ),
                              Image.asset(
                                "assets/images/shipperinner.png",
                                fit: BoxFit.fill,
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                'Shipper',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    'Lorem Ipsum Donor sit amet,\nconseqtar adepsi',
                                    textAlign: TextAlign.center,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 10, left: 16, right: 16),
                  child: Container(
                    height: 100,
                    child: Card(
                      semanticContainer: true,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black, width: 3),
                          borderRadius: BorderRadius.circular(2)),
                      child: Row(
                        children: [
                          Radio(
                              value: 2,
                              groupValue: groupvalue,
                              onChanged: (value) {
                                setState(() {
                                  groupvalue = 2;
                                });
                              }),
                          Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Image.asset(
                                "assets/images/transporter.png",
                                fit: BoxFit.fill,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(left: 0),
                                  child: const Text(
                                    'Transporter',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  )),
                              Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: const Text(
                                    'Lorem Ipsum Donor sit amet,\nconseqtar adepsi',
                                    textAlign: TextAlign.center,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18, left: 18, top: 25),
                  child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Process Completed!')));
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.deepPurple),
                        child: const Text(
                          'COMPLETE!',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )),
                ),
              ]),
            ),
          ]),
        )));
  }
}
