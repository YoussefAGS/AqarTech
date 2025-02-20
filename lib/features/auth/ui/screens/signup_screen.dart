import 'package:flutter/material.dart';
import 'package:aqartech/features/auth/ui/refactor/signup_body.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  SignupBodyWithSliverAppBar(),
    );
  }
}