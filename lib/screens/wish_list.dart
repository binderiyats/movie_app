import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app_new/models/movie/index.dart';
import 'package:movie_app_new/widgets/movie_card.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({Key? key}) : super(key: key);

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  Future<List<MovieModel>> _getMovie() async {
    String res =
        await DefaultAssetBundle.of(context).loadString("assets/movie.json");
    return MovieModel.fromList(jsonDecode(res));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieModel>>(
      future: _getMovie(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.only(left: 10),
            child: Wrap(
              children: List.generate(
                [].length,
                (index) => MovieCard(
                  [][index],
                ),
              ),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      }),
    );
  }
}
