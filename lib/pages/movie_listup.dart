import 'package:flutter/material.dart';
import 'package:prak_http/pages/movie_detailup.dart';
import 'package:prak_http/pages/movie_list.dart';
import 'package:prak_http/pages/movie_listnow.dart';
import 'package:prak_http/pages/movie_listtop.dart';
import 'package:prak_http/service/http_service.dart';

class MovieListUp extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieListUp> {
  int moviesCount;
  List movies;
  HttpService service;
  var image;

  Future initialize() async {
    movies = [];
    movies = await service.getupcomingMovie();
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upcoming Movies"),
        backgroundColor: Colors.black,
      ),

      drawer: Drawer(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("MOVIE MENU"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.movie),
              title: Text("Movie Top Rate"),
              onTap: () {
                MaterialPageRoute route = MaterialPageRoute(
                    builder: (_) => MovieListTop());
                Navigator.push(context, route);
              },
            ),
             ListTile(
              leading: Icon(Icons.movie),
              title: Text("Movie Upcoming"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
             ListTile(
              leading: Icon(Icons.movie),
              title: Text("Movie Now Playing"),
              onTap: () {
                MaterialPageRoute route = MaterialPageRoute(
                    builder: (_) => MovieListNow());
                Navigator.push(context, route);
              },
            ),
            ListTile(
              title: Text("BACK HOME"),
              onTap: () {
                MaterialPageRoute route = MaterialPageRoute(
                    builder: (_) => MovieList());
                Navigator.push(context, route);
              },
            ),
          ],
        ),
      ),

      body: ListView.builder(
        itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
        itemBuilder: (context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: Image.network(
                  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/' +
                      movies[position].posterPath),
              title: Text(movies[position].title),
              subtitle: Text(
                'Rating = ' + movies[position].voteAverage.toString(),
              ),
              onTap: () {
                MaterialPageRoute route = MaterialPageRoute(
                    builder: (_) => MovieDetailUp(movies[position]));
                Navigator.push(context, route);
              },
            ),
          );
        },
      ),
    );
  }
}