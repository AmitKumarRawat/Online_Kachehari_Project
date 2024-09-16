import 'package:flutter/material.dart';

Container itemProfile(String title, String subtitle, IconData icondata) {
  return Container(
    height: 200,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            color: Colors.blueAccent.withOpacity(.2),
            spreadRadius: 5,
            blurRadius: 10,
          )
        ]),
    child: ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Icon(icondata),
      tileColor: Colors.white,
    ),
  );
}
