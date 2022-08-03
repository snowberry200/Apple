import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

import '../HomeLayOuts/passlayout.dart';

class DesktopScreen extends StatefulWidget {
  const DesktopScreen({Key? key}) : super(key: key);

  @override
  State<DesktopScreen> createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    GlobalKey<FormState> formkey = GlobalKey<FormState>();

    bool checked = true;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: CupertinoColors.white,
        body: Column(children: [
          navBar(),
          SizedBox(
            width: width / 2.5,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 40, left: 0, right: 0, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: const Expanded(
                        child: Image(
                          image: AssetImage('images/app.jpg'),
                          width: 300,
                          height: 200,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Apple ID',
                    style: TextStyle(
                        fontSize: 21,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Text('Manage Your Apple ID'),
                  const SizedBox(height: 20),
                  Form(
                    key: formkey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: TextFormField(
                        enableSuggestions: true,
                        autocorrect: true,
                        showCursor: true,
                        autofocus: false,
                        textAlign: TextAlign.start,
                        strutStyle: const StrutStyle(),
                        style: const TextStyle(),
                        textInputAction: TextInputAction.done,
                        textCapitalization: TextCapitalization.characters,
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(left: 15, right: 15),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          hintText: 'Apple ID',
                          suffixIcon: Padding(
                            padding:
                                const EdgeInsets.only(right: 20.0, bottom: 15),
                            child: IconButton(
                                hoverColor: CupertinoColors.white,
                                icon: const Icon(
                                  Icons.arrow_circle_right,
                                  size: 40,
                                  color: Colors.grey,
                                ),
                                onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => PassLayout(
                                            email: emailController.text)))),
                          ),
                        ),
                        validator: (ifemail) =>
                            !EmailValidator.validate(ifemail!)
                                ? 'Enter a valid email'
                                : null,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
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
                  const SizedBox(height: 10),
                  TextButton(
                      onPressed: () {},
                      child: const Text('Forgotten your Apple ID or password?',
                          style: TextStyle(fontSize: 12, letterSpacing: 1.7))),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ]),
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

  navBar() {
    return AppBar(
        backgroundColor: CupertinoColors.white,
        leading: const Padding(
          padding: EdgeInsets.only(top: 20, left: 20),
          child: Text(
            'Apple ID',
            style: TextStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
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
                        style: TextStyle(color: Colors.black, fontSize: 11),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: TextButton(
                          onPressed: () {},
                          child: const Text('Create An Apple ID',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 11)))),
                  TextButton(
                      onPressed: () {},
                      child: const Text('FAQ',
                          style: TextStyle(color: Colors.black, fontSize: 11)))
                ],
              )),
        ],
        elevation: 2);
  }
}
