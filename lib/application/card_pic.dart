import 'package:flutter/material.dart';

class CardPic {
  final String imagePath;
  final String matchKey;

  CardPic({required this.imagePath, required this.matchKey});
}

class CardPicWidget extends StatelessWidget {
  final bool isFlipped;
  final String content;

  const CardPicWidget({
    Key? key,
    required this.isFlipped,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      height: 150,
      child: DecoratedBox(
        decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: Color(0xFFE8D7F1),
            boxShadow: [
              BoxShadow(
                  color: Color(0x5F1E1E1E),
                  offset: Offset(12.0, 12.0),
                  blurRadius: 1.0)
            ]),
        child: Center(
            child: isFlipped
                ? Image(image: AssetImage(content))
                : const Image(
                    image: AssetImage('../../assets/images/box_purple.png'))),
      ),
    );
  }
}

  final List<CardPic> cardPictures = [
    CardPic(imagePath: '../../assets/images/pic/Ball1.png', matchKey: 'Ball'),
    CardPic(imagePath: '../../assets/images/pic/Ball2.png', matchKey: 'Ball'),
    CardPic(
        imagePath: '../../assets/images/pic/Carrot1.png', matchKey: 'Carrot'),
    CardPic(
        imagePath: '../../assets/images/pic/Carrot2.png', matchKey: 'Carrot'),
    CardPic(
        imagePath: '../../assets/images/pic/Chicken1.png', matchKey: 'Chicken'),
    CardPic(
        imagePath: '../../assets/images/pic/Chicken2.png', matchKey: 'Chicken'),
    CardPic(imagePath: '../../assets/images/pic/Coin1.png', matchKey: 'Coin'),
    CardPic(imagePath: '../../assets/images/pic/Coin2.png', matchKey: 'Coin'),
    CardPic(imagePath: '../../assets/images/pic/Egg1.png', matchKey: 'Egg'),
    CardPic(imagePath: '../../assets/images/pic/Egg2.png', matchKey: 'Egg'),
    CardPic(imagePath: '../../assets/images/pic/Lampu1.png', matchKey: 'Lampu'),
    CardPic(imagePath: '../../assets/images/pic/Lampu2.png', matchKey: 'Lampu'),
    CardPic(imagePath: '../../assets/images/pic/Photo1.png', matchKey: 'Photo'),
    CardPic(imagePath: '../../assets/images/pic/Photo2.png', matchKey: 'Photo'),
    CardPic(
        imagePath: '../../assets/images/pic/Rabbit1.png', matchKey: 'Rabbit'),
    CardPic(
        imagePath: '../../assets/images/pic/Rabbit2.png', matchKey: 'Rabbit'),
    CardPic(imagePath: '../../assets/images/pic/Star1.png', matchKey: 'Star'),
    CardPic(imagePath: '../../assets/images/pic/Star2.png', matchKey: 'Star'),
  ];