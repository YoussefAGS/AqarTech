import 'package:aqartech/core/utils/widgets/error_handler_uI.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection_container.dart';
import '../refactor/villa_details_body.dart';

class VillaDetailsScreen extends StatefulWidget {
  String id;

  VillaDetailsScreen({super.key, required this.id});

  @override
  _VillaDetailsScreenState createState() =>
      _VillaDetailsScreenState();
}

class _VillaDetailsScreenState extends State<VillaDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return villaDetailsBody();
  }
}
