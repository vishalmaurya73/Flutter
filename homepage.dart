import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:flutter_application_2/model.dart';
import 'package:flutter_application_2/widget/drawer.dart';
//import 'package:flutter_application_2/Screen/model.dart';
import 'package:http/http.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      navigateAfterSeconds: Dasbord(),
      image: Image.asset(
        'assets/user.jpg',
        filterQuality: FilterQuality.high,
        fit: BoxFit.cover,
        height: 1000.0,
        width: 800.0,
      ),
      photoSize: 80.0,
      title: Text(
        'vishal maurya',
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
      loadingText: const Text('Loading'),
      loaderColor: Colors.blue,
      seconds: 4,
    );
  }
}

class Dasbord extends StatefulWidget {
  const Dasbord({Key? key}) : super(key: key);

  @override
  State<Dasbord> createState() => _DasbordState();
}

int _selectedItem = 0;

class _DasbordState extends State<Dasbord> {
  Icon cusIcon = Icon(Icons.more_vert);
  Widget cusSearchBar = Text("Latest News");
  TextEditingController searchCntroller = new TextEditingController();
  //List<NewsQueryModel> newsModelList = <NewsQueryModel>[];
  void _onTapItem(int index) {
    setState(() {
      _selectedItem = index;
    });

    if (index == 4) {
      Navigator.pushNamed(context, '/login');
    }
    if (index == 3) {
      Navigator.pushNamed(context, '/callme');
    }
    if (index == 2) {
      Navigator.pushNamed(context, '/news');
    }
    if (index == 1) {
      Navigator.pushNamed(context, '/logout');
    }
  }

  List<String> navBarItem = [
    "Top News",
    "India",
    "World",
    "Entertainment",
    "Health",
    "Education",
    "Sports",
    "Trip",
    "War",
    "Jobs",
    "Finance",
    "Social Media",
    "Crime",
  ];

