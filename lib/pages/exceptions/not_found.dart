import 'package:flutter/material.dart';

class NotFoundPageView extends StatelessWidget {
  String notFoundMessage;

  NotFoundPageView({
    super.key,
    required this.notFoundMessage,
  });

  @override
  Widget build(BuildContext context) {
    const maxWidth = 2500.0;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double imageErrorWidth = screenWidth * 0.8;
    if (imageErrorWidth > maxWidth) {
      imageErrorWidth = maxWidth;
    }

    return Center(
      child: Stack(
        children: [
          Container(
            alignment: const Alignment(0, 0.4),
            child: Image.asset(
              "assets/horses/not_found_error.png",
              height: screenHeight,
              fit: BoxFit.fitHeight,
              alignment: Alignment.centerLeft,
            ),
          ),
          Container(
            alignment: const Alignment(0, 0.4),
            child: Text(
              notFoundMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                background: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 25
                  ..color = Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
