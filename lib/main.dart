// @dart=2.9
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
      home: Home()
  ));
}

_launchURLBrowser(String num) async {
  if (num.startsWith("+91")) {
    num = num.substring(3);
  }
  num=num.toString();
  String url = 'https://wa.me/+91${num}';
  print(url);
  if (!await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
class Home extends StatelessWidget {
  @override
  final number = TextEditingController();
  Widget build (BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 50),
            Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.center,
                  image: AssetImage("assets/chat.png"),
                ),
              ),
            ),
            Expanded (
              child: Container(
                  child: Column(
                      children: <Widget>[
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
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
                        SizedBox(height: 10,),
                        Container(
                          padding: const EdgeInsets.fromLTRB(30, 20, 0, 2),
                          child:
                          Align(
                              alignment: Alignment.centerLeft,
                              child:Center(
                                child:Text("Message Now!",
                                  style: GoogleFonts.lato(textStyle: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700
                                  )),
                                ),
                              )
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(40, 20, 40, 10),
                          child:
                          TextFormField(
                            controller: number,
                            keyboardType: TextInputType.phone,
                            maxLength: 13,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black, width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black, width: 1.0),
                              ),
                              prefixIcon: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Text('+91 ')
                              ),
                              suffixIcon: IconButton(
                                onPressed: (){
                                  number.clear();
                                },
                                icon: Icon(
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
                          child:
                          RaisedButton(
                              onPressed: () => _launchURLBrowser(number.text),
                              color: Colors.amber,
                              padding: EdgeInsets.all(3.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.whatsapp),
                                  Text("Message",
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
                      ]
                  )
              ),
            ),
          ],
        ),
      ),
        appBar: AppBar(
          title: Container(
              child: Row(
                children: [
                  Text(
                    "Whats",
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: MediaQuery.of(context).size.height / 30,
                        fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                      "Karo",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.height / 30,
                          fontWeight: FontWeight.bold
                      )
                  ),

                ],
              )
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[900],
        ),
        bottomNavigationBar: BottomAppBar(
          child:
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                              text: "Designed with ❤ by "
                          ),
                          TextSpan(
                              text: "Gopa Vasanth",
                              style: TextStyle(decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()..onTap =  () async{
                                var url = "https://gopavasanth.github.io";
                                if (!await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not open $url';
                                }
                              }
                          ),
                        ]
                    )),
              ],
            ),
            color: Colors.black,
            width: 500,
            height: 50.0,
          ),
        )
    );
  }
}