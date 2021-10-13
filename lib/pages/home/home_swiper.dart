import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import '../../utils/g.dart';

class HomeSwiper extends StatefulWidget {
  @override
  _HomeSwiperState createState() => _HomeSwiperState();
}

class _HomeSwiperState extends State<HomeSwiper> {
  var _futureSaved;
  List<Image> _swiperImages = [];

  @override void initState() {
    super.initState();

    _futureSaved = G.api.home.getSlideImages();
  }

  Widget build(Object context) {
    return FutureBuilder (
        future: _futureSaved,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Container();
            case ConnectionState.waiting:
              return Center(
                  child: CircularProgressIndicator()
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(
                    child: Text(
                        '${snapshot.error}',
                        style: TextStyle(color: Colors.red)
                    )
                );
              } else if (snapshot.hasData) {
                _swiperImages = snapshot.data as List<Image>;
                return Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return _swiperImages[index];
                      },
                      indicatorLayout: PageIndicatorLayout.SCALE,
                      autoplay: true,
                      autoplayDelay: 3000,
                      itemCount: _swiperImages.length,
                      scrollDirection: Axis.horizontal,
                      pagination: new SwiperPagination(alignment: Alignment.bottomCenter),
                      control: new SwiperControl(),
                      viewportFraction: 1,
                    );
              } else {
                return Center(
                    child: CircularProgressIndicator()
                );
              }
              break;
            default:
              return Container();
              break;
          }
        }
    );

  }
}