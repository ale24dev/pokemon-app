import 'package:flutter/material.dart';

///Generic textField
///if [color] is null then will be the primary by default
///
///[labelText] and [hintText] can be null depending on what is needed
class GenericTextField extends StatelessWidget {
  const GenericTextField({
    super.key,
    required this.textInputAction,
    this.hintText,
    this.labelText,
    this.color,
    this.obscureText,
    this.keyboardType,
    this.controller,
    this.floatingLabelBehavior,
    this.validator,
    this.autoValidateMode,
    this.textFieldColor,
  });

  final String? hintText;

  final String? labelText;

  final Color? color;

  final Color? textFieldColor;

  final bool? obscureText;

  final TextInputType? keyboardType;

  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autoValidateMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Color(0x4D8FC5AA), blurRadius: 5, offset: Offset(0, 5))
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextFormField(
          validator: validator,
          autovalidateMode: autoValidateMode ??
              (validator == null ? null : AutovalidateMode.onUserInteraction),
          textInputAction: textInputAction,
          obscureText: obscureText ?? false,
          keyboardType: keyboardType ?? TextInputType.text,
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            fillColor: textFieldColor ?? Colors.white,
            labelText: labelText,
            hintText: hintText,
            floatingLabelBehavior: floatingLabelBehavior,
            focusColor: color ?? ThemeData().primaryColor,
          ),
        ),
      ),
    );
  }
}
