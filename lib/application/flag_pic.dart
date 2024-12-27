import 'package:flutter/material.dart';

class CardFlag {
  final String imagePath;
  final String matchKey;

  CardFlag({required this.imagePath, required this.matchKey});
}

class CardFlagWidget extends StatelessWidget {
  final bool isFlipped;
  final String content;

  const CardFlagWidget({
    super.key,
    required this.isFlipped,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 150,
      child: DecoratedBox(
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: Color(0xFF7E2E84),
            boxShadow: [
              BoxShadow(
                  color: Color(0x5F1E1E1E),
                  offset: Offset(12.0, 12.0),
                  blurRadius: 1.0)
            ]),
        child: Center(
            child: isFlipped
                ? content.contains('.svg') || content.contains('.png')
                    ? Image(image: AssetImage(content))
                    : Center(
                        child: Text(
                          content,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0XFFE8D7F1),
                            fontFamily: 'Bright',
                            fontSize: 25,
                          ),
                        ),
                      ) // Display text
                : const Image(
                    image: AssetImage('../../assets/images/box_white.png'))),
      ),
    );
  }
}

final List<CardFlag> cardFlags = [
  CardFlag(
      imagePath:
          '../../assets/images/flag/Flag_of_Australia_(converted).svg.png',
      matchKey: 'Australia'),
  CardFlag(
      imagePath: '../../assets/images/flag/Flag_of_Brazil.svg.png',
      matchKey: 'Brazil'),
  CardFlag(
      imagePath: '../../assets/images/flag/Flag_of_Canada.svg.png',
      matchKey: 'Kanada'),
  CardFlag(
      imagePath: '../../assets/images/flag/Flag_of_India.svg.png',
      matchKey: 'India'),
  CardFlag(
      imagePath: '../../assets/images/flag/Flag_of_Indonesia.svg.png',
      matchKey: 'Indonesia'),
  CardFlag(
      imagePath: '../../assets/images/flag/Flag_of_Japan.svg.png',
      matchKey: 'Jepang'),
  CardFlag(
      imagePath: '../../assets/images/flag/Flag_of_Laos.svg.png',
      matchKey: 'Laos'),
  CardFlag(
      imagePath: '../../assets/images/flag/Flag_of_Malaysia.svg.png',
      matchKey: 'Malaysia'),
  CardFlag(
      imagePath: '../../assets/images/flag/Flag_of_Myanmar.svg.png',
      matchKey: 'Myanmar'),
  CardFlag(
      imagePath: '../../assets/images/flag/Flag_of_Palestine.svg.png',
      matchKey: 'Palestina'),
  CardFlag(
      imagePath: '../../assets/images/flag/Flag_of_Saudi_Arabia.svg.png',
      matchKey: 'Saudi Arabia'),
  CardFlag(
      imagePath: '../../assets/images/flag/Flag_of_Singapore.svg.png',
      matchKey: 'Singapora'),
  CardFlag(
      imagePath: '../../assets/images/flag/Flag_of_South_Korea.svg.png',
      matchKey: 'Korea Selatan'),
  CardFlag(
      imagePath: '../../assets/images/flag/Flag_of_Spain.svg.png',
      matchKey: 'Spanyol'),
  CardFlag(
      imagePath: '../../assets/images/flag/Flag_of_the_Philippines.svg.png',
      matchKey: 'Filipina'),
  CardFlag(
      imagePath: '../../assets/images/flag/Flag_of_the_United_Kingdom.svg.png',
      matchKey: 'Inggris'),
  CardFlag(
      imagePath: '../../assets/images/flag/Flag_of_the_United_States.svg.png',
      matchKey: 'Amerika Serikat'),
  CardFlag(
      imagePath: '../../assets/images/flag/Flag_of_Turkey.svg.png',
      matchKey: 'Turki'),
];
