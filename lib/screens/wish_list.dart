import 'package:flutter/material.dart';
import 'package:movie_app_new/models/movie/index.dart';
import 'package:movie_app_new/providers/common.dart';
import 'package:movie_app_new/widgets/movie_card.dart';
import 'package:provider/provider.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonProvider>(
      builder: ((context, provider, child) {
        return Padding(
          padding: EdgeInsets.only(left: 10),
          child: Wrap(
            children: List.generate(
              provider.wishMovies.length,
              (index) => MovieCard(
                provider.wishMovies[index],
              ),
            ),
          ),
        );
      }),
    );
  }
}
