import 'package:flutter/material.dart';

class NotificationScrren extends StatefulWidget {
  const NotificationScrren({Key? key}) : super(key: key);

  @override
  State<NotificationScrren> createState() => _NotificationScrrenState();
}

int _selectedItem = 0;

class _NotificationScrrenState extends State<NotificationScrren> {
  void _onTapItem(int index) {
    setState(() {
      _selectedItem = index;
    });

    if (index == 4) {
      Navigator.pushNamed(context, '/logout');
    }
    if (index == 3) {
      Navigator.pushNamed(context, '/slider');
    }
    if (index == 2) {
      Navigator.pushNamed(context, '/add');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text('notification'),
            bottom: TabBar(tabs: <Widget>[
              Tab(
                icon: Icon(Icons.call_missed),
                text: 'missed call',
              ),
              Tab(
                icon: Icon(Icons.call_received),
                text: 'call received',
              ),
              Tab(
                icon: Icon(Icons.call_merge),
                text: 'merge call',
              ),
              Tab(
                icon: Icon(Icons.call_received),
                text: 'call received',
              ),
            ]),
          ),
          body: TabBarView(
            children: <Widget>[
              Center(
                child: Text(
                  'missed call here',
                  style: TextStyle(fontSize: 25.0),
                ),
              ),
              Center(
                  child: Text('Recived call here',
                      style: TextStyle(fontSize: 25.0))),
              Center(
                child: Text(
                  'merge call here',
                  style: TextStyle(fontSize: 25.0),
                ),
              ),
              Center(
                child: Text(
                  'merge call here',
                  style: TextStyle(fontSize: 25.0),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'like'),
              BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications), label: 'notifications'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.logout), label: 'logout'),
            ],
            currentIndex: _selectedItem,
            selectedFontSize: 14,
            iconSize: 25,
            onTap: _onTapItem,
          ),
        ));
  }
}
