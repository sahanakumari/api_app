import 'package:flutter/cupertino.dart';

class Model {
  String urlToImage;


  Model({this.urlToImage});


  factory Model.fromJson(Map<String,dynamic>json){
    return Model(
      urlToImage: json['urlToImage'],
    );
  }
}