import 'package:flutter/material.dart';
import 'package:poke_api/Models/cards_models.dart';
import '../helpers/request.dart';
import 'Views/cartas_view.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Clas Royale Info')),
        ),
        body: FutureBuilder(
          future: getCards(),
          builder: (BuildContext context, AsyncSnapshot<CardsList?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListaCartas(snapshot.data!.items!);
            }
          },
        ));
  }
}
