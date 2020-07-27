import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 120, 20, 1),
          title: Text("Location"),
          centerTitle: true,
        ),
        body: Container(
          width: 500,
          height: 700,
          child: Stack(
            children: <Widget>[
              Container(),
              Positioned(
                top: 50,
                right: 155,
                child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 100,
                  // color: Colors.blue,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/miqat.jpg'))),
                  // color: Colors.pink,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new MiqatDetailsPage()));
                    },
                    padding: EdgeInsets.only(top: 85),
                    child: Text('Miqat'),
                  ),
                ),
              ),
              Positioned(
                top: 230,
                right: 40,
                child: Container(
                  // alignment: Alignment.center,
                  width: 100,
                  height: 100,
                  // color: Colors.red,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/kaabah.png'))),
                  // color: Colors.pink,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new MakkahDetailsPage()));
                    },
                    padding: EdgeInsets.only(top: 75),
                    child: Text('Makkah'),
                  ),
                ),
              ),
              Positioned(
                bottom: 175,
                right: 90,
                child: Container(
                  // alignment: Alignment.center,
                  width: 100,
                  height: 100,
                  // color: Colors.purple,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/arafah.jpg'))),
                  // color: Colors.pink,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new ArafahDetailsPage()));
                    },
                    padding: EdgeInsets.only(top: 85),
                    child: Text('Arafah'),
                  ),
                ),
              ),
              Positioned(
                bottom: 175,
                left: 90,
                child: Container(
                  // alignment: Alignment.center,
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/muzdalifah.jpg'))),
                  // color: Colors.pink,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  new MuzdalifahDetailsPage()));
                    },
                    padding: EdgeInsets.only(top: 85),
                    child: Text('Muzdalifah'),
                  ),
                ),
              ),
              Positioned(
                top: 230,
                left: 40,
                child: Container(
                    // alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    // color: Colors.black,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/mina.jpg'))),
                    child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      new MinaDetailsPage()));
                        },
                        padding: EdgeInsets.only(top: 85),
                        child: Text('Mina'))),
              ),
            ],
          ),
        ));
  }
}

class MiqatDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 120, 20, 1),
          title: Text("Miqat Details"),
          centerTitle: true,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                child: Image.asset('assets/miqat.jpg'),
              ),
              Positioned(
                top: 250,
                left: 10,
                right: 10,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                'Miqat',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    height: 1.2),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Flexible(
                                child: Text(
                              'Miqat is a place where... Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas nec mauris blandit, fermentum diam a, fermentum nisi. Curabitur aliquam purus ac cursus lacinia. Suspendisse mattis imperdiet sapien, non sagittis nulla vulputate in.',
                              style: TextStyle(height: 2),
                            )),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Flexible(
                                child: Text('For more information, refer: ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        height: 2.5)))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              child: Container(
                                  width: 100,
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Text(
                                    'Week 1',
                                    textAlign: TextAlign.center,
                                  )),
                              onTap: () {
                                launch(
                                    'https://prod-th-assets.s3.ap-southeast-1.amazonaws.com/pdf/tab-content/0/2019-12-19/KAH_Minggu%201_compressed.pdf?G8ht_IqMV8x0fqXimgs6UiW4f_hVNmj9=');
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class MakkahDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 120, 20, 1),
          title: Text("Makkah Details"),
          centerTitle: true,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                child: Image.asset('assets/kaabah.png'),
              ),
              Positioned(
                top: 250,
                left: 10,
                right: 10,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                'Makkah',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    height: 1.2),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Flexible(
                                child: Text(
                              'Makkah is a place where... Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas nec mauris blandit, fermentum diam a, fermentum nisi. Curabitur aliquam purus ac cursus lacinia. Suspendisse mattis imperdiet sapien, non sagittis nulla vulputate in.',
                              style: TextStyle(height: 2),
                            )),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Flexible(
                                child: Text('For more information, refer: ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        height: 2.5)))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              child: Container(
                                  width: 100,
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Text(
                                    'Week 1',
                                    textAlign: TextAlign.center,
                                  )),
                              onTap: () {
                                launch(
                                    'https://prod-th-assets.s3.ap-southeast-1.amazonaws.com/pdf/tab-content/0/2019-12-19/KAH_Minggu%201_compressed.pdf?G8ht_IqMV8x0fqXimgs6UiW4f_hVNmj9=');
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class ArafahDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 120, 20, 1),
          title: Text("Arafah Details"),
          centerTitle: true,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                child: Image.asset('assets/arafah.jpg'),
              ),
              Positioned(
                top: 250,
                left: 10,
                right: 10,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                'Arafah',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    height: 1.2),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Flexible(
                                child: Text(
                              'Arafah is a place where... Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas nec mauris blandit, fermentum diam a, fermentum nisi. Curabitur aliquam purus ac cursus lacinia. Suspendisse mattis imperdiet sapien, non sagittis nulla vulputate in.',
                              style: TextStyle(height: 2),
                            )),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Flexible(
                                child: Text('For more information, refer: ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        height: 2.5)))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              child: Container(
                                  width: 100,
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Text(
                                    'Week 1',
                                    textAlign: TextAlign.center,
                                  )),
                              onTap: () {
                                launch(
                                    'https://prod-th-assets.s3.ap-southeast-1.amazonaws.com/pdf/tab-content/0/2019-12-19/KAH_Minggu%201_compressed.pdf?G8ht_IqMV8x0fqXimgs6UiW4f_hVNmj9=');
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class MuzdalifahDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 120, 20, 1),
          title: Text("Muzdalifah Details"),
          centerTitle: true,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                child: Image.asset('assets/muzdalifah.jpg'),
              ),
              Positioned(
                top: 250,
                left: 10,
                right: 10,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                'Muzdalifah',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    height: 1.2),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Flexible(
                                child: Text(
                              'Muzdalifah is a place where... Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas nec mauris blandit, fermentum diam a, fermentum nisi. Curabitur aliquam purus ac cursus lacinia. Suspendisse mattis imperdiet sapien, non sagittis nulla vulputate in.',
                              style: TextStyle(height: 2),
                            )),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Flexible(
                                child: Text('For more information, refer: ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        height: 2.5)))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              child: Container(
                                  width: 100,
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Text(
                                    'Week 1',
                                    textAlign: TextAlign.center,
                                  )),
                              onTap: () {
                                launch(
                                    'https://prod-th-assets.s3.ap-southeast-1.amazonaws.com/pdf/tab-content/0/2019-12-19/KAH_Minggu%201_compressed.pdf?G8ht_IqMV8x0fqXimgs6UiW4f_hVNmj9=');
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class MinaDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 120, 20, 1),
          title: Text("Mina Details"),
          centerTitle: true,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                child: Image.asset('assets/mina.jpg'),
              ),
              Positioned(
                top: 250,
                left: 10,
                right: 10,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                'Mina',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    height: 1.2),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Flexible(
                                child: Text(
                              'Mina is a place where... Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas nec mauris blandit, fermentum diam a, fermentum nisi. Curabitur aliquam purus ac cursus lacinia. Suspendisse mattis imperdiet sapien, non sagittis nulla vulputate in.',
                              style: TextStyle(height: 2),
                            )),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Flexible(
                                child: Text('For more information, refer: ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        height: 2.5)))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              child: Container(
                                  width: 100,
                                  padding: EdgeInsets.all(8),
                                  margin: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Text(
                                    'Week 1',
                                    textAlign: TextAlign.center,
                                  )),
                              onTap: () {
                                launch(
                                    'https://prod-th-assets.s3.ap-southeast-1.amazonaws.com/pdf/tab-content/0/2019-12-19/KAH_Minggu%201_compressed.pdf?G8ht_IqMV8x0fqXimgs6UiW4f_hVNmj9=');
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
