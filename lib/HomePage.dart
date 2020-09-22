import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MainFetchData extends StatefulWidget {
  @override
  _MainFetchDataState createState() => _MainFetchDataState();
}

class _MainFetchDataState extends State<MainFetchData> {

  bool _isloading = true;

  List<String> newslist = List<String>();

  void getImages() async {
    setState(() {
      _isloading = true;
    });
    var response = await http.get('https://milkiyat.bangalore2.com/api/home/');
    var jsonData = jsonDecode(response.body);
    print('-----');
    List list = jsonData['data'][0]['items'] as List;
    for (int i = 0; i < list.length; i++) {
      newslist.add(list[i]['image'].toString());
    }
    setState(() {
      newslist = newslist;
    });
    print(newslist.toString());
    print('-----');
    setState(() {
      _isloading = false;
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImages();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (_isloading == true)
          ? CircularProgressIndicator()
          : CarouselSlider(
              autoPlay: true,
              pauseAutoPlayOnTouch: Duration(seconds: 4),
              //height: 200,
              height: MediaQuery.of(context).size.height * 0.60,
              items: <Widget>[
                for (var i = 1; i < newslist.length; i++)
                  Container(
                    margin: const EdgeInsets.only(top: 190.0, left: 15),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(newslist[i]),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                  ),
              ],
            ),
    );
  }
}

