import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/data/themes.dart';

// ignore: must_be_immutable
class LoadingWidget extends StatelessWidget {
  Color? color;
  LoadingWidget({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GetPlatform.isIOS
          ? CupertinoActivityIndicator(
              color: color ?? whiteColor,
            )
          : SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                color: color ?? whiteColor,
                strokeWidth: 2,
              ),
            ),
    );
  }
}
