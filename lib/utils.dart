import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlHelper {
  static void launchWhatsApp(String mobileNumber) {
    String url = 'https://wa.me/$mobileNumber';
    debugPrint(url); // always do a print only in debug
    _launchUrl(Uri.parse(url));
  }

  static void launchWebsite() {
    const url = "https://gopavasanth.github.io";
    _launchUrl(Uri.parse(url));
  }

  static Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
