import 'package:flutter/material.dart';
import 'package:quiz_app/app/data/themes.dart';

class FormWidget extends StatelessWidget {
  final String? title;
  final String? hint;
  final bool obsecureText;
  final bool read;
  final bool maxLine;
  final bool textAlign;
  final bool disableBorder;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Widget? iconSuffix;
  final Widget? iconPrefix;
  final onTap;
  final onChanged;
  final onFieldSubmitted;
  final error;
  final Color? color;
  final bool autofocus;
  final Color? colorBorder;
  final int? maxLength;
  FormWidget({
    super.key,
    this.title,
    this.hint,
    this.obsecureText = false,
    this.read = false,
    this.maxLine = false,
    this.textAlign = false,
    this.disableBorder = false,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.iconSuffix,
    this.iconPrefix,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.error,
    this.color,
    this.autofocus = false,
    this.colorBorder,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title != null
              ? Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    title!,
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 14.0,
                      fontWeight: bold,
                    ),
                  ),
                )
              : Container(),
          TextFormField(
            autofocus: autofocus,
            cursorColor: blackColor,
            keyboardType: keyboardType,
            textAlign: textAlign ? TextAlign.center : TextAlign.start,
            readOnly: read,
            maxLines: maxLine ? 5 : 1,
            maxLength: maxLength ?? null,
            controller: controller,
            onTap: onTap,
            onChanged: onChanged,
            onFieldSubmitted: onFieldSubmitted,
            obscureText: obsecureText,
            style: baloo.copyWith(
              color: blackColor,
              fontSize: 14.0,
              fontWeight: bold,
            ),
            decoration: InputDecoration(
              counterText: "",
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              fillColor: color ?? blackColor,
              filled: color != null ? true : false,
              hintText: "${hint}",
              hintStyle: baloo.copyWith(
                color: blackColor,
                fontSize: 14.0,
                fontWeight: bold,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: color == null ? 3 : 0,
                  color: disableBorder == false
                      ? colorBorder == null
                          ? blackColor
                          : colorBorder!
                      : Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: color == null ? 3 : 0,
                  color: error != null && error != "" && error != "null"
                      ? redColor
                      : disableBorder == false
                          ? colorBorder == null
                              ? blackColor
                              : colorBorder!
                          : Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              suffixIcon: iconSuffix,
              prefixIcon: iconPrefix,
            ),
          ),
          error != null && error != "" && error != "null"
              ? Container(
                  margin: EdgeInsets.only(top: 5, left: 5),
                  child: Text(
                    error
                        .replaceAll("[", '')
                        .replaceAll(']', '')
                        .replaceAll(',', ' &'),
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 12.0,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
