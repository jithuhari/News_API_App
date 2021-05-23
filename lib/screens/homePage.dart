import 'package:flutter/material.dart';
import 'package:news_api/models/newsinfo.dart';
import 'package:news_api/services/api_manager.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  late Future<Welcome> _newsModel;

  @override
  void initState() {
    _newsModel = Api_Manager().getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('News App'),
      ),

      body: Container(
        child: FutureBuilder<Welcome>(
          future: _newsModel,
          builder:(context , snapshot){
            if (snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.articles.length,
              itemBuilder: 
              (context , index){
                var article = snapshot.data!.articles[index];
              return Container(
              height: 100,
              child: Row(children: [
                Image.network(
                article.urlToImage
                ),
              ],),
            );
          }); 
          }
          else
          return Center(child: CircularProgressIndicator());
            
             
          },
        ),
      ),
      
    );
  }
}