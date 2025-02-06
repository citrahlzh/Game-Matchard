import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_matchard/application/flag_pic.dart';
import 'package:game_matchard/bloc_manage/modeflag_bloc.dart';
import 'package:game_matchard/presentation/choose.dart';
import 'package:game_matchard/presentation/failed.dart';
import 'package:game_matchard/presentation/success.dart';

class ModeFlagPage extends StatelessWidget {
  const ModeFlagPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocConsumer<ModeFlagBloc, ModeFlagState>(
            listener: (context, state) {
          if (state.isGameFailed) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const FailedPage(
                        appbarBackground: Color(0xFFE8D7F1),
                        appbarColor: Color(0xFF7E2E84),
                        appbarLogo: 'assets/images/logo_purple.png',
                        appbarIcon:
                            'assets/images/arrowforward_purple.png')),
              );
            });
          }

          if (state.isGameSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const SuccessPage(
                        appbarBackground: Color(0xFFE8D7F1),
                        appbarColor: Color(0xFF7E2E84),
                        appbarLogo: 'assets/images/logo_purple.png',
                        appbarIcon:
                            'assets/images/arrowforward_purple.png')),
              );
            });
          }
        }, builder: (context, state) {
          final remainingTime = state.remainingTime;
          final minutes = (remainingTime ~/ 60).toString().padLeft(2, '0');
          final seconds = (remainingTime % 60).toString().padLeft(2, '0');
          return Scaffold(
              appBar: AppBar(
                toolbarHeight: 120,
                backgroundColor: const Color(0xFFE8D7F1),
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8.0, 20, 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 160,
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => const ChoosePage()));
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                      backgroundColor: Colors.transparent,
                                      content: Center(
                                        child: SizedBox(
                                          width: 700,
                                          height: 400,
                                          child: DecoratedBox(
                                            decoration: const BoxDecoration(
                                              color: Color(0xFFE8D7F1),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0x5F1E1E1E),
                                                  blurRadius:
                                                      1.5, // Blur radius
                                                  offset: Offset(8, 8),
                                                )
                                              ],
                                            ),
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(50),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    const Text(
                                                      'Apakah kamu ingin keluar dari permainan?',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xFF7E2E84),
                                                          fontFamily:
                                                              'Larken Bold',
                                                          fontSize: 45),
                                                    ),
                                                    const SizedBox(height: 70),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: const SizedBox(
                                                            height: 50,
                                                            width: 100,
                                                            child: DecoratedBox(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFF7E2E84),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Color(
                                                                        0x5F1E1E1E),
                                                                    blurRadius:
                                                                        1.5, // Blur radius
                                                                    offset:
                                                                        Offset(
                                                                            4,
                                                                            4),
                                                                  )
                                                                ],
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                    'Tidak',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontFamily:
                                                                            'Larken Regular',
                                                                        fontSize:
                                                                            20)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 100,
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            const ChoosePage()));
                                                          },
                                                          child: const SizedBox(
                                                            height: 50,
                                                            width: 100,
                                                            child: DecoratedBox(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFF7E2E84),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Color(
                                                                        0x5F1E1E1E),
                                                                    blurRadius:
                                                                        1.5, // Blur radius
                                                                    offset:
                                                                        Offset(
                                                                            4,
                                                                            4),
                                                                  )
                                                                ],
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                    'Ya',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontFamily:
                                                                            'Larken Regular',
                                                                        fontSize:
                                                                            20)),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ));
                                });
                          },
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Image(
                                height: 55,
                                image: AssetImage(
                                    'assets/images/arrowback_purple.png')),
                          ),
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Matchard !',
                              style: TextStyle(
                                  fontFamily: 'Larken Bold',
                                  fontSize: 70,
                                  color: Color(0xFF7E2E84),
                                  shadows: [
                                    Shadow(
                                        color: Color(0x5F1E1E1E),
                                        offset: Offset(0.0, 8.0),
                                        blurRadius: 1.8)
                                  ])),
                          SizedBox(width: 15),
                          Image(
                              image: AssetImage(
                                  'assets/images/logo_purple.png'))
                        ],
                      ),
                      SizedBox(
                        width: 160,
                        child: Text(
                          textAlign: TextAlign.right,
                          '$minutes:$seconds',
                          style: const TextStyle(
                              color: Color(0xFF7E2E84),
                              fontFamily: 'Milanello',
                              fontSize: 50,
                              shadows: [
                                Shadow(
                                    color: Color(0x5F1E1E1E),
                                    offset: Offset(0.0, 4.0),
                                    blurRadius: 1.8)
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: Column(
                children: [
                  Container(
                    height: 15,
                    color: const Color(0xFF7E2E84),
                  ),
                  Expanded(
                      child: DecoratedBox(
                          decoration: const BoxDecoration(
                              color: Color(0xFFD14081),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/background.png"),
                                  fit: BoxFit.fitHeight,
                                  repeat: ImageRepeat.repeatX,
                                  opacity: 1.0)),
                          child: Column(children: [
                            Expanded(
                                child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(200, 0, 200, 0),
                              child: Center(
                                child: GridView(
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 140.0,
                                          mainAxisSpacing: 60,
                                          crossAxisSpacing: 120,
                                          childAspectRatio: 1 / 1.3),
                                  children:
                                      state.cards.asMap().entries.map((entry) {
                                    final index = entry.key;
                                    final card = entry.value;

                                    return GestureDetector(
                                      onTap: () {
                                        context
                                            .read<ModeFlagBloc>()
                                            .add(FlipCardEvent(index));
                                      },
                                      child: CardFlagWidget(
                                        isFlipped: state.flippedCards[index],
                                        content: state.flippedCards[index]
                                            ? card
                                            : '', // Show image or text
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ))
                          ])))
                ],
              ));
        }));
  }
}
