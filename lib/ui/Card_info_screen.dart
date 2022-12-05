import 'package:flutter/material.dart';
import 'package:provider/view_model/bella_view_model.dart';

class CardInfoScreen extends StatelessWidget {
  const CardInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var bellaProvider = Provider.of<BellaViewModel>(context);
    print("REBUILDEING BUILD METHOD");

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text("API CALL"),
      ),
      body: Column(
        children: [
          
          Consumer<CardViewModel>(
            builder: (context, cardViewModel, child) {
              return Center(
                child: cardViewModel.isLoading
                    ? const CircularProgressIndicator()
                    : (cardViewModel.userData == null
                        ? const Text("Hozircha data juq")
                        : Container(
                            height: 700,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: cardViewModel.userData?.length ?? 1,
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
                                          Color(hexColor(cardViewModel
                                              .userData![index]
                                              .colors!
                                              .colorA!)),
                                          Color(hexColor(cardViewModel
                                              .userData![index]
                                              .colors!
                                              .colorB!)),
                                        ]),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      
                                      children: [
                                        SizedBox(height: 12,),

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(cardViewModel
                                                .userData![index].cardType
                                                .toString(),style: TextStyle(fontSize: 16,color: Colors.white),),
                                            Text(cardViewModel
                                                .userData![index].cardNumber
                                                .toString(),style: TextStyle(fontSize: 14,color: Colors.white),),
                                            Text(cardViewModel
                                                .userData![index].bankName
                                                .toString(),style: TextStyle(fontSize: 16,color: Colors.white),),
                                          ],
                                        ),
                                        Text(cardViewModel
                                            .userData![index].expireDate
                                            .toString()
                                            .replaceAll('12:18:33.933384', ''),style: TextStyle(fontSize: 14,color: Colors.white),),
                                            SizedBox(height: 40,),
                                        Row(
                                          children: [
                                            Container(
                                                height: 100,
                                                width: 100,
                                                child: Image.network(
                                                    cardViewModel
                                                        .userData![index]
                                                        .iconImage!)),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                            ),
                          )),
              );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CardViewModel>().fetchAllInfo();
        },
        child: const Icon(Icons.download),
      ),
    );
  }
}

hexColor(String colorhexcode) {
  String colornew = '0xff$colorhexcode';
  colornew = colornew.replaceAll("#", "");
  int colorint = int.parse(colornew);
  return colorint;
}
