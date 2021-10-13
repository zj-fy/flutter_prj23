import 'package:flutter/material.dart';
import '../../utils/g.dart';
import 'package:provider/provider.dart';
import '../../providers/product_provider.dart';
import '../drawer.dart';

class Category extends StatelessWidget {
  late var skuNum;

  Widget portraitMode() {
    return Center(child: Text(skuNum.toString(), style: TextStyle(fontSize: 50)));
  }

  Widget landscapeMode() {
    return Row (
        children: [
          Container(
            height: G.getHeightPercent(1),
            width: G.getWidthPercent(0.35),
            child: MyDrawer(),
          ),
          Expanded(
            child: Center(
              child:Text(skuNum.toString(), style: TextStyle(fontSize: 50))
            )
          )
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    skuNum = Provider.of<ProductProvider>(context).skuNum;

    return OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.landscape
              ? landscapeMode() : portraitMode();
        });
  }

}