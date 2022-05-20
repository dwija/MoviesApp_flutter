import 'package:flutter/material.dart';
import 'package:mobile_test/src/models/movie_model.dart';
import 'package:mobile_test/src/providers/movies_provider.dart';
import 'package:mobile_test/src/widgets/card_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final movProv = new MoviesProvider();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    movProv.getPopular();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Movies Flutter Test',
          style: TextStyle(
              fontFamily: 'montserrat',
              color: Colors.black,
              fontSize: size.height * 0.032,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Divider(
              color: Colors.transparent,
            ),
            Padding(
              padding: EdgeInsets.only(left: size.height * 0.015),
              child: Text(
                'Now Playing Movies',
                style: TextStyle(
                    fontFamily: 'montserrat',
                    color: Colors.black,
                    fontSize: size.height * 0.025,
                    fontWeight: FontWeight.bold),
              ),
            ),
            _swiperCards(),
            Divider(
              color: Colors.transparent,
              height: 18.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: size.height * 0.015),
              child: Text(
                'Popular Movies',
                style: TextStyle(
                    fontFamily: 'montserrat',
                    color: Colors.black,
                    fontSize: size.height * 0.025,
                    fontWeight: FontWeight.bold),
              ),
            ),
            _swiperCards2(),
          ],
        ),
      ),
    );
  } //

  Widget _swiperCards() {
    return FutureBuilder(
      future: movProv.getOnTheaters(),
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(
            pelis: snapshot.data,
          );
        } else {
          return Container(
              height: 150.0, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }

  Widget _swiperCards2() {
    return StreamBuilder(
      stream: movProv.popularsStream,
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper2(
            pelis: snapshot.data,
          );
        } else {
          return Container(
              height: 150.0, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
} //
