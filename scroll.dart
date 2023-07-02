import 'package:flutter/material.dart';

class Scroll_menu extends StatefulWidget {
  const Scroll_menu({Key? key}) : super(key: key);

  @override
  State<Scroll_menu> createState() => _Scroll_menuState();
}

class _Scroll_menuState extends State<Scroll_menu> {
  Icon cusIcon = Icon(Icons.more_vert);
  Widget cusSearchBar = Text("Vishal");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        titleSpacing: 0.0,
        actions: <Widget>[
          InkWell(
            child: SizedBox(
              width: 80.0,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (this.cusIcon.icon == Icons.search) {
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
                        this.cusSearchBar = Text("Vishal");
                      }
                    });
                  },
                  icon: Icon(Icons.search)),
            ),
          ),
          IconButton(onPressed: () {}, icon: cusIcon)
        ],
        title: cusSearchBar,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black12,
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 20,
                    offset: Offset(0, 20),
                    blurRadius: 0,
                    color: Colors.black12,
                  )
                ],
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
                color: Colors.orangeAccent,
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
    );
  }
}
