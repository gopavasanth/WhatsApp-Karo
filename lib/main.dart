// @dart=2.9
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MaterialApp(
      home: Home()
  ));
}

_launchURLBrowser(String num) async {
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
        body:
        Center(
          child: Column(
            children: <Widget>[
              Expanded(child:
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/WhatsAppKaro2.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child:
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 200, 30, 0),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Send messages without saving contacts!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontFamily: 'Roboto Mono sample',
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: number,
                        keyboardType: TextInputType.number,
                        textAlignVertical: TextAlignVertical.center,
                        cursorColor: Theme.of(context).primaryColor,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10)
                        ],
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: (){
                                number.clear();
                              },
                              icon: Icon(
                                Icons.clear,
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 1.0),
                            ),
                            hintText: 'Mobile Number',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(10.0),
                            prefixIcon: Padding(
                                padding: EdgeInsets.all(15),
                                child: Text('+91 ')
                            ),
                        ),
                      ),
                      SizedBox(height: 10),
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
                      SizedBox(height: 140),
                    ],
                  ) ,
                ),
              ),
              )
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