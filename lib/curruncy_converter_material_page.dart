import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});
  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  final TextEditingController textEditingController = TextEditingController();
  double resault = 0;

  void convert() {
    resault = double.parse(textEditingController.text) * 365;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderSide: const BorderSide(
            color: Color.fromARGB(255, 0, 0, 0),
            width: 2.0,
            style: BorderStyle.solid,
            strokeAlign: BorderSide.strokeAlignInside),
        borderRadius: BorderRadius.circular(60));
    return Scaffold(
        appBar: AppBar(
          title: Title(
              color: const Color.fromARGB(255, 0, 0, 0),
              child: const Text(
                'Currency Converter',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 25,
                ),
              )),
          backgroundColor: const Color.fromARGB(255, 96, 165, 175),
          centerTitle: true,
        ),
        backgroundColor: const Color.fromARGB(255, 96, 165, 175),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                'Rs ${resault != 0 ? resault.toStringAsFixed(2) : resault.toStringAsFixed(0)}',
                style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(212, 56, 3, 3)),
              ),
              Container(
                //container include is one and all widgets
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: textEditingController,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  decoration: InputDecoration(
                    hintText: 'Please enter the amount in USD',
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 14,
                        fontWeight: FontWeight.w200),
                    prefixIcon: const Icon(Icons.monetization_on),
                    prefixIconColor: const Color.fromARGB(255, 0, 0, 0),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: 350,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    convert();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 40),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                  ),
                  child: const Text('Convert'),
                ),
              ),
            ],
          ),
        )));
  }
}
