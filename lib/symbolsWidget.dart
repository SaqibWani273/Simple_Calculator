import 'package:calculator/symbols_list.dart';
import 'package:flutter/material.dart';

class SymbolsWidget extends StatelessWidget {
  final VoidCallback selectedSymbol;
  SymbolsWidget(this.selectedSymbol, {Key? key}) : super(key: key);
  Color symbolColor(String id) {
    if (id == 'expression')
      return Colors.blue;
    else if (id == 'equalTo')
      return Colors.green;
    else
      return Colors.redAccent;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 300,
      width: double.infinity,
      child: GridView.count(
        crossAxisCount: 4,
        childAspectRatio: 2.5,
        padding: EdgeInsets.zero,
        //    shrinkWrap: true,

        //  children: operatorandOperands.map((e) => Text(e)).toList(),
        children: allSymbols
            .map(
              (symbolMap) => InkWell(
                onTap: () {},
                child: Card(
                    color: symbolColor(symbolMap['id'].toString()),

                    //    print('fff');
                    elevation: 20,
                    shadowColor: Colors.amber,
                    child: Center(
                      child: Text(
                        symbolMap.values.first,
                        textAlign: TextAlign.center,
                      ),
                    )),
              ),
            )
            .toList(),
      ),
    );
  }
}
