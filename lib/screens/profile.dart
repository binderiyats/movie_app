import 'package:flutter/material.dart';
import 'package:movie_app_new/providers/common.dart';
import 'package:movie_app_new/screens/login.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size);

    return Consumer<CommonProvider>(
      builder: ((context, provider, child) {
        return provider.isLoggedIn
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.1,
                    width: size.width / 2,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Bello"),
                    ),
                  ),
                  ElevatedButton(onPressed: () {}, child: Text("Language")),
                  ElevatedButton(
                    onPressed: provider.onLogout,
                    child: Text("Гарах"),
                  ),
                ],
              ))
            : LoginPage();
      }),
    );
  }
}
