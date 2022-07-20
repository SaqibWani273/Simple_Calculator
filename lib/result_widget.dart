import 'package:flutter/material.dart';
import 'symbols_list.dart';

class ResultWidget extends StatelessWidget {
  String exp, result;
  ResultWidget(this.exp, this.result, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(10),
            height: 100,
            child: Text(exp,
                textAlign: TextAlign.left, style: TextStyle(fontSize: 30)),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            height: 50,
            child: Text('=$result',
                textAlign: TextAlign.left, style: TextStyle(fontSize: 30)),
          ),
        ],
      ),
    );
  }
}
