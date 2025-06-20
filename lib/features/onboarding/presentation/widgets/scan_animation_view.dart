import 'package:flutter/material.dart';

class ScanAnimationView extends StatefulWidget {
  const ScanAnimationView({super.key});

  @override
  State<ScanAnimationView> createState() => _ScanAnimationViewState();
}

class _ScanAnimationViewState extends State<ScanAnimationView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final double boxSize = 300;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 0, end: boxSize).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildCorner({
    required Alignment alignment,
    required double cornerLength,
    required double borderWidth,
    required BorderRadius borderRadius,
  }) {
    return Align(
      alignment: alignment,
      child: Stack(
        children: [
          // Yatay çizgi
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: cornerLength,
              height: borderWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: borderRadius,
              ),
            ),
          ),
          // Dikey çizgi
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: borderWidth,
              height: cornerLength,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: borderRadius,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFourCornerBox({
    required double size,
    required double cornerLength,
    required double borderWidth,
    required double radius,
  }) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          // Top-left
          buildCorner(
            alignment: Alignment.topLeft,
            cornerLength: cornerLength,
            borderWidth: borderWidth,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius),
            ),
          ),
          // Top-right
          Transform.rotate(
            angle: 90 * 3.1416 / 180,
            child: buildCorner(
              alignment: Alignment.topLeft,
              cornerLength: cornerLength,
              borderWidth: borderWidth,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius),
              ),
            ),
          ),
          // Bottom-right
          Transform.rotate(
            angle: 180 * 3.1416 / 180,
            child: buildCorner(
              alignment: Alignment.topLeft,
              cornerLength: cornerLength,
              borderWidth: borderWidth,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius),
              ),
            ),
          ),
          // Bottom-left
          Transform.rotate(
            angle: 270 * 3.1416 / 180,
            child: buildCorner(
              alignment: Alignment.topLeft,
              cornerLength: cornerLength,
              borderWidth: borderWidth,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(radius),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScannerLine() {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Positioned(
          top: _animation.value,
          left: 0,
          right: 0,
          child: Container(
            height: 2,
            color: Colors.white,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: boxSize,
        height: boxSize,
        child: Stack(
          children: [
            buildFourCornerBox(
              size: 300,
              cornerLength: 30,
              borderWidth: 4,
              radius: 88,
            ),
            _buildScannerLine(),
          ],
        ),
      ),
    );
  }
}
