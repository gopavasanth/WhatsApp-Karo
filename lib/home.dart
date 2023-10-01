import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp_karo/consts.dart';
import 'package:whatsapp_karo/utils.dart';

_launchURLBrowser(String num) async {
  // if there is no number, return and don't launch the url
  if (num.isEmpty) return;

  if (num.startsWith("+91")) {
    num = num.substring(3);
  }
  num = num.toString();
  UrlHelper.launchWhatsApp(num);
}

class Home extends StatelessWidget {
  final number = TextEditingController();

  Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Container(
                height: 140,
                width: 140,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.center,
                    image: AssetImage("assets/chat.png"),
                  ),
                ),
              ),
              Expanded(
                child: Column(children: <Widget>[
                  const SizedBox(height: 30),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          indent: 20.0,
                          endIndent: 10.0,
                          thickness: 1,
                        ),
                      ),
                      Text(
                        "Send messages without saving contacts",
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                      Expanded(
                        child: Divider(
                          indent: 10.0,
                          endIndent: 20.0,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(30, 20, 0, 2),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Center(
                          child: Text(
                            "Message Now!",
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w700)),
                          ),
                        )),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 10),
                    child: TextFormField(
                      controller: number,
                      keyboardType: TextInputType.phone,
                      maxLength: 13,
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.0),
                        ),
                        prefixIcon: const Padding(
                            padding: EdgeInsets.all(15), child: Text('+91 ')),
                        suffixIcon: IconButton(
                          onPressed: () {
                            number.clear();
                          },
                          icon: const Icon(
                            Icons.clear,
                            color: Colors.black,
                          ),
                        ),
                        hintText: "WhatsApp Number",
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(40, 2, 40, 10),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: ElevatedButton(
                          onPressed: () => _launchURLBrowser(number.text),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Constants.primaryColor,
                            foregroundColor: Colors.black,
                          ),
                          child: const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FaIcon(FontAwesomeIcons.whatsapp),
                              Text(
                                " Message",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              )
                            ],
                          )
                          // icon: 'message',
                          // child: Text("Send Message"),
                          ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                "Whats",
                style: TextStyle(
                  color: Constants.primaryColor,
                  fontSize: MediaQuery.of(context).size.height / 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("Karo",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.height / 30,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[900],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            color: Colors.black,
            width: 500,
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(text: "Designed with ❤ by "),
                  TextSpan(
                    text: "Gopa Vasanth",
                    style:
                        const TextStyle(decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = UrlHelper.launchWebsite,
                  ),
                ])),
              ],
            ),
          ),
        ));
  }
}
