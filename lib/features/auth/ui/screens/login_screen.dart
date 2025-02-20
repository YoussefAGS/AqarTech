
import 'package:flutter/material.dart';
import 'package:aqartech/features/auth/ui/refactor/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  LoginBodyWithSliverAppBar(),
    );
  }
}

