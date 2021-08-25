import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    double? precoAlcool =
        double.tryParse(_controllerAlcool.text.replaceAll(",", "."));
    double? precoGasolina =
        double.tryParse(_controllerGasolina.text.replaceAll(",", "."));

// No calculo dividimos o valor do Alcool pela gasolina, se o resultado for menor que 0.7, abasteça com alcool e se for maior com gasolina.
    if ((precoAlcool! / precoGasolina!) >= 0.7) {
      setState(() {
        _textoResultado = "Abasteça com gasolina";
      });
    } else {
      setState(() {
        _textoResultado = "Abasteça com álcool";
      });
    }
    _limparCampos();
  }

  void _limparCampos() {
    _controllerAlcool.text = "";
    _controllerGasolina.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("Álcool ou Gasolina?"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),*/

      body: Stack(
        children: [
          Container(
            color: Colors.blue,
            height: 150,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 55),
              child: Column(children: [
                Center(
                  child: Text(
                    "Álcool ou Gasolina?",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
                Text(
                  "O melhor para o seu bolso!",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ]),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(top: 100),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(30),
                child: Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(bottom: 10, left: 10, right: 10),
                        child: Text(
                          "Saiba qual a melhor opção para abastecer!",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Preço do Álcool, ex: 3.50",
                        ),
                        style: TextStyle(fontSize: 22),
                        controller: _controllerAlcool,
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Preço da Gasolina, ex: 4.00",
                        ),
                        style: TextStyle(fontSize: 22),
                        controller: _controllerGasolina,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: RaisedButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "Calcular",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          onPressed: _calcular,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Center(
                          child: Text(
                            _textoResultado,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
