import 'package:flutter/material.dart';

class BounceAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double scaleFactor;

  BounceAnimation({
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.scaleFactor = 1.5,
  });

  @override
  _BounceAnimationState createState() => _BounceAnimationState();
}

class _BounceAnimationState extends State<BounceAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation.drive(
        Tween<double>(begin: 1, end: widget.scaleFactor),
      ),
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