  // bool is Loading = true
  // getNewsByQuery(String query) async {
  //   String url =
  //       "https://newsapi.org/v2/everything?q=apple&from=2022-09-09&to=2022-09-09&sortBy=popularity&apiKey=a6a9d71785b8452388deb142b76632c2";
  //   Response response = await get(Uri.parse(url));
  //   Map data = jsonDecode(response.body);
  //   setState(() {
  //     data["articles"].forEach((element) {
  //       NewsQueryModel newsQueryModel = new NewsQueryModel();
  //       newsQueryModel = NewsQueryModel.fromMap(element);
  //       newsModelList.add(newsQueryModel);
  //       setState(() {
  //         isLoading = false;
  //       });
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var city_name = ["Lucknow", "Mumbai", "Delhi", "Azamgarh"];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];

    return Scaffold(
      //App bar
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[600],
        // title: Text('Latest News'),
        // centerTitle: true,
        actions: <Widget>[
          InkWell(
            child: SizedBox(
              width: 80.0,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (this.cusIcon.icon == Icons.more_vert) {
                        this.cusIcon = Icon(Icons.cancel);
                        this.cusSearchBar = TextField(
                          textInputAction: TextInputAction.go,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hoverColor: Colors.amber,
                            hintText: "Search",
                          ),
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        );
                      } else {
                        this.cusIcon = Icon(Icons.more_vert);
                        this.cusSearchBar = Text("Latest News");
                      }
                    });
                  },
                  icon: Icon(Icons.search)),
            ),
          ),
          IconButton(onPressed: () {}, icon: cusIcon)
        ],
        title: cusSearchBar,

        //leading: Icon(Icons.calendar_month),
      ),

      drawer: DrawerScreen(),
      //search bar
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
                child: Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("search me");
                          },
                          child: Container(
                            child: Icon(
                              Icons.search,
                              color: Colors.blue,
                            ),
                            margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                          ),
                        ),
                        //Text('Search'),
                        Expanded(
                            child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search $city"),
                          textAlign: TextAlign.center,
                        ))
                      ],
                    ),
                  )
                ],
              ),
            )),

            //card first

            Container(
              height: 90,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 15),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                      margin: EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                          child: Image.asset(
                        'assets/social.jpg',
                        fit: BoxFit.fitWidth,
                        // width: double.infinity,
                      )),
                    ),
                  );
                },
              ),
            ),

            // menu start

            Container(
              height: 45,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: navBarItem.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      print(navBarItem[index]);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Center(
                        child: Text(
                          navBarItem[index],
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            //croucial slider

            //Slider start

            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 1),
              child: CarouselSlider(
                options: CarouselOptions(
                    height: 160,
                    autoPlay: true,
                    reverse: false,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    //enlargeCenterPage: true,
                    //autoPlayAnimationDuration: Duration(microseconds: 800),
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayCurve: Curves.fastOutSlowIn),
                items: items.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/news.jpg',
                                  fit: BoxFit.fitHeight,
                                  height: double.infinity,
                                ),
                              ),
                              Positioned(
                                  left: 20,
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.black.withOpacity(0),
                                            Colors.black12
                                          ],
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                        )),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 7, vertical: 5),
                                      child: Text(
                                        'Hey guys this is latest news!',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      //     ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),

            // Grid view
            Container(
              padding: EdgeInsets.all(20),
              child: GridView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.transparent,
                              offset: Offset(-70, -30),
                              blurRadius: 0,
                              spreadRadius: 5),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.home), Text('Home')],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.yellow,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.home), Text('Home')],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.yellow,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.home), Text('Home')],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.yellow,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.home), Text('Home')],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.yellow,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Icon(Icons.home), Text('Home')],
                    ),
                  ),
                ],
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
              ),
            ),

            // latest news text

            Container(
              margin: EdgeInsets.fromLTRB(25, 0, 0, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Latest News',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue),
                  ),
                ],
              ),
            ),

            // second card

            Container(
              margin: EdgeInsets.only(top: 20),
              height: 90,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                          child: Image.asset(
                        'assets/b.jpg',
                        fit: BoxFit.fitHeight,
                        // width: double.infinity,
                      )),
                    ),
                  );
                },
              ),
            ),

            //Latest news heading

            Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(25, 30, 0, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Old News',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlue),
                        ),
                      ],
                    ),
                  ),

                  //Scroll List slider

                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),

                      //itemCount: 8,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 7, vertical: 3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100)),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              elevation: 2.0,
                              child: Stack(
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        'assets/c.png',

                                        //   Image.network(
                                        // newsModelList[index].newsImg,)
                                        fit: BoxFit.fitHeight,
                                        width: double.infinity,
                                      )),
                                  Positioned(
                                      left: 0,
                                      right: 0,
                                      bottom: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            gradient: LinearGradient(
                                                colors: [
                                                  Colors.black12.withOpacity(0),
                                                  Colors.blueGrey
                                                ],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter)),
                                        padding:
                                            EdgeInsets.fromLTRB(15, 15, 10, 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          // children: [
                                          //   Text(
                                          //     newsModelList[index].newsHead,
                                          //     style: TextStyle(
                                          //         color: Colors.white,
                                          //         fontSize: 15,
                                          //         fontWeight: FontWeight.bold),
                                          //   ),
                                          //   Text(
                                          //     newsModelList[index]
                                          //                 .newsDes
                                          //                 .length >
                                          //             50
                                          //         ? "${newsModelList[index].newsDes.substring(0, 55)}...."
                                          //         : newsModelList[index]
                                          //             .newsDes,
                                          //     style: TextStyle(
                                          //         color: Colors.white,
                                          //         fontSize: 10,
                                          //         fontWeight: FontWeight.bold),
                                          //   ),
                                          // ],
                                        ),
                                      ))
                                ],
                              ),
                            ));
                      }),

                  //Show More Button

                  Container(
                    padding: EdgeInsets.fromLTRB(0, 12, 0, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {}, child: Text('Show More!'))
                      ],
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [SafeArea(child: Text('Hello Vishal'))],
                    ),
                  ),
                  //grid view

                  Container(
                    padding: EdgeInsets.all(20),
                    child: GridView(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.redAccent,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Icon(Icons.home), Text('Home')],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.yellow,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Icon(Icons.home), Text('Home')],
                          ),
                        ),
                      ],
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

//Bottom Bar

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'News'),
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: 'Call me'),
          BottomNavigationBarItem(icon: Icon(Icons.login), label: 'login'),
        ],
        currentIndex: _selectedItem,
        selectedFontSize: 14,
        iconSize: 25,
        onTap: _onTapItem,
      ),
    );
  }

  //Crousial Slider background Color

  final List items = [
    Colors.red,
    Colors.orange,
    Colors.blueGrey,
    Colors.lightGreen,
    Colors.yellow,
  ];
}
