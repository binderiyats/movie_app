import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app_new/models/movie/index.dart';
import 'package:movie_app_new/providers/common.dart';
import 'package:provider/provider.dart';
import 'package:movie_app_new/utils/index.dart';

class MovieDetailPage extends StatefulWidget {
  final MovieModel data;

  const MovieDetailPage(this.data, {Key? key}) : super(key: key);

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!Provider.of<CommonProvider>(context, listen: false).isLoggedIn) {
        Provider.of<CommonProvider>(context, listen: false).changeCurrentIdx(2);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Нэвтэрнэ үү!")));
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Consumer<CommonProvider>(
      builder: ((context, provider, child) {
        return Scaffold(
          backgroundColor: Color.fromARGB(255, 29, 30, 31),
          body: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(
                      height: width * 1.5,
                      width: width,
                      child: Stack(
                        children: [
                          Image.network(
                            widget.data.imgUrl,
                            fit: BoxFit.fill,
                          ),
                          Container(
                            color: Colors.black.withOpacity(0.3),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.play_circle,
                                  color: Color.fromARGB(255, 246, 242, 242)
                                      .withOpacity(0.5),
                                  size: 70,
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  widget.data.title,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "${widget.data.publishedYear} | ${Utils.minToString(widget.data.durationMin)} | ${widget.data.type}",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                      fontSize: 18),
                                ),
                                SizedBox(height: 40),
                              ],
                            ),
                          ),
                          SafeArea(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(
                                  Icons.chevron_left,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            ),
                          ),
                          SafeArea(
                            child: Align(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                onPressed: () =>
                                    provider.addWishList(widget.data.id),
                                icon: Icon(
                                  provider.isWishMovie(widget.data)
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined,
                                  color: Colors.white.withOpacity(0.8),
                                  size: 35,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Column(
                      children: [
                        Text(
                          "Тайлбар",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 26),
                        ),
                        SizedBox(height: 15),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            widget.data.description ?? "",
                            style: TextStyle(
                                color: Colors.grey.withOpacity(0.8),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
    ;
  }
}
