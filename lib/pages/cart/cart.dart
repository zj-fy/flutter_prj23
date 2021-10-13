import 'package:flutter/material.dart';
import '../../utils/g.dart';
import '../../providers/product_provider.dart';
import 'package:provider/provider.dart';

import '../drawer.dart';

class Cart extends StatelessWidget {

  Widget portraitMode(BuildContext context) {
    return _SKUCount(context);
  }

  Widget landscapeMode(BuildContext context) {
    return Row (
        children: [
          Container(
            height: G.getHeightPercent(1),
            width: G.getWidthPercent(0.35),
            child: MyDrawer(),
          ),
          Expanded(
              child: Center(
                  child: _SKUCount(context),
              )
          )
        ]
    );
  }


  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.landscape
              ? landscapeMode(context) :
                portraitMode(context);
        });
  }

  Widget _SKUCount(BuildContext context) {
    var skuNum = Provider.of<ProductProvider>(context).skuNum;
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
              onPressed: () {
                Provider.of<ProductProvider>(context, listen: false).decrement();
              },
              child: Text('-', style: TextStyle(fontSize: 50),)),
          SizedBox(width: 20),
          Center(
            child: Text(skuNum.toString(), style: TextStyle(fontSize: 50)),
          ),
          SizedBox(width: 20),
          ElevatedButton(
              onPressed: () {
                Provider.of<ProductProvider>(context, listen: false).increment();
              },
              child: Text('+', style: TextStyle(fontSize: 50),)),
        ]
    );
  }
}