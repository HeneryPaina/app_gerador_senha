import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                        "Senha",
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
                  onPressed: () {},
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
                          value: null,
                          checkColor: Colors.white,
                          activeColor: Colors.blueAccent,
                          onChanged: (bool value) {
                            setState(() {});
                          },
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Letras minúsculas"),
                        Checkbox(
                          value: null,
                          checkColor: Colors.white,
                          activeColor: Colors.blueAccent,
                          onChanged: (bool value) {
                            setState(() {});
                          },
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Números"),
                        Checkbox(
                          value: null,
                          checkColor: Colors.white,
                          activeColor: Colors.blueAccent,
                          onChanged: (bool value) {
                            setState(() {});
                          },
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Símbolos"),
                        Checkbox(
                          value: null,
                          checkColor: Colors.white,
                          activeColor: Colors.blueAccent,
                          onChanged: (bool value) {
                            setState(() {});
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
