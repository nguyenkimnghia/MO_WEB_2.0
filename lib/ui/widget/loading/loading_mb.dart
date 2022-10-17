import 'package:flutter/material.dart';

class LoadingMB extends StatefulWidget {
  final String title;
  final double textSize;
  final String assetImage;
  final double sizeImage;

   const LoadingMB({Key? key,
        required this.title,
        required this.textSize,
        required this.assetImage,
        required this.sizeImage}) : super(key: key);

  @override
  State<LoadingMB> createState() => _LoadingMBState();
}

class _LoadingMBState extends State<LoadingMB>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animationRotation;
  late Animation<double> animationScale;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    animationRotation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 1.0, curve: Curves.linear)));

    animationScale = Tween<double>(begin: 0, end: widget.sizeImage).animate(controller);
    controller.forward().whenComplete(() {
      controller.reverse();
    });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.0,
      height: 100.0,
      child: Center(
        child: Column(
          children: [
            RotationTransition(
                turns: animationRotation,
                child: AnimatedBuilder(
                  animation: animationScale,
                  builder: (context, child) {
                    return SizedBox(
                      height: widget.sizeImage,
                        width: widget.sizeImage,
                      child: Image.asset(widget.assetImage),
                    );
                  },
                )),
            const SizedBox(height: 10),
            Text(widget.title,
              style: TextStyle(
                  color: Colors.black,
              fontSize: widget.textSize),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
