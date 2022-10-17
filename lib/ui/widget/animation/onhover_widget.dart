import 'package:flutter/material.dart';

// Cách sử dụng
// OnHover( builder: (bool isHovered) {
// final color = isHovered ? Colors.red : Colors.black;
// return child);

class OnHoverWidget extends StatefulWidget {

  final Widget Function(bool isHovered) builder;

  const OnHoverWidget({Key? key, required this.builder}) : super(key: key);

  @override
  OnHoverWidgetState createState() => OnHoverWidgetState();
}

class OnHoverWidgetState extends State<OnHoverWidget> {

  bool isHovered = false;

  @override
  Widget build(BuildContext context) {

    return MouseRegion(
      onEnter: (_)=> onEntered(true),
      onExit: (_)=> onEntered(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        child: widget.builder(isHovered),
      ),
    );
  }

  void onEntered(bool isHovered){
    setState(() {
      this.isHovered = isHovered;
    });
  }
}