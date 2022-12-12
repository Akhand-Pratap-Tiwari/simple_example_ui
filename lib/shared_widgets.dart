import 'package:flutter/material.dart';

class TextHolder extends StatelessWidget {
  final String bodyText, heading;
  const TextHolder({
    super.key,
    required this.heading,
    required this.bodyText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Text(
            heading,
            style: TextStyle(
                color: Colors.indigo,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                      color: Colors.black45,
                      blurRadius: 5,
                      offset: Offset.fromDirection(1.571, 2.5))
                ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            bodyText,
            style: const TextStyle(color: Colors.black54, fontSize: 19),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class ImgContainer extends StatelessWidget {
  const ImgContainer({super.key, required this.imgPath});
  final String imgPath;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.indigo, Colors.black87]),
        image: DecorationImage(image: AssetImage(imgPath), fit: BoxFit.cover),
      ),
    );
  }
}
