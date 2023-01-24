import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_part_one/cubit/album_cubit.dart';
import 'package:provider_part_one/data/api_service/api_service.dart';
import 'package:provider_part_one/data/repositories/My_repository_card.dart';
import 'package:provider_part_one/ui/Card_info_screen.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (contex) => CardCubit(Cards_Repo(apiService: ApiService())))
    ],
    child: MyApp(),
  ));
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
        home: const UsersCardsPage());
  }
}
