import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({Key? key, required this.child}) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      width: double.infinity,
      padding: EdgeInsets.only(
          // We use viewInsets to calculate the height of the keyboard. You don't need
          // this if you don't have a text field in your bottom sheet.
          bottom: MediaQuery.of(context).viewInsets.bottom > 0
              ? MediaQuery.of(context).viewInsets.bottom + 45
              : MediaQuery.of(context).viewInsets.bottom),
      child: child,
    );
  }
}
