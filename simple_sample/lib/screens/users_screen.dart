import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quickblox_sdk/models/qb_user.dart';
import 'package:quickblox_sdk/quickblox_sdk.dart';
import 'package:quickblox_sdk_example/utils/dialog_utils.dart';
import 'package:quickblox_sdk_example/utils/snackbar_utils.dart';

class UsersScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: _buildAppBar(),
        body: Center(
            child: Column(children: [
          _buildButton('create user', () => createUser()),
          _buildButton('get users', () => getUsers()),
          _buildButton('get users by tag', () => getUsersByTag()),
          _buildButton('update user', () => updateUser())
        ])));
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
        title: const Text('Users'),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.of(context).pop()));
  }

  Widget _buildButton(String title, Function? callback) {
    return MaterialButton(
        minWidth: 200,
        child: Text(title),
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        onPressed: () => callback?.call());
  }

  Future<void> createUser() async {
    String login = "FLUTTER_USER_" + DateTime.now().millisecond.toString();
    String password = "FlutterPassword";
    try {
      QBUser? user = await QB.users.createUser(login, password);
      int? userId = user!.id;
      SnackBarUtils.showResult(
          _scaffoldKey, "User was created: \n login: $login \n password: $password \n id: $userId");
    } on PlatformException catch (e) {
      DialogUtils.showError(context, e);
    }
  }

  Future<void> getUsers() async {
    try {
      List<QBUser?> userList = await QB.users.getUsers();
      int count = userList.length;
      SnackBarUtils.showResult(_scaffoldKey, "Users were loaded. Count is: $count");
    } on PlatformException catch (e) {
      DialogUtils.showError(context, e);
    }
  }

  Future<void> getUsersByTag() async {
    List<String> tags = [];
    tags.add("TestUserTag");

    try {
      List<QBUser?> userList = await QB.users.getUsersByTag(tags);
      int count = userList.length;
      SnackBarUtils.showResult(_scaffoldKey, "Users were loaded. Count is: $count");
    } on PlatformException catch (e) {
      DialogUtils.showError(context, e);
    }
  }

  Future<void> updateUser() async {
    try {
      String websiteUrl = "www.google.com";
      QBUser? user = await QB.users.updateUser(website: websiteUrl);
      String? email = user!.email;
      SnackBarUtils.showResult(_scaffoldKey, "User with email $email was updated");
    } on PlatformException catch (e) {
      DialogUtils.showError(context, e);
    }
  }
}
