import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/g.dart';
import '../../providers/product_provider.dart';
import '../drawer.dart';
import 'home_big_button.dart';
import 'home_swiper.dart';
import 'home_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Widget portraitMode() {
    return Column(
      children: [
        Container(
          height: G.getHeightPercent(0.15),
          child: HomeSwiper(),
        ),
        Container(
          height: G.getHeightPercent(0.10),
          child: HomeBigButton(widgetHeight: G.getHeightPercent(0.10)),
        ),
        Expanded(
          child: HomeList(),
        )
      ],
    );
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
            child: Column(
              children: [
                Container(
                  height: G.getHeightPercent(0.3),
                  child: HomeSwiper(),
                ),
                Expanded(
                  child: HomeList(),
                )
              ],
            ),
        )
      ]
    );
  }

  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.landscape
              ? landscapeMode() : portraitMode();
        });
  }

  Widget _SKUCount(BuildContext context) {
    var skuNum = Provider.of<ProductProvider>(context).skuNum;
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          ElevatedButton(
              onPressed: () {
                Provider.of<ProductProvider>(context, listen: false)
                    .decrement();
              },
              child: Text(
                '-',
                style: TextStyle(fontSize: 50),
              )),
          SizedBox(width: 20),
          Center(
            child: Text(skuNum.toString(), style: TextStyle(fontSize: 50)),
          ),
          SizedBox(width: 20),
          ElevatedButton(
              onPressed: () {
                Provider.of<ProductProvider>(context, listen: false)
                    .increment();
              },
              child: Text(
                '+',
                style: TextStyle(fontSize: 50),
              )),
        ]);
  }
}