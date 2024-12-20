import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_matchard/application/card_pic.dart';
import 'package:game_matchard/bloc_manage/modepic_bloc.dart';
import 'package:game_matchard/presentation/dashboard.dart';
// import '../success.dart';
// import '../failed.dart';

class ModePicPage extends StatelessWidget {
  const ModePicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<ModePicBloc, ModePicState>(builder: (context, state) {
          final remainingTime = state.remainingTime;
          final minutes = (remainingTime ~/ 60).toString().padLeft(2, '0');
          final seconds = (remainingTime % 60).toString().padLeft(2, '0');
          return Scaffold(
              appBar: AppBar(
                toolbarHeight: 120,
                backgroundColor: const Color(0xFF7E2E84),
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8.0, 20, 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // GestureDetector(
                      //   onTap: () {
                      //     Navigator.pop(context);
                      //   },
                      //   child: const Image(
                      //       height: 70,
                      //       image: AssetImage(
                      //           '../../assets/images/arrowback_white.png')),
                      // ),
                      SizedBox(
                        width: 150,
                        child: Text(
                          textAlign: TextAlign.left,
                          '${minutes}:${seconds}',
                          style: const TextStyle(
                            color: Color(0XFFE8D7F1),
                            fontFamily: 'Milanello',
                            fontSize: 50,
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
                                  color: Color(0xFFE8D7F1),
                                  shadows: [
                                    Shadow(
                                        color: Color(0x5F1E1E1E),
                                        offset: Offset(0.0, 8.0),
                                        blurRadius: 1.8)
                                  ])),
                          SizedBox(width: 15),
                          Image(
                              image: AssetImage(
                                  '../../assets/images/logo_white.png'))
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
                    color: const Color(0xFFE8D7F1),
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
                                  children: state.cards
                                      .map((card) => GestureDetector(
                                            onTap: () {
                                              context.read<ModePicBloc>().add(
                                                  FlipCardEvent(state.cards
                                                      .indexOf(card)));
                                            },
                                            child: CardPicWidget(
                                                isFlipped: state.flippedCards[
                                                    state.cards.indexOf(card)],
                                                content: card),
                                          ))
                                      .toList(),
                                ),
                              ),
                            ))
                          ])))
                ],
              ));
        }));
  }
}
                
      
                // if (state.isGameFailed) {
                //   WidgetsBinding.instance.addPostFrameCallback((_) {
                //     Navigator.pushReplacement(
                //       context,
                //       MaterialPageRoute(builder: (context) => FailedPage()),
                //     );
                //   });
                // }
      
                // if (state.isGameSuccess) {
                //   WidgetsBinding.instance.addPostFrameCallback((_) {
                //     Navigator.pushReplacement(
                //       context,
                //       MaterialPageRoute(builder: (context) => SuccessPage()),
                //     );
                //   });
                // }
 
