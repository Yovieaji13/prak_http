import 'package:flutter/material.dart';
import 'package:prak_http/models/movie.dart';

class MovieDetailUp extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  MovieDetailUp(this.movie);

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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                height: height / 1.5,
                child: Image.network(path),
              ),
                
                Padding(
                 padding: EdgeInsets.all(20),
                 child:  Card(
                  child: Text
                  (movie.overview, 
                  style: TextStyle(color: Colors.black,fontSize: 15)),
                  )
                )
            ],
          ),
        ),
      ),
    );
  }
}