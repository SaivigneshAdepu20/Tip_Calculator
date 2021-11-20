import 'package:flutter/material.dart';

class BillSplitter extends StatefulWidget {
  const BillSplitter({Key? key}) : super(key: key);

  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int tipPercentage = 0;
  int personCounter = 1;
  double billAmount = 0;
  calculateTotalPerPerson(double billAmount, int splitBy, int tipPercentage) {
    var totalPerson =
        (calculateTotalTip(billAmount, splitBy, tipPercentage) + billAmount) /
            splitBy;
    return totalPerson.toStringAsFixed(2);
  }

  calculateTotalTip(double billAmount, int splitBy, int tipPercentage) {
    double totalTip = 0;
    if (billAmount < 0 || billAmount.toString().isEmpty) {
    } else {
      totalTip = (billAmount * tipPercentage) / 100;
    }
    return totalTip;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            // margin:
            //     EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
            alignment: Alignment.center,
            color: Colors.white,
            child: ListView(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(20.5),
              children: <Widget>[
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.purpleAccent.shade100,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Total Per Person',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 15.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            '\₹ ${calculateTotalPerPerson(billAmount, personCounter, tipPercentage)}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.blueGrey.shade100,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        style: const TextStyle(color: Colors.black87),
                        decoration: const InputDecoration(
                            hintText: 'Bill Amount ', prefix: Text('₹')),
                        onChanged: (String value) {
                          try {
                            billAmount = double.parse(value);
                          } catch (e) {
                            billAmount = 0;
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text(
                            'Split',
                            style: TextStyle(color: Colors.black87),
                          ),
                          Row(
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (personCounter > 1) {
                                      personCounter--;
                                    } else {}
                                  });
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  margin: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: Colors.purpleAccent.shade100,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      '-',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                '$personCounter',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    personCounter++;
                                  });
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  margin: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: Colors.purpleAccent.shade100,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      '+',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text(
                            'Tip',
                            style: TextStyle(color: Colors.black87),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              'rupess ${calculateTotalTip(billAmount, personCounter, tipPercentage)}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            '$tipPercentage %',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                            ),
                          ),
                          Slider(
                            min: 0,
                            max: 100,
                            activeColor: Colors.purple,
                            inactiveColor: Colors.grey,
                            // divisions: 10,
                            value: tipPercentage.toDouble(),
                            onChanged: (double value) {
                              setState(
                                () {
                                  tipPercentage = value.round();
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
