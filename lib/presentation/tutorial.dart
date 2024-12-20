import 'package:flutter/material.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SizedBox.expand(
            child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Color(0xFFD14081),
                    image: DecorationImage(
                        image: AssetImage("../../assets/images/background.png"),
                        fit: BoxFit.fitHeight,
                        repeat: ImageRepeat.repeatX,
                        opacity: 1.0)),
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: []),
                )),
          ),
        ));
  }
}
