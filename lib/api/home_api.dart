import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../utils/g.dart';

class HomeAPI {
  final Dio _dio;

  HomeAPI(this._dio);

  Future<List<ShopAtom>> getShopList() async {
    print("getShopList(): Start.");
    List<ShopAtom> retShopList = [];

    try {
      Response response = await _dio.get('/shop/list/');
      Map<String, dynamic> responseJsonData = response.data
       as Map<String, dynamic>;
      List<dynamic> listZone = responseJsonData['data']['list'];

      //print(listZone);

      for (var _ in [0,1]) {
        listZone.forEach((element) {
          print("getShopList(): Get shop: " + element['title']);
          retShopList.add(ShopAtom(element));
        });
      }
    } on Error {
      print("getShopList(): Error.");
    }

    print("getShopList(): End.");

    return retShopList;
  }

  Future<List<Image>> getSlideImages() async {
    print("getSlideImages(): Start.");
    List<Image> retImages = [];

    try {
      Response response = await _dio.get('/home/slide/');

      Map<String, dynamic> responseJsonData = response.data as Map<
          String,
          dynamic>;
      List<dynamic> listZone = responseJsonData['data']['list'];

      listZone.forEach((element) {
        print("getSlideImages(): Get image from: " + element['image']);
        retImages.add(Image.network(element['image'], fit: BoxFit.fill));
      });

      print("getSlideImages(): Get " + retImages.length.toString() + " images from server.");
    } on Error {
      print("getSlideImages(): Error.");
    }

    return retImages;
  }

}
