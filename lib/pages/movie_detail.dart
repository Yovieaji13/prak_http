import 'package:flutter/material.dart';
import 'package:prak_http/models/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath;
    } else {
      path =
          'https://image.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: Colors.black,
      ),

      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container( 
                padding: EdgeInsets.all(16),
                height: height / 1.5,
                child: Image.network(path),
              ),
                
              Container(
                child: Text('Sinopsis Movie ' + movie.title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
              ),

                Container(
                 padding: EdgeInsets.all(20),
                 child: Text
                    (movie.overview, 
                    style: TextStyle(color: Colors.white,fontSize: 15)),
                  ),

              Container(
                child: Text(' (Rating ' +  movie.voteAverage.toString() + ')', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
              ),
            ],
          ),
        ),
      ),
    );
  }
}