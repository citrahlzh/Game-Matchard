import 'package:flutter/material.dart';
import 'package:game_matchard/presentation/tutorial.dart';
import 'package:game_matchard/presentation/choose.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SizedBox.expand(
            child: DecoratedBox(
                decoration: const BoxDecoration(
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
                      children: [
                        const Image(
                            image: AssetImage('../../assets/images/logo.png')),
                        const SizedBox(height: 20),
                        const Text(
                          'Matchard !',
                          style: TextStyle(
                              fontFamily: 'Larken Bold',
                              fontSize: 150,
                              color: Color(0xFFE8D7F1),
                              shadows: [
                                Shadow(
                                    color: Color(0x5F1E1E1E),
                                    offset: Offset(0.0, 17.0),
                                    blurRadius: 1.8)
                              ]),
                        ),
                        const Text(
                          'Match the Card',
                          style: TextStyle(
                              fontFamily: 'Larken Regular',
                              fontSize: 40,
                              color: Color(0xFFE8D7F1),
                              shadows: [
                                Shadow(
                                    color: Color(0x8A1E1E1E),
                                    offset: Offset(0.0, 6.0),
                                    blurRadius: 2.0)
                              ]),
                        ),
                        const SizedBox(height: 100),
                        Column(
                          children: [
                            Stack(children: [
                              Transform.translate(
                                offset: const Offset(0.0, 20.0),
                                child: const SizedBox(
                                  width: 400,
                                  height: 75,
                                  child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: Color(0xFFE8D7F1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0)),
                                          boxShadow: [
                                        BoxShadow(
                                            color: Color(0x4D1E1E1E),
                                            offset: Offset(0.0, 5.0),
                                            blurRadius: 0.0)
                                      ])),
                                ),
                              ),
                              SizedBox(
                                  width: 400,
                                  height: 75,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color(0x6D1E1E1E),
                                            offset: Offset(0.0, 7.0),
                                            blurRadius: 2.0,
                                          )
                                        ]),
                                    child: ElevatedButton(
                                        onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ChoosePage())),
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xFF7E2E84),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            elevation: 0,
                                            shadowColor:
                                                const Color(0xFF1E1E1E)),
                                        child: const Text(
                                          'Mainkan !',
                                          style: TextStyle(
                                              fontFamily: 'Bright',
                                              color: Color(0xFFE8D7F1),
                                              fontSize: 55,
                                              shadows: [
                                                Shadow(
                                                    color: Color(0xA11E1E1E),
                                                    offset: Offset(0.0, 8.0),
                                                    blurRadius: 2.0)
                                              ]),
                                          textAlign: TextAlign.center,
                                        )),
                                  ))
                            ]),
                            const SizedBox(height: 45),
                            Stack(children: [
                              Transform.translate(
                                offset: const Offset(0.0, 20.0),
                                child: const SizedBox(
                                  width: 400,
                                  height: 75,
                                  child: DecoratedBox(
                                      decoration: BoxDecoration(
                                          color: Color(0xFFE8D7F1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.0)),
                                          boxShadow: [
                                        BoxShadow(
                                            color: Color(0x4D1E1E1E),
                                            offset: Offset(0.0, 5.0),
                                            blurRadius: 0.0)
                                      ])),
                                ),
                              ),
                              SizedBox(
                                  width: 400,
                                  height: 75,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color(0x6D1E1E1E),
                                            offset: Offset(0.0, 7.0),
                                            blurRadius: 2.0,
                                          )
                                        ]),
                                    child: ElevatedButton(
                                        onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const TutorialPage())),
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xFF7E2E84),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                            elevation: 0,
                                            shadowColor:
                                                const Color(0xFF1E1E1E)),
                                        child: const Text(
                                          'Cara Main',
                                          style: TextStyle(
                                              fontFamily: 'Bright',
                                              color: Color(0xFFE8D7F1),
                                              fontSize: 55,
                                              shadows: [
                                                Shadow(
                                                    color: Color(0xA11E1E1E),
                                                    offset: Offset(0.0, 8.0),
                                                    blurRadius: 2.0)
                                              ]),
                                          textAlign: TextAlign.center,
                                        )),
                                  ))
                            ]),
                          ],
                        )
                      ]),
                )),
          ),
        ));
  }
}
