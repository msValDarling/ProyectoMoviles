import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardCakecraft {
  final String title;
  final String subtitle;
  final ImageProvider image;
  final Color backgroundColor;
  final Color titleColor;
  final Color subtitleColor;
  final Widget? background;

  CardCakecraft({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.backgroundColor,
    required this.titleColor,
    required this.subtitleColor,
    this.background,
  });
}

class CardLince extends StatelessWidget {
  const CardLince({
    required this.data,
    Key? key,
  }) : super(key: key);

  final CardCakecraft data;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        children: [
          if (data.background != null) data.background!,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 3),
                Flexible(
                  flex: 10,
                  child: Image(
                    image: data.image,
                    //width: 120,
                  ),
                ),
                const Spacer(flex: 1),
                Text(
                  textAlign: TextAlign.center,
                  data.title.toUpperCase(),
                  style: TextStyle(
                    color: data.titleColor,
                    fontSize: 17,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                  maxLines: 2,
                ),
                const Spacer(flex: 1),
                Text(
                  data.subtitle,
                  style: TextStyle(
                    color: data.subtitleColor,
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 6,
                ),
                const Spacer(flex: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
