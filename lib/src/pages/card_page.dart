import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cardas'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
          SizedBox(
            height: 30.0,
          ),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 1.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Titulo de la targeta'),
            subtitle: Text(
                'Muchos ejemplos de oraciones traducidas contienen “we are about” – Diccionario español-inglés y buscador de traducciones en español.'),
            leading: Icon(
              Icons.photo_album,
              color: Colors.purple,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Canseltar'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('Ok'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                'https://www.farazessaniphotography.com/wp-content/uploads/2016/10/4Y7C4642.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 250.0,
            fit: BoxFit.cover,
          ),
          // Image(
          //   image: NetworkImage(
          //       'https://www.farazessaniphotography.com/wp-content/uploads/2016/10/4Y7C4642.jpg'),
          // ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text('Bueno viendo los vordes'))
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 2.0,
                offset: Offset(2.0, -10.0))
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: card,
      ),
    );
  }
}
