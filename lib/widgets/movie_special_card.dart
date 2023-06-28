import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app_new/models/movie/index.dart';

class SpecialCard extends StatelessWidget {
  final MovieModel data;

  const SpecialCard(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.4;
    return Container(
      height: width * 1.5,
      width: width,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(data.imgUrl),
        ),
      ),
      child: Icon(
        Icons.play_circle,
        color: Colors.black.withOpacity(0.5),
        size: 40,
      ),
    );
  }
}
