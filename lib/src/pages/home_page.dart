// import 'package:components/src/pages/alert_page.dart';
import 'package:components/src/utils/icon_string_util.dart';
import 'package:flutter/material.dart';

//PRopias
import 'package:components/src/providers/menu_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    // menuProvider.cargarData()

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(children: _listItemes(snapshot.data, context));
      },
    );
  }

  List<Widget> _listItemes(List<dynamic> data, BuildContext context) {
    final List<Widget> options = [];

    data.forEach((element) {
      final widgetTem = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.purple,
        ),
        onTap: () {
          // final route = MaterialPageRoute(builder: (context) => AlertPage());
          // Navigator.push(context, route);

          Navigator.pushNamed(context, element['ruta']);
        },
      );

      options
        ..add(widgetTem)
        ..add(Divider(
          height: 0.0,
        ));
    });

    return options;
  }
}
