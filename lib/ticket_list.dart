import 'dart:ui';

import 'package:flutter/material.dart';

// AirPlane company
const kSingaporeLogoUrl = 'https://user-images.githubusercontent.com/7200238/82220821-1ebc8880-995a-11ea-9d77-07edda64f05c.png';
const kQantasLogoUrl = 'https://user-images.githubusercontent.com/7200238/82220824-1fedb580-995a-11ea-8124-f59daff4ebda.png';
const kEmiratesLogoUrl = 'https://user-images.githubusercontent.com/7200238/82220816-1c5a2e80-995a-11ea-921d-38b3f991d8d2.png';
const kHainanLogoUrl = 'https://user-images.githubusercontent.com/7200238/82223309-73adce00-995d-11ea-98c0-2dba4e094aca.png';


/// from[main.dart]to[ticket_list.dart]
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
      margin: EdgeInsets.symmetric(horizontal:15, vertical:10),
      width: double.infinity,
      height: 130,
      // ----
      decoration: ShapeDecoration(  /// [チケットのデザイン専用クラス。外側borderのshapeでチケットに見せる]
        color: Colors.white,
        shape: _TicketShapeBorder(width: 1, radius: 16.0),  /// f[Ticket()]t[_TicketShapeBorder()]
      ),
      // ----
      child: Row(
        children: [
          Expanded(  /// [ロゴ_part]->[(flex)ロゴpart:テーブルpart=1:2]
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(24),
              child: image,
            ),
          ),
          Container(  /// [縦線_part]
            width: 1,
            height: double.infinity,
            margin: EdgeInsets.symmetric(vertical:8),
            color: Colors.deepPurple[200],
          ),
          Expanded(  /// [テーブル_part]
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Table(  /// [---- Table()の作成 ----]
                children: [
                  TableRow(
                    children: [
                      Column(  /// [左上]
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
                      Column(  /// [右上]
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
                      SizedBox(height: 8),  // スペース用
                      SizedBox(height: 8),  // スペース用
                    ],
                  ),
                  TableRow(
                    children: [
                      Column(  /// [左下]
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
                      Column(  /// [右下]
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



/// f[Ticket()]t[_TicketShapeBorder()]
class _TicketShapeBorder extends ShapeBorder {   /// [ShapeBorder]ボーダ描画用!!
  final double width;
  final double radius;
  _TicketShapeBorder({@required this.width, @required this.radius});
  // ==========
  @override
  EdgeInsetsGeometry get dimensions {  /// [get dimension]
    return EdgeInsets.all(width);
  }
  @override
  ShapeBorder scale(double t) {  /// [ShapeBorder_scale]
    return _TicketShapeBorder(
      width: width * t,
      radius: radius * t,
    );
  }
  @override
  ShapeBorder lerpFrom(ShapeBorder a, double t) {  /// [ShapeBorder_lerpFrom]
    if (a is _TicketShapeBorder)
      return _TicketShapeBorder(
        width: lerpDouble(a.width, width, t),
        radius: lerpDouble(a.radius, radius, t),
      );
    return super.lerpFrom(a, t);
  }
  @override
  ShapeBorder lerpTo(ShapeBorder b, double t) {  /// [ShapeBorder_lerpTo]
    if (b is _TicketShapeBorder)
      return _TicketShapeBorder(
        width: lerpDouble(width, b.width, t),
        radius: lerpDouble(radius, b.radius, t),
      );
    return super.lerpTo(b, t);
  }
  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {  /// [Path_getInnerPath]
    return getOuterPath(
      rect.deflate(width),
      textDirection: textDirection,
    );
  }
  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {  /// [Path_getOuterPath]
    final r = radius;
    final rs = radius / 2; // 区切り部分の半径
    final w = rect.size.width; // 全体の横幅
    final h = rect.size.height; // 全体の縦幅
    final wl = w / 3; // ロゴ部分の横幅
    return Path()
      ..addPath(
        Path()
          ..moveTo(r, 0)
          ..lineTo(wl - rs, 0) // →
          ..arcToPoint(
            Offset(wl + rs, 0),
            radius: Radius.circular(rs),
            clockwise: false,
          )
          ..lineTo(w - r, 0) // →
          ..arcToPoint(Offset(w, r), radius: Radius.circular(r))
          ..lineTo(w, h - rs) // ↓
          ..arcToPoint(Offset(w - r, h), radius: Radius.circular(r))
          ..lineTo(wl + rs, h) // ←
          ..arcToPoint(
            Offset(wl - rs, h),
            radius: Radius.circular(rs),
            clockwise: false,
          )
          ..lineTo(r, h) // ←
          ..arcToPoint(Offset(0, h - r), radius: Radius.circular(r))
          ..lineTo(0, r) // ↑
          ..arcToPoint(Offset(r, 0), radius: Radius.circular(r)),
        Offset(rect.left, rect.top),
      );
  }
  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {  /// [void_Paint]
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = width
      ..color = Colors.indigo[200];
    canvas.drawPath(
      getOuterPath(
        rect.deflate(width / 2.0),
        textDirection: textDirection,
      ),
      paint,
    );
  }
}