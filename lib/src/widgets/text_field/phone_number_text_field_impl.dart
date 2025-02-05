import 'package:flutter/material.dart';
import 'package:flutter_core/flutter_core.dart';

@immutable
class CorePhoneNumberTextField extends StatelessWidget {
  const CorePhoneNumberTextField({
    this.controller,
    this.validator,
    this.onChanged,
    this.textAlign = TextAlign.start,
    this.autovalidateMode,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.textInputAction,
    this.prefixIcon,
    this.hintText,
    this.labelText,
    this.maxLength,
    this.buildCounter,
    this.enabled,
    this.focusNode,
    this.autofillHints,
    super.key,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextAlign textAlign;
  final AutovalidateMode? autovalidateMode;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final String? hintText;
  final String? labelText;
  final int? maxLength;
  final InputCounterWidgetBuilder? buildCounter;
  final bool? enabled;
  final FocusNode? focusNode;
  final Iterable<String>? autofillHints;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      textAlign: textAlign,
      autovalidateMode: autovalidateMode,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: textInputAction,
      keyboardType: TextInputType.phone,
      maxLength: maxLength,
      buildCounter: buildCounter,
      autofillHints: autofillHints,
      inputFormatters: [
        CoreInputFormatter(
          mask: '### ### ## ##',
          filter: {'#': RegExp('[0-9]')},
          type: MaskAutoCompletionType.eager,
        ),
      ],
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        labelText: labelText,
      ),
    );
  }
}
