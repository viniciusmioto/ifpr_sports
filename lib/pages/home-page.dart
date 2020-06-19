import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
             Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Container(
                width: 100,
                height: 100,
                child: Image.asset("assets/profile.png")
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                child: FlatButton(
                  child: 
                  Text("Conta",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onPressed: () => {},
                ), 
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                child: FlatButton(
                  child: 
                  Text("Times",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onPressed: () => {},
                ), 
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                child: FlatButton(
                  child: 
                  Text("Logout",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                onPressed: () => {},
                ), 
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(""),
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            title: Text(""),
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text(""),
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars),
            title: Text(""),
            backgroundColor: Colors.black,
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "IFPR SPORTS",
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          Container(
            width: 60,
            child: FlatButton(
              child: Icon(
                Icons.search,
                color: Colors.white70,
              ),
              onPressed: () => {},
            ),
          ),
        ],
      ),
    );
  }
}
