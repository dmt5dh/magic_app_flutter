import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class LoadingWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        animating: true,
        radius: 20.0,
      )
    );
  }
}