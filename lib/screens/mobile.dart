import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../HomeLayOuts/passlayout.dart';
import '../main.dart';

enum MenuItem { signin, createanappleid, faq }

class MobileScreen extends StatefulWidget {
  const MobileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool checked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
          padding: const EdgeInsets.only(top: 50.0),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20,
              ),
              child: ListView(
                children: [
                  SizedBox(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const Image(
                        filterQuality: FilterQuality.high,
                        image: AssetImage('images/app.jpg'),
                        width: 300,
                        height: 170,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
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
                    height: 25,
                  ),
                  SizedBox(
                    child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: TextFormField(
                          
                          enableInteractiveSelection: true,
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
                          controller: emailController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                                left: 10, right: 10, top: 5, bottom: 5),
                            border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            hintText: 'Apple ID',
                            hintStyle: const TextStyle(fontSize: 16),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10.0, bottom: 0),
                              child: IconButton(
                                  hoverColor: CupertinoColors.white,
                                  icon: const Icon(
                                    Icons.arrow_circle_right,
                                    size: 30,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () => Navigator.of(context)
                                      .push(MaterialPageRoute(
                                          builder: (context) => PassLayout(
                                                email: emailController.text,
                                              )))),
                            ),
                          ),
                          validator: (ifemail) =>
                              !EmailValidator.validate(ifemail!)
                                  ? 'Enter a valid email'
                                  : null,
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
                      child: const Text('Forgotten your Apple ID or password?',
                          style: TextStyle(fontSize: 12, letterSpacing: 0.1))),
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
