import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GuidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 120, 20, 1),
        title: Text("Guides"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          InkWell(
            child: Container(
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image: new AssetImage('assets/Guides/week1.png'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 150,
            ),
            onTap: () {
              launch(
                  'https://prod-th-assets.s3.ap-southeast-1.amazonaws.com/pdf/tab-content/0/2019-12-19/KAH_Minggu%201_compressed.pdf?G8ht_IqMV8x0fqXimgs6UiW4f_hVNmj9=');
            },
          ),
          Divider(),
          InkWell(
            child: Container(
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image: new AssetImage('assets/Guides/week2.png'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 150,
            ),
            onTap: () {
              launch(
                  'https://prod-th-assets.s3.ap-southeast-1.amazonaws.com/pdf/tab-content/0/2020-01-08/KAH_Minggu%202%20v2.pdf?M4k9rVFzq1k2yv1DBummY74YRQKi5QiJ=');
            },
          ),
          Divider(),
          InkWell(
            child: Container(
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image: new AssetImage('assets/Guides/week3.png'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 150,
            ),
            onTap: () {
              launch(
                  'https://prod-th-assets.s3.ap-southeast-1.amazonaws.com/pdf/tab-content/0/2019-12-20/KAH_Minggu%203_compressed.pdf?wJKC9R8P83Vy93tOx0pu58mcZ0J0THrB=');
            },
          ),
          Divider(),
          InkWell(
            child: Container(
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image: new AssetImage('assets/Guides/week4.png'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 150,
            ),
            onTap: () {
              launch(
                  'https://prod-th-assets.s3.ap-southeast-1.amazonaws.com/pdf/tab-content/0/2019-12-20/KAH_Minggu%204_compressed.pdf?l3RTxnzHsyTYcbNB1Z5RM11VkluUDFtc=');
            },
          ),
          Divider(),
          InkWell(
            child: Container(
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image: new AssetImage('assets/Guides/week5.png'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 150,
            ),
            onTap: () {
              launch(
                  'https://prod-th-assets.s3.ap-southeast-1.amazonaws.com/pdf/tab-content/0/2020-01-10/100120_KAHMinggu%20Ke-lima.pdf?kwo7v5y6YX3oXSplCb5AzJ1JYR1_E9Ar=');
            },
          ),
          Divider(),
          InkWell(
            child: Container(
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image: new AssetImage('assets/Guides/week6.png'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 150,
            ),
            onTap: () {
              launch(
                  'https://prod-th-assets.s3.ap-southeast-1.amazonaws.com/pdf/tab-content/0/2020-02-10/10022020_Minggu%206%20v9.pdf?LVyrO8u9TDGF457mzUKdMCv6Fj38IW5J=');
            },
          ),
          Divider(),
          InkWell(
            child: Container(
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image: new AssetImage('assets/Guides/week7.png'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 150,
            ),
            onTap: () {
              launch(
                  'https://prod-th-assets.s3.ap-southeast-1.amazonaws.com/pdf/tab-content/0/2020-02-10/10022020_Minggu%207%20v9.pdf?pS8k3wIThtG2EUA2UhyToXp_YTH7NsO4=');
            },
          ),
          Divider(),
          InkWell(
            child: Container(
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image: new AssetImage('assets/Guides/week8.png'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 150,
            ),
            onTap: () {
              launch(
                  'https://prod-th-assets.s3.ap-southeast-1.amazonaws.com/pdf/tab-content/0/2020-02-10/10022020_Minggu%208%20v9.pdf?d2OXaFDeKjpp8rGTNHR3PdX4gOs0jkFX=');
            },
          ),
          Divider(),
          InkWell(
            child: Container(
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image: new AssetImage('assets/Guides/week9.png'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 150,
            ),
            onTap: () {
              launch(
                  'https://prod-th-assets.s3.ap-southeast-1.amazonaws.com/pdf/tab-content/0/2020-02-10/10022020_Minggu%209%20v9.pdf?BUWXUsqy5g3UV8J_2Y20qZmjd8HxE7gx=');
            },
          ),
          Divider(),
          InkWell(
            child: Container(
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image: new AssetImage('assets/Guides/week10.png'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 150,
            ),
            onTap: () {
              launch(
                  'https://prod-th-assets.s3.ap-southeast-1.amazonaws.com/pdf/tab-content/0/2020-02-10/10022020_Minggu%2010%20v9.pdf?d5SchCMYk7z7mexZflgQD3lysW1jASAH=');
            },
          ),
        ],
      ),
    );
  }
}
