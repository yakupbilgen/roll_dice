import 'dart:math';

import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MaterialApp(
    home: ZarAt(),
  ));
}

class ZarAt extends StatefulWidget {
  @override
  _ZarAtState createState() => _ZarAtState();
}

class _ZarAtState extends State<ZarAt> {
  int diceOneCount = 0;
  int diceTwoCount = 0;
  String diceOneImage = 'assets/images/0.png';
  String diceTwoImage = 'assets/images/0.png';
  int totalDiceCount = 0;
  String title = 'Toplam Atılan Zar';
  String buttonText = 'Zar At';

  buildZarAt() {
    Random rnd = Random();
    diceOneCount = rnd.nextInt(7);
    if (diceOneCount == 0) {
      diceOneCount++;
    }
    diceOneImage = "assets/images/$diceOneCount.png";

    diceTwoCount = rnd.nextInt(7);
    if (diceTwoCount == 0) {
      diceTwoCount++;
    }
    diceTwoImage = "assets/images/$diceTwoCount.png";
    totalDiceCount++;

    buttonText = 'Tekrar At';
    setState(() {});
  }

  clearDiceRoll() {
    diceOneCount = 0;
    diceTwoCount = 0;
    totalDiceCount = 0;
    diceOneImage = 'assets/images/0.png';
    diceTwoImage = 'assets/images/0.png';
    buttonText = 'Zar At';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(title + " = " + totalDiceCount.toString()),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 10)),
              Expanded(
                  child: SizedBox(
                height: deviceHeight,
                child: Column(
                  children: [
                    SizedBox(
                      height: deviceHeight * 0.3,
                      child: Image.asset(diceOneImage),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    SizedBox(
                      height: deviceHeight * 0.3,
                      child: Image.asset(diceTwoImage),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    ElevatedButton(
                      onPressed: () => buildZarAt(),
                      child: Text(buttonText, style: TextStyle(fontSize: 40)),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    ElevatedButton(
                      onPressed: () => clearDiceRoll(),
                      child: Text('Sıfırla', style: TextStyle(fontSize: 30)),
                    ),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
