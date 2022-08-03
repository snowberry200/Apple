import 'package:apple/Verify/verifylayout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class PassDesktopScreen extends StatefulWidget {
  final String callback;
  const PassDesktopScreen({Key? key, required this.callback}) : super(key: key);

  @override
  State<PassDesktopScreen> createState() => _PassDesktopScreenState();
}

class _PassDesktopScreenState extends State<PassDesktopScreen> {
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool checked = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: navBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20,
              ),
              child: SizedBox(
                width: width / 2.5,
                child: ListView(
                  children: [
                    SizedBox(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: const Expanded(
                          flex: 1,
                          child: Image(
                            image: AssetImage('images/app.jpg'),
                            width: 300,
                            height: 200,
                            fit: BoxFit.contain,
                          ),
                        ),
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
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10.0),
                                child: TextFormField(
                                  enableSuggestions: true,
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
                                          right: 20.0, bottom: 0),
                                      child: Link(
                                        target: LinkTarget.self,
                                        uri: Uri.parse('google.com'),
                                        builder: (context, followLink) =>
                                            IconButton(
                                                hoverColor:
                                                    CupertinoColors.white,
                                                icon: const Icon(
                                                  Icons.arrow_circle_right,
                                                  size: 30,
                                                  color: Colors.grey,
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              VerifyLayoutPage(
                                                                  verify: widget
                                                                      .callback)));
                                                  // if (formkey.currentState!
                                                  //     .validate()) {}
                                                }),
                                      ),
                                    ),
                                  ),
                                  validator: (ifpassword) {
                                    if (ifpassword!.isNotEmpty &&
                                        ifpassword.length < 7) {
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
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
                            style:
                                TextStyle(color: Colors.black, fontSize: 11)))),
                TextButton(
                    onPressed: () {},
                    child: const Text('FAQ',
                        style: TextStyle(color: Colors.black, fontSize: 11)))
              ],
            )),
      ],
      elevation: 2);
}
