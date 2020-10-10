import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPrcntOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendingPrcntOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
    children:[
      FittedBox(
        child: Text("${spendingAmount.toStringAsFixed(0)}"
        )),
      SizedBox(height: 4,),
      Container(
        height: 100,
        width: 20,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
                border:Border.all(color: Colors.grey,width: 1.0)
              ),
            ),
            FractionallySizedBox(
              heightFactor: spendingPrcntOfTotal,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ],
        ),
      ),
      SizedBox(height: 4,),
      Text("$label")
    ]);
  }
}
