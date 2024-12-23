import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_matchard/application/card_pic.dart';
import 'package:game_matchard/application/flag_pic.dart';
import 'package:game_matchard/bloc_manage/modeflag_bloc.dart';
import 'package:game_matchard/presentation/choose.dart';
import '../success.dart';
import '../failed.dart';

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
                MaterialPageRoute(builder: (context) => FailedPage()),
              );
            });
          }

          if (state.isGameSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SuccessPage()),
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChoosePage()));
                          },
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Image(
                                height: 55,
                                image: AssetImage(
                                    '../../assets/images/arrowback_purple.png')),
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
                                  '../../assets/images/logo_purple.png'))
                        ],
                      ),
                      SizedBox(
                        width: 160,
                        child: Text(
                          textAlign: TextAlign.right,
                          '${minutes}:${seconds}',
                          style: const TextStyle(
                            color: Color(0xFF7E2E84),
                            fontFamily: 'Milanello',
                            fontSize: 50,
                          ),
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
                                      "../../assets/images/background.png"),
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
