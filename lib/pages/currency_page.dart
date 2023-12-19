// ignore_for_file: library_private_types_in_public_api

import 'package:currency_converter/utils/money_format.dart';
import 'package:flutter/material.dart';

void onPressAction() {}

class CurrencyPageStateFull extends StatefulWidget {
  const CurrencyPageStateFull({super.key});

  @override
  _CurrencyPageState createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPageStateFull> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    if (textEditingController.text.isNotEmpty) {
      setState(() {
        result = double.parse(textEditingController.text) * 15000;
      });
      return;
    }

    void onBack() {
      Navigator.of(context).pop();
    }

    AlertDialog alertDialog = AlertDialog(
      title: const Text('Error'),
      content: const Text('Please input value'),
      actions: [TextButton(onPressed: onBack, child: const Text('Ok'))],
    );

    showDialog(context: context, builder: (context) => alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    const decoration = InputDecoration(
        hintText: 'Please Input Amount',
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(20), right: Radius.circular((20)))),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(
          Icons.monetization_on_outlined,
          size: 24,
          color: Colors.black,
        ));
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text(
          'Currency Converter',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.amber,
        actions: const [
          ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStatePropertyAll(0),
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.transparent)),
              onPressed: onPressAction,
              child: Icon(Icons.access_alarm))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                MoneyFormat.convertToIdr(result),
                style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textEditingController,
                style: const TextStyle(color: Colors.black),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: decoration,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: convert,
                style: const ButtonStyle(
                    elevation: MaterialStatePropertyAll(5),
                    minimumSize:
                        MaterialStatePropertyAll(Size(double.infinity, 50)),
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.blueAccent)),
                child: const Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
