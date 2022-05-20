import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:mobile_test/src/models/movie_model.dart';

class MovieSlider extends StatelessWidget {
  //final _pageController = new PageController();

  final List<Movie> movies;
  final Movie movie = Movie();
  MovieSlider({required this.movies});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'detail', arguments: movie);
      },
      child: Container(
        width: double.infinity,
        height: _screenSize.height * 0.3,
        child: Swiper(
          itemWidth: double.infinity,
          itemHeight: 200.0,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: FadeInImage(
                        placeholder:
                            NetworkImage('https://i.stack.imgur.com/y9DpT.jpg'),
                        fit: BoxFit.cover,
                        image: NetworkImage(movies[index].getPosterImg()),
                      )),
                ],
              ),
            );
          },
          itemCount: movies.length,
          viewportFraction: 0.35, //SEPARACION ENTRE TARJETAS
          scale: 0.9, //ESCALA DE TAMAÑO
        ),
      ),
    );
  }
}//
