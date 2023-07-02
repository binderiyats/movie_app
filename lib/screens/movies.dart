import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app_new/models/movie/index.dart';
import 'package:movie_app_new/providers/common.dart';
import 'package:movie_app_new/widgets/movie_card.dart';
import 'package:movie_app_new/widgets/movie_special_card.dart';
import 'package:provider/provider.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  Future<List<MovieModel>> _getMovie() async {
    String res =
        await DefaultAssetBundle.of(context).loadString("assets/movie.json");
    List<MovieModel> data = MovieModel.fromList(jsonDecode(res));
    Provider.of<CommonProvider>(context, listen: false).setMovies(data);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: _getMovie(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          final _specialMovie = snapshot.data!.length > 3
              ? snapshot.data!.sublist(0, 3)
              : snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, bottom: 20, top: 20),
                  child: Text(
                    "Шилдэг",
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.only(left: 10),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      _specialMovie.length,
                      ((index) => SpecialCard(
                            _specialMovie[index],
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10, top: 20, bottom: 20),
                  child: Text(
                    "Бүх кинонууд",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Wrap(
                    children: List.generate(
                      snapshot.data!.length,
                      (index) => MovieCard(
                        snapshot.data![index],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          );
        } else {
          return Center(
            child: SizedBox(
              child: CircularProgressIndicator(),
            ),
          );
        }
      }),
    );
  }
}
