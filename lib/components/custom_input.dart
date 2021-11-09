import 'package:flutter/material.dart';
import 'package:shopsy/shared/constants.dart';

class CustomInput extends StatefulWidget {
  final String? showText;
  void Function(String)? onChange;
  void Function(String)? onSubmit;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final bool? isMobileNumberField;
  // var showIcon;
  bool pwdField;

  CustomInput(
      {Key? key,
      this.showText,
      this.isMobileNumberField,
      required this.pwdField,
      this.onSubmit,
      this.focusNode,
      this.textInputAction,
      this.onChange})
      : super(key: key);

  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    bool _isMobileNumberField = widget.isMobileNumberField ?? false;

    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.fromLTRB(30, 30, 30, 0.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.grey.withOpacity(0.2),
      ),
      child: TextFormField(
        keyboardType:
            _isMobileNumberField ? TextInputType.number : TextInputType.text,
        onChanged: widget.onChange,
        textInputAction: widget.textInputAction,
        onFieldSubmitted: widget.onSubmit,
        focusNode: widget.focusNode,
        obscureText: widget.pwdField ? true : false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12.0),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: widget.showText ?? "hint text",
          // suffixIcon: widget.pwdField
          //     ? IconButton(
          //         icon: _obscureText ? widget.showIcon : Icons.visibility_off,
          //         onPressed: widget.pwdField
          //             ? () {
          //                 setState(() {
          //                   _obscureText = !_obscureText;
          //                 });
          //               }
          //             : () {},
          //       )
          //     : IconButton(onPressed: () {}, icon: widget.showIcon),
        ),
        style: Constants.regularText,
      ),
    );
  }
}
