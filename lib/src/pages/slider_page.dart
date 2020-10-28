import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valueSlider = 200;
  bool _blockCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _createCheckbox(),
            _createSwitch(),
            Expanded(child: _createImage())
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigo,
      label: 'Tamaño de la imagen: $_valueSlider',
      // divisions: 20,
      value: _valueSlider,
      min: 10,
      max: 400,
      onChanged: (_blockCheck)
          ? null
          : (value) {
              setState(() {
                _valueSlider = value;
              });
            },
    );
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage(
          'https://i.pinimg.com/originals/e6/00/3e/e6003e403f0b14f45fcd7584567f4cc1.png'),
      width: _valueSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _createCheckbox() {
    // return Checkbox(
    //     value: _blockCheck,
    //     onChanged: (value) {
    //       setState(() {
    //         _blockCheck = value;
    //       });
    //     });

    return CheckboxListTile(
        title: Text('Bloquear Slider'),
        value: _blockCheck,
        onChanged: (value) {
          setState(() {
            _blockCheck = value;
          });
        });
  }

  Widget _createSwitch() {
    return SwitchListTile(
        title: Text('Bloquear Slider'),
        value: _blockCheck,
        onChanged: (value) {
          setState(() {
            _blockCheck = value;
          });
        });
  }
}
