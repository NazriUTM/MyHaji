import 'package:flutter/material.dart';

class SchedulePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 120, 20, 1),
        title: Text("Schedule"),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(
                    0.2, 0.0), // 10% of the width, so there are ten blinds.
                colors: [
                  const Color(0xFFFFFFEE),
                  const Color(0xFF999999)
                ], // whitish to gray
                tileMode:
                    TileMode.repeated, // repeats the gradient over the canvas
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
            child: Table(
              border: TableBorder.all(
                  color: Colors.black26, width: 1, style: BorderStyle.solid),
              children: [
                TableRow(
                    decoration: BoxDecoration(color: Colors.blue[300]),
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                        child: TableCell(
                            child: Center(
                                child: Text(
                          'Date',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                        child: TableCell(
                            child: Center(
                                child: Text(
                          'Activity',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))),
                      ),
                    ]),
                TableRow(
                    decoration: BoxDecoration(color: Colors.blue[50]),
                    children: [
                      TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Center(child: Text('8 Zulhijjah'))),
                      TableCell(
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                              child: Text(
                                  'Memakai Ihram dan Berniat Ihram di Miqat'))),
                    ]),
                TableRow(
                    decoration: BoxDecoration(color: Colors.blue[100]),
                    children: [
                      TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Center(
                              child: Text('9 Zulhijjah – 10 Zulhijjah'))),
                      TableCell(
                          child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                        child: Text(
                            '• Wuquf di Arafah \n • Bertolak ke Muzdalifah \n • Mengutip batu di Muzdalifah \n • Bermalam batu di Muzdalifah'),
                      )),
                    ]),
                TableRow(
                    decoration: BoxDecoration(color: Colors.blue[50]),
                    children: [
                      TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Center(child: Text('10 Zulhijjah'))),
                      TableCell(
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                              child: Text(
                                  '•	Melontar Jamrah Kubra \n•	Bergunting / Bercukur'))),
                    ]),
                TableRow(
                    decoration: BoxDecoration(color: Colors.blue[100]),
                    children: [
                      TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Center(child: Text('11, 12, 13 Zulhijjah'))),
                      TableCell(
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                              child: Text(
                                  '•	Bermalam di Mina \n•	Melontar ketiga-tiga Jamrah'))),
                    ]),
                TableRow(
                    decoration: BoxDecoration(color: Colors.blue[50]),
                    children: [
                      TableCell(child: Center(child: Text(''))),
                      TableCell(
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                              child: Text('Tawaf'))),
                    ]),
                TableRow(
                    decoration: BoxDecoration(color: Colors.blue[100]),
                    children: [
                      TableCell(child: Center(child: Text(''))),
                      TableCell(
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                              child: Text('Sa’ie'))),
                    ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
