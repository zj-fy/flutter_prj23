import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'providers/product_provider.dart';
import 'providers/user_provider.dart';
import 'package:flutter_study_two/utils/g.dart';
import 'package:provider/provider.dart';
import 'pages/index_page.dart';
import 'routes/routes.dart';
import 'utils/g.dart';

void main() {
  Routes.configureRoutes(G.router);
  runApp(
    // 使用 Provider
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: MyApp(),
    ),
    // const MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(CommonDefine.originalScreenWidth,
                       CommonDefine.originalScreenHeight),
      builder: () => MaterialApp (
        title: 'Flutter Study Two',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: IndexPage(),
      ),
    );
  }
}

