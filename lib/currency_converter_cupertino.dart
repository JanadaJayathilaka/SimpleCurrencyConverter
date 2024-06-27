import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() =>
      _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState
    extends State<CurrencyConverterCupertinoPage> {
  final TextEditingController textEditingController = TextEditingController();
  double resault = 0;

  void convert() {
    resault = double.parse(textEditingController.text) * 365;
    setState(() {});
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Title(
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
        ),
        backgroundColor: const Color.fromARGB(255, 96, 165, 175),
        child: Center(
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
                child: CupertinoTextField(
                  controller: textEditingController,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  decoration: BoxDecoration(
                      color: CupertinoColors.white,
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      borderRadius: BorderRadius.circular(60)),
                  placeholder: 'Please enter the amount in USD',
                  prefix: const Icon(CupertinoIcons.money_dollar),
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
                child: CupertinoButton(
                  onPressed: () {
                    convert();
                  },
                  color: const Color.fromARGB(255, 0, 0, 0),
                  child: const Text('Convert'),
                ),
              ),
            ],
          ),
        )));
  }
}
