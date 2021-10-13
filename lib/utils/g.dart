import 'dart:convert';

import '../api/api.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluro/fluro.dart';

class G {
  static bool _isEn = false;

  static final API api = API();
  static FluroRouter router = FluroRouter.appRouter;

  static double getWidthPercent(double percent) {
    if (percent >= 1) {
      return CommonDefine.originalScreenWidth.w;
    } else {
      return CommonDefine.originalScreenWidth.w * percent;
    }
  }

  static double getHeightPercent(double percent) {
    if (percent >= 1) {
      return CommonDefine.originalScreenHeight.h;
    } else {
      return CommonDefine.originalScreenHeight.h * percent;
    }
  }

  static double getWidgetEdge() {
    return CommonDefine.originalScreenWidth.w * CommonDefine.widgetEdgePercent;
  }

  static parseQuery({required Map<String, dynamic> params}) {
    String query =  "";
    if (params != null) {
      int index = 0;
      for (String key in params.keys) {
        final String value = Uri.encodeComponent(params[key].toString());
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }
    return query.toString();
  }

  static void setLocal(bool isEn) {
    _isEn = isEn;
  }

  static String getLocalText(String key) {
    if (_isEn) {
      return CommonDefine.localizedTextEN[key] ?? key;
    } else {
      return CommonDefine.localizedTextCN[key] ?? key;
    }
  }
}

class CommonDefine {
  static const double originalScreenWidth = 1080;
  static const double originalScreenHeight = 1920;
  static const double widgetEdgePercent = 0.015;

  static const Map<String, String> localizedTextEN = {
    "Home": "Home",
    "Category": "Category",
    "Cart": "Cart",
    "MyPage": "MyPage",
    "Scan": "Scan",
    "Pay": "Pay",
    "Get": "Get",
    "Card": "Card",
  };

  static const Map<String, String> localizedTextCN = {
    "Home": "主页",
    "Category": "分类",
    "Cart": "购物车",
    "MyPage": "我",
    "Scan": "扫码",
    "Pay": "支付",
    "Get": "收钱",
    "Card": "卡包",
  };
}


class ShopAtom {
  /*
    {id: 810000201206190017,
    title: 沙县小吃,
    logo: http://dummyimage.com/100X100/9479f2,
    rating: 3.5,
    sale: 月售1249单,
    average: 55元/人,
    minimum_order_amount: 30,
    delivery_fee: 3,
    is_new: 1,
    is_premium: 0,
    distance: 1.2,
    open: 06:00,
    close: 22:00,
    phone: 13333333333,
    latitude: 31.25592,
    longitude: 123.55121334,
    desc: ,
    address: 北京市海淀区XXX街道100号}
   */

  dynamic id;
  String title = "";
  String logo = "";
  double rating = 0;
  String sale = "";
  String average = "";
  dynamic minimum_order_amount;
  dynamic delivery_fee;
  dynamic is_new;
  dynamic is_premium;
  dynamic distance;
  String open = "";
  String close = "";
  dynamic phone;
  dynamic latitude;
  dynamic longitude;
  String desc = "";
  String address = "";
  String rawData = "";

  ShopAtom(Map<String, dynamic> rawData) {
    this.rawData = json.encode(rawData);
    this.id = rawData['id'];
    this.title = rawData['title'];
    this.logo = rawData['logo'];
    this.rating = double.tryParse(rawData['rating'].toString()) ?? 0;
    this.sale = rawData['sale'];
    this.average = rawData['average'];
    this.minimum_order_amount = rawData['minimum_order_amount'];
    this.delivery_fee = rawData['delivery_fee'];
    this.is_new = rawData['is_new'];
    this.is_premium = rawData['is_premium'];
    this.distance = rawData['distance'];
    this.open = rawData['open'];
    this.close = rawData['close'];
    this.phone = rawData['phone'];
    this.latitude = rawData['latitude'];
    this.longitude = rawData['longitude'];
    this.desc = rawData['desc'];
    this.address = rawData['address'];
  }
}