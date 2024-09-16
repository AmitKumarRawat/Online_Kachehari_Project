import 'package:flutter/material.dart';
import 'package:flutter_online_kachehari/components/update_profile/edit.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Edit(),
    );
  }
}