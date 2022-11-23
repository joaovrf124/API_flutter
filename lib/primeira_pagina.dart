import 'package:api_trabalho_principal/home_page.dart';
import 'package:flutter/material.dart';


class PaginaInicial extends StatefulWidget {
  const PaginaInicial({Key? key}) : super(key: key);

  @override
  State<PaginaInicial> createState() => _PaginaInicial();
  }

class _PaginaInicial extends State<PaginaInicial>{
  @override
   Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Seja Bem vindo!!'),
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Informações dos usuarios:",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
          Container(
            height:10, //height of button
            
          ),
          SizedBox( 
              height:50, //height of button
              width:200,
          
          child:ElevatedButton(
            
            onPressed: (() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()));
          }),
          
          child: Text('Clique'),
          style: ElevatedButton.styleFrom(
          textStyle:TextStyle(fontSize: 20),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            )
          ),
          
      ))],
      )
    ));
   }  

  }