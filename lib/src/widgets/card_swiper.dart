import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:mobile_test/src/models/movie_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie>? pelis;
  CardSwiper({@required this.pelis});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: _screenSize.height * 0.48,
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width * 0.55,
        itemHeight: _screenSize.height * 0.45,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: GestureDetector(
                onTap: () {
                  Movie mov = pelis![index];
                  Navigator.pushNamed(context, 'detalle', arguments: mov);
                }, //NAVEGA A LA PELICULA SELECIONADA
                child: FadeInImage(
                  placeholder:
                      NetworkImage('https://i.stack.imgur.com/y9DpT.jpg'),
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      pelis?[index].getPosterImg()), // ASI CARGO LA IMAGEN
                ),
              ));
        },
        itemCount: pelis!.length,
        viewportFraction: 0.35, //SEPARACION ENTRE TARJETAS
        scale: 0.9, //ESCALA DE TAMAÑO
      ),
    );
  }
}

class CardSwiper2 extends StatelessWidget {
  final List<Movie>? pelis;
  CardSwiper2({@required this.pelis});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: _screenSize.height * 0.25,
      child: Swiper(
        itemWidth: _screenSize.width * 0.3,
        itemHeight: _screenSize.height * 0.2,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: GestureDetector(
                onTap: () {
                  Movie mov = pelis![index];
                  Navigator.pushNamed(context, 'detalle', arguments: mov);
                },
                child: FadeInImage(
                  placeholder:
                      NetworkImage('https://i.stack.imgur.com/y9DpT.jpg'),
                  fit: BoxFit.cover,
                  image: NetworkImage(pelis?[index].getPosterImg()),
                ),
              ));
        },
        itemCount: pelis!.length,
        viewportFraction: 0.35,
        scale: 0.9,
      ),
    );
  }
}
