import 'package:flutter/material.dart';

import 'MyTextStyle.dart';

class CircularProgressBar extends StatefulWidget {
  final double percentage;
  final Duration duration;
  final String data;

  const CircularProgressBar({
    Key? key,
    required this.percentage,
    required this.duration,
    required this.data,
  }) : super(key: key);

  @override
  _CircularProgressBarState createState() => _CircularProgressBarState();
}

class _CircularProgressBarState extends State<CircularProgressBar>
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

    _animation = Tween<double>(begin: 0, end: widget.percentage).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          size: const Size(200, 200),
          painter: CircularProgressBarPainter(
            percentage: _animation.value,
          ),
          child: Center(
            child: Text(
              widget.data,
              //'${_animation.value.toInt()}%',
              style:MyTextStyle.titleStyle10w,
            ),
          ),
        );
      },
    );
  }
}
class CircularProgressBarPainter extends CustomPainter {
  final double percentage;

  CircularProgressBarPainter({required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    Paint foregroundPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          Color(0xFFFF0000),
          Color(0xFF9900FF),
          Color(0xFFFF0000),
          Color(0xFF9900FF),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width / 2))
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.2)
      ..strokeWidth = 14
      ..style = PaintingStyle.stroke
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 4);

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = (size.width / 2) - 10;

    canvas.drawCircle(center, radius, backgroundPaint);

    double sweepAngle = (2 * 3.141592653589793 * (percentage / 100));
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.141592653589793 / 2,
      sweepAngle,
      false,
      shadowPaint,
    );
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      2.141592653589793 / 2,
      sweepAngle,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}