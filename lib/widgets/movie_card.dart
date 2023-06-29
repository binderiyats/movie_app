import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app_new/models/movie/index.dart';
import 'package:movie_app_new/screens/movie_detail.dart';

class MovieCard extends StatelessWidget {
  final MovieModel data;

  const MovieCard(this.data, {Key? key}) : super(key: key);

  void _onCardTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MovieDetailPage(data),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.31;

    return InkWell(
      onTap: () => _onCardTap(context),
      child: Column(
        children: [
          Container(
            height: width * 1.5,
            width: width,
            margin: EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(data.imgUrl),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            width: width,
            child: Text(
              data.title,
              style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
