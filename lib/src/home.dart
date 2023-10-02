import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp_karo/consts.dart';
import 'package:whatsapp_karo/src/bottom_bar.dart';
import 'package:whatsapp_karo/src/whatsapp_input.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
              child: Column(
                children: <Widget>[
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
                  WhatsAppInput(),
                ],
              ),
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
      bottomNavigationBar: const BottomBar(),
    );
  }
}
