import 'dart:math';

import 'package:flutter/material.dart';

class ScreenExpanded extends StatefulWidget {
  @override
  _ScreenExpandedState createState() => _ScreenExpandedState();
}

var random = Random();
int _colorB = 100;
int _colorG = 90;
int _colorR = 70;

class _ScreenExpandedState extends State<ScreenExpanded> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Container Expanded'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      //usa o padding para nos containers nao ficaram colados nas laterais
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        //primeira orientação pegando o o max de espaço disponivel do layout
        // o alocando para seus filhos no final sera colocado so botoes
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            //aqui usado no scroll fazendo preenxendo todo os eus espaço
            Expanded(
              child: SingleChildScrollView(
                //nao se usa um expanded pq ja estou usando dentro do scroll
                child: Column(
                  children: <Widget>[
                    //aqui nesse container tb nao pq ele esta ligado a coluna anterior
                    _boxContainer('box fixo 200x50'),
                    SizedBox(height: 8),
                    Row(
                      children: <Widget>[
                        //nessa caso ja posso usar pq ele nao esta ligado direto ao scroll e sim a row
                        Expanded(
                          flex: 70,
                          child: _boxContainer('70%'),
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          flex: 20,
                          child: _boxContainer('20%'),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    //da mesma forma que o primeiro dentro de uma coluna q
                    //ja usa um expanded nao e permitido usar outro
                    _boxContainer('box fixo 200x50'),
                    SizedBox(height: 8),
                    //pode se ter para os rows pq nao estamos usando um expanded dentro de outro row
                    // e sim um row dentro de uma column
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 10,
                          child: _boxContainer('10%'),
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          flex: 40,
                          child: _boxContainer('40%'),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 32,
                          child: _boxContainer('32%'),
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          flex: 28,
                          child: _boxContainer('28%'),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 35,
                          child: _boxContainer('35%'),
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          flex: 25,
                          child: _boxContainer('25%'),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 20,
                          child: _boxContainer('20%'),
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          flex: 40,
                          child: _boxContainer('40%'),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 30,
                          child: _boxContainer('30%'),
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          flex: 40,
                          child: _boxContainer('40%'),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 30,
                          child: _boxContainer('30%'),
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          flex: 40,
                          child: _boxContainer('40%'),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 30,
                          child: _boxContainer('30%'),
                        ),
                        SizedBox(width: 4),
                        Expanded(
                          flex: 40,
                          child: _boxContainer('40%'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //botoes numa linha fora do expanded e do scroll assim fica fora da
            //rolagem e fixos no final da coluna, ambos com Expanded
            Row(
              children: <Widget>[
                Expanded(
                  flex: 30,
                  child: RaisedButton.icon(
                    onPressed: () {
                      setState(() {
                        _colorB = random.nextInt(250);
                        _colorR = random.nextInt(250);
                        _colorG = random.nextInt(250);
                      });
                    },
                    color: Colors.blue,
                    icon: Icon(Icons.refresh),
                    label: Text('Random Cor 1'),
                  ),
                ),
                SizedBox(width: 4),
                Expanded(
                  flex: 30,
                  child: RaisedButton.icon(
                    onPressed: () {
                      setState(() {
                        _colorB = random.nextInt(100);
                        _colorR = random.nextInt(150);
                        _colorG = random.nextInt(250);
                      });
                    },
                    color: Colors.blue,
                    icon: Icon(Icons.refresh),
                    label: Text('Random Cor 2'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//funcao usada para gerar os box retorna um widget de container
Widget _boxContainer(String text) {
  return Container(
    width: 200,
    height: 50,
    decoration: BoxDecoration(
      color: Color.fromRGBO(_colorR, _colorG, _colorB, 1),
      border: Border.all(color: Colors.black),
    ),
    child: Text(text),
  );
}
