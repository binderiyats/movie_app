import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movie_app_new/providers/common.dart';
import 'package:movie_app_new/screens/login.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonProvider>(
      builder: ((context, provider, child) {
        return provider.isLoggedIn
            ? Center(
                child: ElevatedButton(
                  onPressed: provider.onLogout,
                  child: Text("Гарах"),
                ),
              )
            : LoginPage();
      }),
    );
  }
}
