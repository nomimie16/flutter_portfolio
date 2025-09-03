import 'package:flutter/material.dart';
import 'dart:js_interop' as html;

class HoverExtensions extends StatefulWidget {
  final Widget? child;

  const HoverExtensions({super.key, required this.child});

  @override
  State<HoverExtensions> createState() => _HoverExtensionsState();
}

class _HoverExtensionsState extends State<HoverExtensions>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> myAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    myAnimation = Tween<double>(begin: 72.0, end: 90.0).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 150,
      // height: 100,
      child: MouseRegion(
        // cursor: SystemMouseCursors.click,
        onEnter: (_) => _hover(true),
        onExit: (_) => _hover(false),
        child: AnimatedBuilder(
          animation: myAnimation,
          builder: (context, child) => Transform.scale(
            scale: myAnimation.value / 72,
            child: widget.child,
          ),
        ),
      ),
    );
    // Icon(Icons.photo, size: myAnimation.value)))));
  }

  void _hover(bool isHovered) {
    if (isHovered) {
      controller.forward();
    } else {
      controller.reverse();
    }
  }
}
