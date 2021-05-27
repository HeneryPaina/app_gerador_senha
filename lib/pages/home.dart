import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerTamanho = TextEditingController(text: "8");

  String senha = "";
  bool letrasMaiusculas = true;
  bool letrasMinusculas = true;
  bool numeros = true;
  bool simbolos = true;

  senhaGerada(bool letrasMai, bool letrasMin, bool numeros, bool simbolos) {
    if (letrasMai == false &&
        letrasMin == false &&
        numeros == false &&
        simbolos == false) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(
                  "Para gerar senha é necessário que pelo menos uma opção esteja selecionada."),
              actions: <Widget>[
                FlatButton(
                  child: Text("OK"),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            );
          });
    } else {
      String letrasMaiusculas = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
      String letrasMinusculas = "abcdefghijklmnopqrstuvwxyz";
      String numbers = "0123456789";
      String symbolos = "!@#\$%&*(){}[]-_=+<>,./";

      int tam = int.parse(_controllerTamanho.text);

      String senhaGer = "";
      senhaGer += (letrasMai ? letrasMaiusculas : "");
      senhaGer += (letrasMin ? letrasMinusculas : "");
      senhaGer += (numeros ? numbers : "");
      senhaGer += (simbolos ? symbolos : "");

      String pass = "";

      for (int i = 0; i < tam; i++) {
        int random = Random.secure().nextInt(senhaGer.length);
        pass += senhaGer[random];
        setState(() {
          senha = pass;
        });
      }

      return senha;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "GERADOR DE SENHAS",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 40, 10, 10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width * .70,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        "$senha",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  FlatButton(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Icon(
                          Icons.content_copy,
                          color: Colors.grey[4000],
                        ),
                        Text(
                          "Copiar",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blueAccent),
                child: FlatButton(
                  child: Text(
                    "Gerar Senha",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    senhaGerada(
                      letrasMaiusculas,
                      letrasMinusculas,
                      numeros,
                      simbolos,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xfffff),
                ),
                child: Column(
                  children: [
                    Text(
                      "Preferências",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blueAccent),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Tamanho"),
                        Container(
                          width: MediaQuery.of(context).size.width / 6,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Letras maiúsculas"),
                        Checkbox(
                          value: letrasMaiusculas,
                          checkColor: Colors.white,
                          activeColor: Colors.blueAccent,
                          onChanged: (bool value) {
                            setState(() {
                              letrasMaiusculas = value;
                            });
                          },
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Letras minúsculas"),
                        Checkbox(
                          value: letrasMinusculas,
                          checkColor: Colors.white,
                          activeColor: Colors.blueAccent,
                          onChanged: (bool value) {
                            setState(() {
                              letrasMinusculas = value;
                            });
                          },
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Números"),
                        Checkbox(
                          value: numeros,
                          checkColor: Colors.white,
                          activeColor: Colors.blueAccent,
                          onChanged: (bool value) {
                            setState(() {
                              numeros = value;
                            });
                          },
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Símbolos"),
                        Checkbox(
                          value: simbolos,
                          checkColor: Colors.white,
                          activeColor: Colors.blueAccent,
                          onChanged: (bool value) {
                            setState(() {
                              simbolos = value;
                            });
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
