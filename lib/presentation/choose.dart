import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_matchard/bloc_manage/modepic_bloc.dart';
import 'package:game_matchard/bloc_manage/modeflag_bloc.dart';
import 'package:game_matchard/presentation/dashboard.dart';
import 'package:game_matchard/presentation/game/memory_pictures.dart';
import 'package:game_matchard/presentation/game/memory_flags.dart';

class ChoosePage extends StatelessWidget {
  const ChoosePage({super.key});

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
                        const Text(
                          'Pilih Mode !',
                          style: TextStyle(
                              fontFamily: 'Larken Bold',
                              fontSize: 120,
                              color: Color(0xFFE8D7F1),
                              shadows: [
                                Shadow(
                                    color: Color(0x5F1E1E1E),
                                    offset: Offset(0.0, 17.0),
                                    blurRadius: 1.8)
                              ]),
                        ),
                        const SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => BlocProvider(
                                            create: (context) => ModePicBloc()
                                              ..add(InitializePicGameEvent()),
                                            child: const ModePicPage())));
                              },
                              child: Stack(children: [
                                Transform.translate(
                                  offset: const Offset(60, 0),
                                  child: const SizedBox(
                                    width: 300,
                                    height: 470,
                                    child: DecoratedBox(
                                        decoration: BoxDecoration(
                                      color: Color(0xFFE8D7F1),
                                    )),
                                  ),
                                ),
                                const SizedBox(
                                  width: 300,
                                  height: 470,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF7E2E84),
                                    ),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(20, 100, 20, 20),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Santai',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                color: Color(0XFFE8D7F1),
                                                fontFamily: 'Bright',
                                                fontSize: 65,
                                              ),
                                            ),
                                            Text(
                                              'Pasangkan gambar yang mirip',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                fontFamily: 'Larken Regular',
                                                fontSize: 30,
                                                color: Color(0xFFE8D7F1),
                                              ),
                                            ),
                                            Spacer(),
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: Image(
                                                image: AssetImage(
                                                    '../../../assets/images/arrowforward_white.png'),
                                                height: 60,
                                              ),
                                            )
                                          ]),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                            const SizedBox(width: 100),
                            const Image(
                                image: AssetImage(
                                    '../../../assets/images/logo.png')),
                            const SizedBox(width: 100),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => BlocProvider(
                                            create: (context) => ModeFlagBloc()
                                              ..add(InitializeFlagGameEvent()),
                                            child: const ModeFlagPage())));
                              },
                              child: Stack(
                                children: [
                                  Transform.translate(
                                    offset: const Offset(-60, 0),
                                    child: const SizedBox(
                                      width: 300,
                                      height: 470,
                                      child: DecoratedBox(
                                          decoration: BoxDecoration(
                                        color: Color(0xFF7E2E84),
                                      )),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 300,
                                    height: 470,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE8D7F1),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            20, 100, 20, 20),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Tantangan',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  color: Color(0XFF7E2E84),
                                                  fontFamily: 'Bright',
                                                  fontSize: 65,
                                                ),
                                              ),
                                              Text(
                                                'Pasangkan bendera dengan nama negara yang sesuai',
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontFamily: 'Larken Regular',
                                                  fontSize: 30,
                                                  color: Color(0xFF7E2E84),
                                                ),
                                              ),
                                              Spacer(),
                                              Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Image(
                                                  image: AssetImage(
                                                      '../../../assets/images/arrowforward_purple.png'),
                                                  height: 60,
                                                ),
                                              )
                                            ]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ]),
                )),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.fromLTRB(20, 39, 20, 0),
            child: SizedBox(
              height: 50,
              width: 70,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashboardPage()));
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
                        AssetImage('../../assets/images/arrowback_white.png')),
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        ));
  }
}
