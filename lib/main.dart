import 'package:flutter/material.dart';
import 'package:provider_part_one/data/api_service/Service.dart';
import 'package:provider_part_one/data/local_db/local_db.dart';
import 'package:provider_part_one/data/repositories/My_repository_card.dart';
import 'package:provider_part_one/ui/Card_info_screen.dart';
import 'package:provider_part_one/view_model/bella_view_model.dart';
import 'package:provider/provider.dart';



void main() {
  MyRepository_card myRepository_card = MyRepository_card(apiService: ApiService_card(), localDatabase: LocalDatabase(),);
  CardViewModel cardViewModel = CardViewModel(myRepository: myRepository_card);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => cardViewModel),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CardInfoScreen());
  }
}
