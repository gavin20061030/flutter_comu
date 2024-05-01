import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final bool isVisible;

  const LoadingWidget(this.isVisible, {Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Container(
        color: Colors.white.withOpacity(0.5),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
