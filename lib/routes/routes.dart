import 'package:fluro/fluro.dart';
import 'routes_handler.dart';

class Routes {
  static void configureRoutes(FluroRouter router) {

    router.define('/', handler: indexHandler);
    router.define('/detail', handler: detailHandler);
    router.define('/mine', handler: mineHandler);
    router.define('/home', handler: homeHandler);
    router.define('/login', handler: loginHandler);

    router.notFoundHandler = unknownHandler;
  }
}