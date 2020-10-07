import 'dart:math';
import 'package:flutter/material.dart';
import 'ticket_list.dart';


// Air craft company
const kSingaporeLogoUrl = 'https://user-images.githubusercontent.com/7200238/82220821-1ebc8880-995a-11ea-9d77-07edda64f05c.png';
const kQantasLogoUrl = 'https://user-images.githubusercontent.com/7200238/82220824-1fedb580-995a-11ea-8124-f59daff4ebda.png';
const kEmiratesLogoUrl = 'https://user-images.githubusercontent.com/7200238/82220816-1c5a2e80-995a-11ea-921d-38b3f991d8d2.png';
const kHainanLogoUrl = 'https://user-images.githubusercontent.com/7200238/82223309-73adce00-995d-11ea-98c0-2dba4e094aca.png';


void main(List<String> args) {runApp(MyApp());}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flight_Booking",
      theme: ThemeData.light(),
      home: HomeScreen(),
    );
  }
}


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return NextScreen();
                },
              ),
            );
          },
        ),
        elevation: 0,
        backgroundColor: Colors.indigo[400],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top:5.0, bottom:20.0),
            color: Colors.indigo[400],
            child: Row(
              children: [
                Expanded(
                  flex:1,
                  child: Container(
                    width: 150.0,
                    child: Column(
                      children: [
                        Text("HND", style:TextStyle(fontSize:45.0, color: Colors.white)),
                        Text("Tokyo/Haneda", style:TextStyle(fontSize:20.0, color: Colors.grey[400])),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(44),
                  ),
                  child: Transform.rotate(
                    angle: pi/2,  /// [pi=180 degrees]
                    child: Icon(
                      Icons.flight,
                      size: 40.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  flex:1,
                  child: Container(
                    width: 150.0,
                    child: Column(
                      children: [
                        Text("LDN", style:TextStyle(fontSize:45.0, color: Colors.white)),
                        Text("London", style:TextStyle(fontSize:20.0, color: Colors.grey[400])),
                      ],),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 12.0),
            width: double.infinity,
            height: 60.0,
            child: Text(
              "Monday, 30 May, 2033",
              style:TextStyle(fontSize:20.0, color: Colors.grey[400]),
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.indigo[400]),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(24),
                bottomLeft: Radius.circular(24),
              ),
              color: Colors.indigo[400],
              boxShadow: [BoxShadow(
                color: Colors.indigo[200],
                spreadRadius: 1.0,
                blurRadius: 10.0,
                offset: Offset(10, 10),
              ),],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left:15.0),
                child: Text(
                  "Tickets",
                  style: TextStyle(fontSize:20.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right:15.0),
                child: IconButton(
                  icon: Icon(Icons.filter_list),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute( builder: (context) {
                      return NextScreen();
                    }));
                  },
                ),
              ),
            ],
          ),
          TicketList(),
        ],
      ),
    );
  }
}



/// --- [sup] ---
class NextScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: (){
        Navigator.of(context).pop();
      },
      child: Text("back to Home Screen")
    );
  }
}
