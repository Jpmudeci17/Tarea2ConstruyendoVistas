import 'package:flutter/material.dart';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'calcular IMC',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    bool ismale = true;
    final altura = TextEditingController();
    final peso = TextEditingController();


  @override
  Widget build(BuildContext context) {
    //Scaffold indica que se formara una pantalla
    return Scaffold(
      appBar: AppBar(
        title: Text('calcular IMC'),
        backgroundColor: Colors.green,
        actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.white,
      ),
          onPressed: () {
            altura.clear();
            peso.clear();
          },
    )
      ]
      ),
      // Columna para alinear elementos en vertical (de arriba hacia abajo)
      body: Column(

        children: [
          Align(
          alignment: Alignment.center,
          child:Text('Ingrese sus datos para calcular el IMC', textAlign:TextAlign.center)),
          Align(
          alignment: Alignment.center,
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: (){
                      ismale = !ismale;
                      setState(() {});
                    },
                    icon: Icon(Icons.male),
                    color: ismale ? Colors.blue : Colors.black,
                    ),
                  IconButton(
                    onPressed: (){
                      ismale = !ismale;
                      setState(() {});
                    },
                    icon: Icon(Icons.female),
                    color: ismale ? Colors.black : Colors.pink,
                    ),
                ]
          )
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: altura,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              
              decoration: InputDecoration(icon: Icon(Icons.square_foot, color: Colors.green,),
              border: OutlineInputBorder(),
              labelText: "Ingresar altura Metros",
              focusColor: Colors.green,
              focusedBorder:OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green, width: 2.0)
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: peso,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(icon: Icon(Icons.monitor_weight_rounded, color: Colors.green,),
              border: OutlineInputBorder(),
              labelText: "Ingresar peso Kilogramos",
              focusedBorder:OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green, width: 2.0)
                ),  
              ),
              
            ),
          ),
          ElevatedButton(
            onPressed: () { 
              var sum = double.parse(peso.text) / double.parse(altura.text);
              sum = sum /double.parse(altura.text);
              var text = ''' 
              Tabla del IMC para mujeres
              Edad             IMC ideal 
              16-17            19-24 
              18-19            19-24   
              20-24            19-24 
              25-34            20-25 
              35-44            21-26 
              45-54            22-27 
              55-64            23-28 
              65-90            25-30
              ''';
              if (ismale){
                text = ''' 
            Tabla del IMC para hombres
              Edad             IMC ideal 
              16-17            19-24   
              18-19            20-25   
              19-20            20-25   
              21-24            21-26 
              25-34            22-27 
              35-54            23-38 
              55-64            24-29 
              65-90            25-30
              ''';
              }
              showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text('Tu IMC es ${sum.toStringAsFixed(2)}'),
                content: 
                Text('${text}'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
            },
            child: const Text('Calcular'),
          )
          
        ],
      ),
    );
  }
}