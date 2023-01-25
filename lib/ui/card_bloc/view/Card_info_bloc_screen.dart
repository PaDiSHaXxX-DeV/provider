import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_part_one/data/repositories/My_reposForBloc.dart';
import 'package:provider_part_one/ui/card_bloc/card_bloc.dart';
import 'package:provider_part_one/ui/card_bloc/card_event.dart';
import 'package:provider_part_one/ui/card_bloc/card_state.dart';
import 'package:provider_part_one/utils/my_utils.dart';

class CardInfoScreenBloc extends StatelessWidget {
  const CardInfoScreenBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //2 BlocProvider.of<AlbumCubit>(context).fetchAllAlbums();
    return BlocProvider(
      create: (context) =>
          CardsBloc(context.read<Cards_Repos>())..add(FetchAllCards()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("mock api bloc"),
        ),
        body: Column(
          children: [
            BlocConsumer<CardsBloc, CardBlocState>(
              builder: (context, state) {
                if (state is InitialCardsState) {
                  return const Center(
                    child: Text("Hali data yo/'q"),
                  );
                } else if (state is LoadCardsInProgress) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is LoadCardsInSuccess) {
                  return Expanded(
                    child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: state.albums.length,
                  itemBuilder: ((context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      height: 250,
                      width: 180,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(
                                  hexColor(state.albums[index].colors.color_a)),
                              Color(
                                  hexColor(state.albums[index].colors.color_b)),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state.albums[index].card_type.toString(),
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                                Text(
                                  state.albums[index].card_number.toString(),
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                Text(
                                  state.albums[index].bank_name.toString(),
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ],
                            ),
                            Text(
                              state.albums[index].expire_date
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
                                SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Image.network(
                                        state.albums[index].icon_image)),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                    ),
                  );
                } else if (state is LoadCardsInFailure) {
                  return Center(
                    child: Text(
                      state.errorText.toString(),
                    ),
                  );
                }
                return const SizedBox();
              },
              buildWhen: (oldState, newState) {
                return true; //newState is LoadAlbumsInFailure;
              },
              listener: (context, state) {
                MyUtils.getMyToast(message: "Loading in progress...");
              },
              listenWhen: (oldState, newState) {
                return oldState is LoadCardsInProgress;
              },
            ),
          ],
        ),
      ),
    );
  }
}

hexColor(String color_hexcode) {
  String colornew = '0xff$color_hexcode';
  colornew = colornew.replaceAll("#", "");
  int colorint = int.parse(colornew);
  return colorint;
}
