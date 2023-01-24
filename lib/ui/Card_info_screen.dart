import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_part_one/cubit/cards_cubit.dart';
import 'package:provider_part_one/cubit/card_state.dart';
import 'package:provider_part_one/ui/card_bloc/view/Card_info_bloc_screen.dart';

class CardInfoScreen extends StatelessWidget {
  const CardInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var bellaProvider = Provider.of<BellaViewModel>(context);
    print("REBUILDEING BUILD METHOD");

    return BlocBuilder<CardCubit, CardState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("mock api cubit"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => CardInfoScreenBloc()));
                },
                icon: Icon(CupertinoIcons.ant)),
          ],
        ),
        body: Column(
          children: [
            state is LoadAlbumsInProgress
                ? const CircularProgressIndicator()
                : state is LoadAlbumsInSuccess
                    ? Container(
                        child: Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: state.cards.length,
                          itemBuilder: ((context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 6),
                              height: 250,
                              width: 180,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color(hexColor(
                                          state.cards[index].colors.color_a)),
                                      Color(hexColor(
                                          state.cards[index].colors.color_b)),
                                    ]),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          state.cards[index].card_type
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          state.cards[index].card_number
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          state.cards[index].bank_name
                                              .toString(),
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      state.cards[index].expire_date
                                          .toString()
                                          .replaceAll('12:18:33.933384', ''),
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            height: 100,
                                            width: 100,
                                            child: Image.network(
                                                state.cards[index].icon_image)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                      ))
                    : state is LoadAlbumsInFailure
                        ? Center(
                            child: Text(
                            state.errorText.toString(),
                          ))
                        : SizedBox()
          ],
        ),
      );
    });
  }
}

hexColor(String colorhexcode) {
  String colornew = '0xff$colorhexcode';
  colornew = colornew.replaceAll("#", "");
  int colorint = int.parse(colornew);
  return colorint;
}
