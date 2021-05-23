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
              height: 150,
              margin: EdgeInsets.all(3),
              
              child: Row(children: [
                 Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  article.urlToImage,
                                  fit: BoxFit.cover,
                                )),
                          ),

                          SizedBox(width: 5,),

                          Flexible(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Container(
                                  margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  child: Text(article.title,
                                  style: TextStyle(
                                    fontSize: 18,
                                    
                                    fontWeight: FontWeight.bold
                                  ),
                                  overflow: TextOverflow.ellipsis,),
                                ),

                                Container(

                                  margin: EdgeInsets.fromLTRB(5, 5, 5, 5),

                                  child: Text(article.description,
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,),
                                )
                              ],
                            ),
                          )


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