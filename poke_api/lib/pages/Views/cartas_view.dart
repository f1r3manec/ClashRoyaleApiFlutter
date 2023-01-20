import 'package:flutter/material.dart';
import '../../Models/cards_models.dart';

class ListaCartas extends StatefulWidget {
  final List<Item?> cartas;
  const ListaCartas(this.cartas, {super.key});
  @override
  State<ListaCartas> createState() => _ListaCartas();
}

class _ListaCartas extends State<ListaCartas> {
  bool estado = false;
  List<Item> cartasState = [];
  void setEstado(int index, bool estadoActual) {
    setState(() {
      widget.cartas[index]?.setFavorito(!estadoActual);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: ListView.builder(
        itemCount: widget.cartas.length,
        itemBuilder: (context, index) {
          final carta = widget.cartas[index];
          return Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Card(
                child: ListTile(
                  title: Text(carta!.name!),
                  subtitle:
                      Text('Nivel Máximo ${widget.cartas[index]?.maxLevel}'),
                  leading: Image.network(
                    '${widget.cartas[index]?.iconUrls!.medium}',
                    height: 90,
                    width: 90,
                  ),
                  trailing: Icon(Icons.thumb_up,
                      color: widget.cartas[index]!.favorito
                          ? Colors.blue
                          : Colors.grey),
                  onTap: () => setEstado(index, widget.cartas[index]!.favorito),
                ),
              ));
        },
      ),
    );
  }
}
