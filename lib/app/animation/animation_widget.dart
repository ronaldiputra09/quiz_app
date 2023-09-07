import 'package:flutter/material.dart';

class AnimatedImage extends StatefulWidget {
  final String icon;
  const AnimatedImage({Key? key, required this.icon}) : super(key: key);

  @override
  _AnimatedImageState createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat(reverse: true);
  late final Animation<Offset> _animation =
      Tween(begin: Offset.zero, end: const Offset(0, 0.09))
          .animate(_controller);

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Image.asset(
        widget.icon,
        height: 200,
      ),
    );
  }
}
