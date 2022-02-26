// @dart=2.9
import 'package:flutter/material.dart';
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
        backgroundColor: Colors.grey[900],
        body:
        Column(
          children: <Widget>[
            Expanded(child:
            Container(
              height: 750,
              width: 500,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/WhatsAppKaro2.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child:
              Padding(
                padding: EdgeInsets.fromLTRB(30, 100, 30, 0),
                // padding: new EdgeInsets.all(8.0),
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
                        fontFamily: 'Roboto',
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: number,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1.0),
                        ),
                        hintText: 'Mobile Number',
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
                            Icon(Icons.message),
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
                    SizedBox(height: 60),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("Designed with ❤ by Gopa Vasanth",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                backgroundColor: Colors.black
                            ),
                          ),
                        ],
                      ),
                      color: Colors.black,
                      width: 500,
                      height: 50.0,
                    ),
                  ],
                ) ,
              ),
            ),
            )
          ],
        ),
        appBar: AppBar(
          title: Text('WhatsApp Karo',
              style: TextStyle(fontSize: 30)
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[900],
        )
    );
  }
}