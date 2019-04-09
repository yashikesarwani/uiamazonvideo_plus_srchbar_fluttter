import 'package:flutter/material.dart';
//import 'package:dots_indicator/dots_indicator.dart';


// defining main function
void main() {
  runApp(MaterialApp(
    title: 'UI Clone of Amazon Video App.',
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}


// creating class for for MyApp
class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

int photoindex = 0;

List<String> photos = [
  'images/ap1.jpg',
  'images/ap2.jpg',
  'images/ap3.jpg',
  'images/ap4.jpg',
];


List<String> photosM = [
  'images/apm1.jpg',
  'images/apm2.jpg',
  'images/apm3.jpg',
  'images/apm4.jpg',
];


//creating state for class
class _MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: Drawer(),        //icon at topmost left corner
        appBar: AppBar(          //AppBar design
          backgroundColor: Colors.black,
          elevation: 0.0,
          // creating row for designing AppBar
          actions: <Widget>[
            Row(
              children: <Widget>[
                Text('prime',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                  ),),
                Text(' video',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold
                  ),)
              ],
            ),
            SizedBox(width: 180.0,),             //for creating space

            //Search icon on right corner of row
            IconButton(
                onPressed: (){
                  //debugPrint('Search Button Tapped');
                  showSearch(context: context, delegate: DataSearch());
                },
                icon: Icon(Icons.search,
                  size: 35,
                )),
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Home',
              ),

              Tab(
                text: 'TV Shows',
              ),

              Tab(
                text: 'Movies',
              ),

              Tab(
                text: 'Kids',
              ),
            ],
          ),
        ),

        //Appbar Designed
        backgroundColor: Colors.black,
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 220.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(photos[photoindex],
                              ),
                              fit: BoxFit.fill
                          )
                      ),
                    ),


                  ],
                ),


                // element -1
                Column(
                  children: <Widget>[
                    Padding(
                     padding: EdgeInsets.only(left: 10),
                     child: Container(
                       height: 230.0,
                       color: Colors.grey[900],
                       child: Column(
                         children: <Widget>[
                           Row(
                             mainAxisAlignment: MainAxisAlignment.start ,
                             children: <Widget>[
                               Padding(
                                 padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                                 child: Text('Watch next TV and Movies',
                                   style: TextStyle(
                                       color: Colors.white,
                                       fontSize: 20.0
                                   ),),
                               )
                             ],
                           ),

                           Column(
                             children: <Widget>[
                               Container(
                                 height: 180.0,
                                 child: ListView.builder(
                                   shrinkWrap: true,
                                   scrollDirection: Axis.horizontal,
                                   itemCount: photosM.length,
                                   itemBuilder: (BuildContext context, int index) {
                                     return Container(
                                       width: 240.0,
                                       child: Card(
                                         child: Image.asset(photosM[index],
                                         fit: BoxFit.fill)
                                       ),
                                     );
                                   },
                                 ),
                               )
                             ],
                           )


                         ],
                       )
                     ) ,
                    )
                  ],
                ),


                SizedBox(height: 10.0,),

                //element -2
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10),

                      //creating container for watch movies with image row
                      child: Container(
                          height: 230.0,
                          color: Colors.grey[900],
                          child: Column(
                            children: <Widget>[

                              // writing text and see more
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 10.0),
                                    child: Text('Top Movies',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0
                                      ),),
                                  ),
                                  InkWell(
                                    child: Text('See all',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 18.0
                                      ),),
                                    onTap: (){
                                      debugPrint('see more..');
                                    },
                                  )

                                ],
                              ),

                              // image column
                              Column(
                                children: <Widget>[
                                  Container(
                                    height: 180.0,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: photosM.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        return Container(
                                          width: 240.0,
                                          child: Card(
                                              child: Image.asset(photosM[index],
                                                  fit: BoxFit.fill)
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              )


                            ],
                          )
                      ) ,
                    )
                  ],
                )



              ],
            )
          ],

        ),

      ),

    );
  }
}


class DataSearch extends SearchDelegate<String>{

  final cities = ["Mumbai",
                  "Delhi",
                   "Bangalore",
                   "Allahabad",
                   "Goa",
                   "Lucknow",
                    "Hyderabad",
                    "Jaipur",
                    "Agra",
                    "Noida",
                    "Howrah"
  ];

  final recentCities = [
                        "Delhi",
                        "Bangalore",
                        "Allahabad",
                        "Goa"
  ];


  @override
  List<Widget> buildActions(BuildContext context){
    //actions for Appbar

    return[
      IconButton(icon: Icon(Icons.clear), onPressed: (){
        query = "";
      })
    ];
  }

  @override
  Widget buildLeading(BuildContext context){
    //leading icon on the left of the appbar

    return IconButton(
      icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation, ),

          onPressed: (){
           close(context, null);
          });

  }

  @override
  Widget buildResults(BuildContext context){
   //show some results based on the selection
     return Container(
         height: 100.0,
         width: 100.0,
         child: Card(
           color: Colors.green,
           child: Center(
             child: Text(query),
           ),
         ),
       );
  }

  @override
  Widget buildSuggestions(BuildContext context){
    //show when someone searches for something

    final suggestionList = query.isEmpty ? recentCities : cities.where((p)=>p.startsWith(query)).toList();

    return ListView.builder(itemBuilder: (context, index) => ListTile(
      onTap: (){
        showResults(context);
      },

      leading: Icon(Icons.location_city),
      title: RichText(
          text: TextSpan(
            text: suggestionList[index].substring(0, query.length),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),
            children: [ TextSpan(
              text: suggestionList[index].substring(query.length),
              style: TextStyle(
                color: Colors.grey
              )
            )]
          )),
    ),
       itemCount: suggestionList.length,
    );
  }






}