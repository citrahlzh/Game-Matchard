import 'package:flutter/material.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: const SizedBox.expand(
            child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Color(0xFFD14081),
                    image: DecorationImage(
                        image: AssetImage("assets/images/background.png"),
                        fit: BoxFit.fitHeight,
                        repeat: ImageRepeat.repeatX,
                        opacity: 1.0)),
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Cara Main',
                          style: TextStyle(
                              fontFamily: 'Larken Medium',
                              fontSize: 100,
                              color: Color(0xFFE8D7F1),
                              shadows: [
                                Shadow(
                                    color: Color(0x5F1E1E1E),
                                    offset: Offset(0.0, 17.0),
                                    blurRadius: 1.8)
                              ]),
                        ),
                        SizedBox(height: 50),
                        Center(
                          child: SizedBox(
                            height: 600,
                            width: 1300,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Color(0xFFE8D7F1),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0x5F1E1E1E),
                                        offset: Offset(0.0, 12.0),
                                        blurRadius: 1.0)
                                  ]),
                              child: Center(
                                child: SizedBox(
                                  height: 500,
                                  width: 1200,
                                  child: DecoratedBox(
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: Color(0xFF7E2E84),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Color(0x5F1E1E1E),
                                              offset: Offset(0.0, 12.0),
                                              blurRadius: 1.0)
                                        ]),
                                    child: Center(
                                      child: SizedBox(
                                        width: 1000,
                                        child: Text(
                                          'Pasangkan kartu dengan memilih 2 kartu secara acak.\nJika pasangan kartu yang dipilih tidak sesuai, kartu tersebut akan berbalik.\nJika pasangan kartu sesuai, maka gambar atau teks di dalam kartu akan tetap terpampang.\nCari dan temukan 9 pasangan kartu dalam waktu 3 menit!\nSelamat Bermain!',
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                            fontFamily: 'Larken Regular',
                                            fontSize: 35,
                                            color: Color(0xFFE8D7F1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ]),
                )),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.fromLTRB(20, 39, 20, 0),
            child: SizedBox(
              height: 75,
              width: 105,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                backgroundColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusElevation: 0,
                hoverElevation: 0,
                highlightElevation: 0,
                elevation: 0,
                child: const Image(
                    fit: BoxFit.contain,
                    image:
                        AssetImage('assets/images/arrowback_white.png')),
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        ));
  }
}
