import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _listNumbers = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _add10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchData();
      }
    });
  }

  //Para terminar las paginas el scroll
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children: <Widget>[_createList(), _createLoading()],
      ),
    );
  }

  Widget _createList() {
    return RefreshIndicator(
      // Para refrescar la página
      onRefresh: _getPage1,

      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listNumbers.length,
        itemBuilder: (BuildContext context, int index) {
          final imgage = _listNumbers[index];
          return FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: NetworkImage('https://picsum.photos/id/$imgage/400/300'));
        },
      ),
    );
  }

  void _add10() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listNumbers.add(_ultimoItem);
    }

    setState(() {});
  }

  //Simulado un diley
  Future<Null> _fetchData() async {
    _isLoading = true;
    setState(() {
      new Timer(Duration(seconds: 2), respuestaHTTP);
    });
  }

  void respuestaHTTP() {
    _isLoading = false;
    _add10();
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      );
    } else {
      return Container();
    }
  }

  Future<void> _getPage1() async {
    new Timer(Duration(seconds: 2), () {
      _listNumbers.clear();
      _ultimoItem++;
      _add10();
    });

    return Future.delayed(Duration(seconds: 2));
  }
}
