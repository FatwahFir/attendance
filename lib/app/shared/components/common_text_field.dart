import 'package:flutter/material.dart';

import '../../theme/default_theme.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? initialValue;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? labelTextSuffix;
  final int? maxLines;
  final int? minLines;
  final bool? obscureText;
  final bool? disabled;
  final bool? filled;
  final bool? readOnly;
  final IconData? icon;
  final FloatingLabelBehavior? labelBehavior;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final Function? onTap;
  final Function? onSubmitted;
  final Color? fillColor;
  final Function(String?)? onSave;
  // final Function? onEditingComplete;
  final dynamic validator;
  final dynamic onPressSuffix;
  final bool? hasSuffix;
  const CommonTextField(
      {super.key,
      this.controller,
      this.hasSuffix = false,
      this.labelTextSuffix,
      this.hintText,
      this.obscureText,
      this.icon,
      this.keyboardType,
      this.onChanged,
      this.onTap,
      this.contentPadding,
      this.onSubmitted,
      this.labelText,
      this.maxLines,
      this.minLines,
      this.validator,
      this.prefixIcon,
      this.suffixIcon,
      this.onPressSuffix,
      this.labelBehavior,
      this.initialValue,
      this.filled = true,
      this.readOnly = false,
      this.fillColor,
      this.disabled,
      this.onSave});

  @override
  Widget build(BuildContext context) {
    return labelTextSuffix != null
        ? buildTextFieldWitLabel()
        : _buildTextField();
  }

  Widget buildTextFieldWitLabel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: labelTextSuffix != null ? true : false,
          child: Text(
            labelTextSuffix ?? "",
            style: TextStyle(
              color: DefaultTheme.darkColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Visibility(
          visible: labelTextSuffix != null ? true : false,
          child: const SizedBox(
            height: 5,
          ),
        ),
        _buildTextField(),
      ],
    );
  }

  Widget _buildTextField() {
    return TextFormField(
      minLines: minLines ?? 1,
      maxLines: maxLines ?? 1,
      validator: validator,
      onChanged: onChanged,
      style: TextStyle(
        color: DefaultTheme.darkColor,
      ),
      initialValue: initialValue,
      enableSuggestions: true,
      onSaved: onSave,
      readOnly: readOnly ?? false,
      controller: controller,
      enabled: disabled == true ? false : true,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        suffix: hasSuffix == true
            ? InkWell(
                onTap: () {
                  controller!.clear();
                  onChanged!("");
                },
                child: Icon(
                  Icons.close,
                  color: DefaultTheme.darkColor,
                  size: 12,
                ),
              )
            : null,
        floatingLabelBehavior: labelBehavior,
        contentPadding: contentPadding ?? const EdgeInsets.all(20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: DefaultTheme.darkColor,
          ),
        ),
        focusColor: DefaultTheme.darkColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: DefaultTheme.grayColor,
          ),
        ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(5),
        //   borderSide: const BorderSide(
        //       // color: DefaultTheme.darkColor,
        //       ),
        // ),
        fillColor: fillColor ?? Colors.white,
        hintStyle: TextStyle(color: DefaultTheme.grayColor, fontSize: 12),
        labelStyle: TextStyle(
          color: DefaultTheme.darkColor,
          fontSize: 14,
        ),
        filled: true,
        suffixIcon: IconButton(
          onPressed: onPressSuffix,
          icon: Icon(
            suffixIcon,
            color: DefaultTheme.primaryColor,
            size: 20,
          ),
        ),
        // prefixIconColor: DefaultTheme.darkColor,
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: DefaultTheme.primaryColor,
              )
            : null,
        hintText: hintText,
        labelText: labelText,
      ),
      keyboardType: keyboardType,
    );
  }
}
