import 'package:flutter/material.dart';
import 'package:game_matchard/presentation/dashboard.dart';

class FailedPage extends StatelessWidget {
  const FailedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            toolbarHeight: 120,
            backgroundColor: const Color(0xFF7E2E84),
            title: Padding(
              padding: const EdgeInsets.fromLTRB(20, 8.0, 20, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 100),
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.pop(context);
                  //   },
                  //   child: const Image(
                  //       height: 70,
                  //       image: AssetImage(
                  //           '../../assets/images/arrowback_white.png')),
                  // ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Matchard !',
                          style: TextStyle(
                              fontFamily: 'Larken Bold',
                              fontSize: 70,
                              color: Color(0xFFE8D7F1),
                              shadows: [
                                Shadow(
                                    color: Color(0x5F1E1E1E),
                                    offset: Offset(0.0, 8.0),
                                    blurRadius: 1.8)
                              ])),
                      SizedBox(width: 15),
                      Image(
                          image:
                              AssetImage('../../assets/images/logo_white.png'))
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DashboardPage()));
                    },
                    child: const Image(
                        height: 70,
                        image: AssetImage(
                            '../../assets/images/arrowforward_white.png')),
                  )
                ],
              ),
            ),
          ),
          body: Column(
            children: [
              Container(
                height: 15,
                color: Color(0xFFE8D7F1),
              ),
              const Expanded(
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Color(0xFFD14081),
                        image: DecorationImage(
                            image: AssetImage(
                                "../../assets/images/background.png"),
                            fit: BoxFit.fitHeight,
                            repeat: ImageRepeat.repeatX,
                            opacity: 1.0)),
                    child: Center(
                      child: Text(
                        'Waktu Habis',
                        style: TextStyle(
                          fontFamily: 'Larken Bold',
                          fontSize: 200,
                          color: Color.fromARGB(220, 255, 255, 255),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ));
  }
}
