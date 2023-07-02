import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app_new/providers/common.dart';
import 'package:movie_app_new/screens/movies.dart';
import 'package:movie_app_new/screens/profile.dart';
import 'package:movie_app_new/screens/wish_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Widget> _totalPage = [MoviesPage(), WishListPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonProvider>(builder: ((context, provider, child) {
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 29, 30, 31),
        body: SafeArea(child: _totalPage[provider.currentIdx]),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: provider.currentIdx,
            onTap: provider?.changeCurrentIdx,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Movies"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "Liked"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile")
            ]),
      );
    }));
  }
}
