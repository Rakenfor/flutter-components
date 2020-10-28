import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final options = ['Uno', 'Dos', 'Tres', 'Cuaro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components Temp'),
      ),
      body: ListView(
          // children: _crearItmes(),
          children: _crearItemsCorta()),
    );
  }

  // List<Widget> _crearItmes() {
  //   List<Widget> lista = new List<Widget>();

  //   for (String opt in options) {
  //     final tempWidget = ListTile(
  //       title: Text(opt),
  //     );

  //     lista..add(tempWidget)..add(Divider());
  //   }

  //   return lista;
  // }

  List<Widget> _crearItemsCorta() {
    var widgets = options.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('Cualquier cosa'),
            leading: Icon(Icons.ac_unit),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () => {},
          ),
          Divider()
        ],
      );
    }).toList();

    return widgets;
  }
}
