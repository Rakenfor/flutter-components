import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _password = '';
  String _date = '';
  String _optionSlected = 'Volar';

  List _poderes = ['Volar', 'Rayos x', 'Velocidad'];

  TextEditingController _textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Input'),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: <Widget>[
            _crearInput(),
            Divider(),
            _crearPerson(),
            Divider(),
            _crearEmail(),
            Divider(),
            _crearPassWord(),
            Divider(),
            _crearDate(context),
            Divider(),
            _crearDropdown()
          ],
        ),
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle),
          labelText: 'Nombre',
          helperText: 'Solo es el nobre',
          counter: Text('Cantidad de caracteres: ${_nombre.length}'),
          hintText: 'Nombre de  la persona'),
      onChanged: (value) => setState(() => _nombre = value),
    );
  }

  List<DropdownMenuItem<String>> _getOpcionesDropdownd() {
    List<DropdownMenuItem<String>> list = new List();

    _poderes.forEach((element) {
      list.add(
        DropdownMenuItem(
          child: Text(element),
          value: element,
        ),
      );
    });

    return list;
  }

  Widget _crearDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: DropdownButton(
              value: _optionSlected,
              items: _getOpcionesDropdownd(),
              onChanged: (value) {
                setState(() {
                  _optionSlected = value;
                });
              }),
        )
      ],
    );
  }

  Widget _crearPerson() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email es: $_email'),
      trailing: Text('$_optionSlected'),
    );
  }

  Widget _crearEmail() {
    return TextField(
      // autofocus: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email),
          labelText: 'Email',
          hintText: 'Email de la persona'),
      onChanged: (value) => setState(() => _email = value),
    );
  }

  Widget _crearPassWord() {
    return TextField(
      // autofocus: true,
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          suffixIcon: Icon(Icons.lock_outline),
          icon: Icon(Icons.lock),
          labelText: 'Password',
          hintText: 'Password de la persona'),
      onChanged: (value) => setState(() => _password = value),
    );
  }

  Widget _crearDate(BuildContext context) {
    return TextField(
      // autofocus: true,
      enableInteractiveSelection: false,
      controller: _textEditingController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          suffixIcon: Icon(Icons.calendar_view_day),
          icon: Icon(Icons.calendar_today),
          labelText: 'Date',
          hintText: 'Fecha de nacimiento'),

      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        locale: Locale('es', 'ES'),
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2015),
        lastDate: new DateTime(2025));

    if (picked != null) {
      setState(() {
        _date = picked.toString();
        _textEditingController.text = _date;
      });
    }
  }
}
