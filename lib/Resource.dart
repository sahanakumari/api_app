import 'package:http/http.dart' as http;
import 'package:api_app/Model.dart';
import 'dart:convert';



class Resource {

  List<Model> news  = [];

  Future<void> getNews() async{

    String url = "https://milkiyat.bangalore2.com/api/home/";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["model"].forEach((element){

        if(element['urlToImage'] != null ){
         Model model = Model(

            urlToImage: element['urlToImage'],


          );
          news.add(model);
        }

      });
    }
  }
}