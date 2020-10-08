import 'package:flutter/material.dart';

// Air craft company
const kSingaporeLogoUrl = 'https://user-images.githubusercontent.com/7200238/82220821-1ebc8880-995a-11ea-9d77-07edda64f05c.png';
const kQantasLogoUrl = 'https://user-images.githubusercontent.com/7200238/82220824-1fedb580-995a-11ea-8124-f59daff4ebda.png';
const kEmiratesLogoUrl = 'https://user-images.githubusercontent.com/7200238/82220816-1c5a2e80-995a-11ea-921d-38b3f991d8d2.png';
const kHainanLogoUrl = 'https://user-images.githubusercontent.com/7200238/82223309-73adce00-995d-11ea-98c0-2dba4e094aca.png';


class TicketList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _Ticket(image: Image.network(kSingaporeLogoUrl)),  /// f[TicketList()]t[Ticket()]...[pass namedParameter]
        _Ticket(image: Image.network(kQantasLogoUrl)),
        _Ticket(image: Image.network(kEmiratesLogoUrl)),
        _Ticket(image: Image.network(kHainanLogoUrl)),
      ],
    );
  }
}


/// f[TicketList()]t[Ticket()]
class _Ticket extends StatelessWidget{
  final Image image;
  _Ticket({Key key, @required this.image}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 128,
      // decoration: ShapeDecoration(
      //   color: Colors.white,
      //   // shape: _TicketShapeBorder(width: 1, radius: 16.0),
      //   shape: null,
      // ),
      child: Row(      /// [aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa]
        children: [
          Expanded(  /// [ロゴ]
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(24),
              child: image,
            ),
          ),
          Container(  /// [縦線]
            width: 1,
            height: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            color: Colors.deepPurple[200],
          ),
          Expanded(  /// [table]
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Table(
                children: [
                  TableRow(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Departure',
                            style: TextStyle(color: Colors.deepPurple[300]),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '04:25 pm',
                            style: TextStyle(
                              color: Colors.deepPurple[400],
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Arrive',
                            style: TextStyle(color: Colors.deepPurple[500]),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '07:55 pm',
                            style: TextStyle(
                              color: Colors.deepPurple[600],
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      SizedBox(height: 8),
                      SizedBox(height: 8),
                    ],
                  ),
                  TableRow(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Estimation',
                            style: TextStyle(color: Colors.deepPurple[600]),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '4h, 30m',
                            style: TextStyle(
                              color: Colors.deepPurple[600],
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$250.00',
                            style: TextStyle(
                              color: Colors.deepPurple[600],
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '/person',
                            style: TextStyle(color: Colors.deepPurple[600]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
