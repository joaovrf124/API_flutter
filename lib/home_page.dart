import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //Pacote que faz as requisições da internet e traz a aplicação
import 'Usuario.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyHomePageState();
  }

    class _MyHomePageState extends State<HomePage>{

      late Future<List<Usuario>> usuarios;

      @override
  void initState() {
    super.initState();
    usuarios = pegarUsuario();
  }

      @override
      Widget build(BuildContext context){
        return Scaffold(
          appBar: AppBar(title: Text("Usuarios")),
          
          body: Center(child:
            Container(
            padding: new EdgeInsets.all(30.0),
            child: FutureBuilder(
              future: usuarios,
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                    Usuario usuario = snapshot.data![index];
                    return Container(
                      
                      child: ListTile(
                      
                      title: Text(usuario.name!)
                      ,
                      
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(usuario.website!),
                        Text(usuario.phone!),
                        Text(usuario.email!)
                      ]),
                      
                    ));
                  });
                }else if(snapshot.hasError){
                  return Text(snapshot.error.toString());
                }
                return const CircularProgressIndicator();
              },
            ),)
          ));
      }

    Future<List<Usuario>> pegarUsuario() async {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
      var response = await http.get(url);
      if(response.statusCode == 200) {
      List listaUsuario =  jsonDecode(response.body);
      return listaUsuario.map((json) => Usuario.fromJson(json)).toList();
      } else{
        throw Exception("Erro não foi possivel carregar os usuarios.");

      }

    }
    }
    


