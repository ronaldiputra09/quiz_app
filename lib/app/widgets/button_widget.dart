import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/app/data/themes.dart';
import 'package:quiz_app/app/widgets/loading_widget.dart';

class ButtonWidget extends StatelessWidget {
  final title;
  final onPressed;
  final loading;
  final icon;
  final padding;
  final color;
  final textSize;
  final textColor;
  final bool border;
  final borderColor;
  final double? radius;
  final colorLoading;
  ButtonWidget({
    super.key,
    required this.title,
    this.onPressed,
    this.loading = false,
    this.icon,
    this.padding,
    this.color,
    this.textSize,
    this.textColor,
    this.border = false,
    this.borderColor,
    this.radius,
    this.colorLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          disabledBackgroundColor: color != null
              ? color.withOpacity(0.3)
              : blackColor.withOpacity(0.2),
          elevation: 0,
          shadowColor: Colors.transparent,
          fixedSize: Size.fromWidth(Get.width),
          padding: padding ??
              EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 0,
              ),
          side: BorderSide(
            color: border == true
                ? borderColor == null
                    ? blackColor
                    : borderColor
                : Colors.transparent,
            width: 4,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 8),
          ),
          textStyle: baloo.copyWith(
            fontSize: textSize ?? 46.0,
            fontWeight: bold,
          ),
        ),
        child: Center(
          child: loading == false
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon != null
                        ? Row(
                            children: [
                              icon,
                              SizedBox(width: 10),
                            ],
                          )
                        : SizedBox(),
                    Text(
                      "${title}",
                      style: TextStyle(
                        color: onPressed == null
                            ? greyColor
                            : textColor == null
                                ? borderColor == null
                                    ? blackColor
                                    : borderColor
                                : textColor,
                      ),
                    ),
                  ],
                )
              : LoadingWidget(
                  color: colorLoading,
                ),
        ),
      ),
    );
  }
}
