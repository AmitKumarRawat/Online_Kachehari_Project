import 'package:flutter/material.dart';


Container editForm(
    String labelText,
    IconData icondata,
    TextInputType inputType,
    TextEditingController _controller,
    bool radioEnable,
    String genderTitle,
    String value,
    String _gender,
    ValueChanged<String?> onGenderChanged) {
  return Container(
    height: 70,
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
    child: radioEnable
        ? RadioListTile(
            value: value,
            groupValue: _gender,
            onChanged: onGenderChanged,
            title: Text(genderTitle),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  icon: Icon(icondata),
                  labelText: labelText,
                  border: InputBorder.none),
              keyboardType: inputType,
            ),
          ),
  );
}
