import 'package:flutter/material.dart';
import 'package:mobile_test/src/models/movie_model.dart';

class MovieDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movie = ModalRoute.of(context)!.settings.arguments as Movie;
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _buildAppBar(movie, size),
        SliverList(
            delegate: SliverChildListDelegate([
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(size.height * 0.02),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(
                    image: NetworkImage(movie.getPosterImg()),
                    height: size.height * 0.23,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '${movie.title} ',
                      style: TextStyle(
                          fontFamily: 'montserrat',
                          color: Colors.black,
                          fontSize: size.height * 0.025,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${movie.originalTitle} ',
                      style: TextStyle(
                        fontFamily: 'montserrat',
                        color: Colors.black,
                        fontSize: size.height * 0.02,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star),
                        Text(
                          '${movie.voteAverage.toString()} ',
                          style: TextStyle(
                            fontFamily: 'montserrat',
                            color: Colors.black,
                            fontSize: size.height * 0.02,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: size.height * 0.05),
                          child: Text(
                            '${movie.releaseDate} ',
                            style: TextStyle(
                              fontFamily: 'montserrat',
                              color: Colors.black,
                              fontSize: size.height * 0.02,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${movie.originalLanguage} ',
                      style: TextStyle(
                        fontFamily: 'montserrat',
                        color: Colors.black,
                        fontSize: size.height * 0.02,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(size.height * 0.02),
            child: Text(
              movie.overview!,
              style: TextStyle(
                fontFamily: 'montserrat',
                color: Colors.black,
                fontSize: size.height * 0.025,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(size.height * 0.02),
            child: Text(
              movie.overview!,
              style: TextStyle(
                fontFamily: 'montserrat',
                color: Colors.black,
                fontSize: size.height * 0.025,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(size.height * 0.02),
            child: Text(
              movie.overview!,
              style: TextStyle(
                fontFamily: 'montserrat',
                color: Colors.black,
                fontSize: size.height * 0.025,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(size.height * 0.02),
            child: Text(
              movie.overview!,
              style: TextStyle(
                fontFamily: 'montserrat',
                color: Colors.black,
                fontSize: size.height * 0.025,
              ),
            ),
          ),
        ]))
      ],
    ));
  }

  Widget _buildAppBar(Movie movie, size) {
    return SliverAppBar(
      foregroundColor: Colors.white,
      elevation: 2.0,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        expandedTitleScale: 1.3,
        collapseMode: CollapseMode.parallax,
        title: Text(
          movie.title!,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontFamily: 'montserrat',
              color: Colors.white,
              fontSize: size.height * 0.028,
              fontWeight: FontWeight.bold),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(movie.getBackImg()),
          //fadeInDuration: Duration(microseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
} //
