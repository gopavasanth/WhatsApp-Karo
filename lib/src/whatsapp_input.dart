import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:phone_number/phone_number.dart';
import 'package:whatsapp_karo/consts.dart';
import 'package:whatsapp_karo/src/countries.dart';
import 'package:whatsapp_karo/utils.dart';

class WhatsAppInput extends StatefulWidget {
  const WhatsAppInput({super.key});

  @override
  State<WhatsAppInput> createState() => _WhatsAppInputState();
}

class _WhatsAppInputState extends State<WhatsAppInput> {
  late TextEditingController numberController;
  late FocusNode focusNode;

  late String countryString;
  late Map<String, String> currentCountry;

  late bool showClear;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    currentCountry = Constants.defaultCountry;
    setCountry();
    // numberController = TextEditingController(text: currentCountry['dial_code']);
    numberController = TextEditingController();
    showClear = false;
  }

  setCountry() {
    setState(() {
      countryString = Countries.getFlagEmoji(currentCountry['code']!);
    });
  }

  clearInput() {
    numberController.clear();
    focusNode.unfocus();
    setState(() {
      showClear = false;
    });
  }

  launchURLBrowser(String num) async {
    // if there is no number, return and don't launch the url
    if (num.isEmpty) return;

    // format the mobile number before launching the url
    try {
      // parse the number according to the current country code
      var res = await PhoneNumberUtil()
          .parse(num, regionCode: currentCountry['code']);

      num = res.e164;

      debugPrint(num);

      UrlHelper.launchWhatsApp(num);
    } catch (e) {
      debugPrint(e.toString());
      showInvalidNumber();
    }
  }

  showInvalidNumber() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(Constants.invalidMessageTitle),
          content: const Text(Constants.invalidMessageDesc),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text(Constants.closeButtonText))
          ],
        );
      },
    );
  }

  sendMessage() {
    launchURLBrowser(numberController.text);
  }

  textOnChange(String text) {
    showClear = text.isNotEmpty;
    if (text.isNotEmpty) {
      // change current country and flag from what is pasted or typed
      for (var element in Countries.allCountries) {
        // print(element['dial_code']);
        if (text.contains(element['dial_code']!)) {
          currentCountry = element;
          setCountry();
        }
      }
    }
    // print('testing $text');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(40, 20, 40, 10),
          height: 90,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  height: double.maxFinite,
                  width: 120,
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: const BoxDecoration(
                    border: Border.fromBorderSide(
                        BorderSide(color: Colors.black, width: 1.0)),
                    borderRadius: BorderRadius.all(
                        Radius.circular(Constants.borderRadius)),
                  ),
                  child: Center(
                      child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: currentCountry['code'],
                      items: Countries.allCountries
                          // .sort((a, b) =>
                          //     a['dial_code']!.compareTo(b['dial_code']!))
                          .map(
                            (e) => DropdownMenuItem<String>(
                                value: e['code'],
                                child: Text(
                                    '${Countries.getFlagEmoji(e['code']!)}  ${e['dial_code']}')),
                          )
                          .toList(),
                      onChanged: (value) {
                        for (var element in Countries.allCountries) {
                          // print(element['dial_code']);
                          if (value! == (element['code']!)) {
                            currentCountry = element;
                            setCountry();
                          }
                        }
                      },
                    ),
                  )),
                ),
              ),
              Expanded(
                child: TextFormField(
                  focusNode: focusNode,
                  controller: numberController,
                  onFieldSubmitted: (_) => sendMessage(),
                  onChanged: textOnChange,
                  // onTap: numberController.selectAll,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  // inputFormatters: [],
                  // maxLength: 13,
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                      borderRadius: BorderRadius.all(
                          Radius.circular(Constants.borderRadius)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.0),
                      borderRadius: BorderRadius.all(
                          Radius.circular(Constants.borderRadius)),
                    ),
                    suffixIcon: showClear
                        ? IconButton(
                            onPressed: clearInput,
                            icon: const Icon(
                              Icons.clear,
                              color: Colors.black,
                            ),
                          )
                        : null,
                    hintText: Constants.inputHintMessage,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(40, 2, 40, 10),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: ElevatedButton(
              onPressed: sendMessage,
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
                    Constants.buttonText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// extension TextEditingControllerExt on TextEditingController {
//   void selectAll() {
//     if (text.isEmpty) return;
//     selection = TextSelection(baseOffset: 0, extentOffset: text.length);
//   }
// }
