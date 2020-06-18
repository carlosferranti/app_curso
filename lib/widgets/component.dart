


import 'package:app_curso/models/noticias_model.dart';
import 'package:app_curso/models/user_model.dart';
import 'package:flutter/material.dart';


class UserTile extends StatelessWidget {

  final User user;

  const UserTile(Noticias elementAt, {Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
    ? CircleAvatar(child: Icon(Icons.person))
    : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
    leading: avatar,  
    );
  }
}