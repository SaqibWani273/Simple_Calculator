import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

import 'result_widget.dart';
//import 'symbolsWidget.dart';
import 'symbols_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String expression1 = '';
  String result = '';
  void updateExpression(String exp) {
    setState(() {
      expression1 += exp;
      print(expression1);
    });
  }

  void cancelExpression(String exp) {
    setState(() {
      expression1 = '0';
      // print(expression1);
    });
  }

  void cancelPreviousExpression(String exp) {
    setState(() {
      expression1 += exp;
      // print(expression1);
    });
  }

  void elvaluateExpression() {
    setState(() {
      result = expression1.interpret().toString();
    });
  }

  void getSymbol(String id, String symbol) {
    switch (id) {
      case 'expression':
        updateExpression(symbol);
        break;
      case 'cancel':
        cancelExpression(symbol);
        break;
      case 'cancelPrevious':
        cancelPreviousExpression(symbol);
        break;
      case 'equalTo':
        elvaluateExpression();
        break;

      default:
    }
  }

  Color symbolColor(String id) {
    if (id == 'expression')
      return Colors.blue;
    else if (id == 'equalTo')
      return Colors.green;
    else
      return Colors.redAccent;
  }

  SymbolsWidget() {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 300,
      width: double.infinity,
      child: GridView.count(
        crossAxisCount: 4,
        childAspectRatio: 2.0,
        padding: EdgeInsets.zero,
        //    shrinkWrap: true,

        //  children: operatorandOperands.map((e) => Text(e)).toList(),
        children: allSymbols
            .map(
              (symbolMap) => InkWell(
                onTap: () {
                  getSymbol(symbolMap['id'].toString(),
                      symbolMap.values.first.toString());
                },
                child: Card(
                    color: symbolColor(symbolMap['id'].toString()),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),

                    //    print('fff');
                    elevation: 40,
                    shadowColor: Colors.amber,
                    child: Container(
                      //     flex: symbolMap['id'].toString() == 'equalTo' ? 1 : 2,
                      // height: 500,
                      //  margin: EdgeInsets.all(90),
                      child: Center(
                        child: Text(symbolMap.values.first,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 30)),
                      ),
                    )),
              ),
            )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Calculator',
            textAlign: TextAlign.center,
          ),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          ResultWidget(expression1, result),
          SymbolsWidget(),
        ]),
      ),
    );
  }
}
