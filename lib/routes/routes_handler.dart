import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study_two/pages/home/home_detail.dart';
import 'package:flutter_study_two/pages/mine/login.dart';
import '../pages/404.dart';
import '../pages/index_page.dart';
import '../pages/home/home_detail.dart';

// 空页面
var unknownHandler = new Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return InvalidPage();
    }
);

// 默认页
var indexHandler = new Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return IndexPage();
    }
);

// Detail page
var detailHandler = new Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return HomeDetail(detail: params['detail']!.first);
    }
);

// Login page
var loginHandler = new Handler(
    handlerFunc: (BuildContext? context, Map<String, Object> params) {
      return Login();
    }
);

var mineHandler = new Handler(
    handlerFunc: (BuildContext? context, Map<String, Object> params) {
      // return Mine(); // 直接跳转，没有 appBar

      // 跳转到 tab 中的一个页面
      return IndexPage(currentIndex: 3);
    }
);

var homeHandler = new Handler(
    handlerFunc: (BuildContext? context, Map<String, Object> params) {
      // return Mine(); // 直接跳转，没有 appBar

      // 跳转到 tab 中的一个页面
      return IndexPage(currentIndex: 1);
    }
);