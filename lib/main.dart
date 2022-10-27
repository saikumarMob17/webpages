import 'package:flutter/material.dart';
import 'package:web_example/register_web_view.dart';

import 'package:webviewx/webviewx.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const MyHomePage(title: "Test"),
        // When navigating to the "/second" route, build the SecondScreen widget.
       // '/second': (context) => const Page2(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late WebViewXController webviewController;

  Size get screenSize =>
      MediaQuery
          .of(context)
          .size;



  @override
  void dispose() {
    webviewController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildWebViewX()),
    );
  }

  Widget _buildWebViewX() {
    return WebViewX(
      initialContent: "http://myapps.microsoft.com/signin/b2c334c9-ea36-4334-8fcd-e3799bea5f5c?tenantId=5dd1c36f-33e4-4f0d-8a29-57668521c2a0",
      height: screenSize.height,
      width: screenSize.width,
      initialSourceType: SourceType.urlBypass,
      javascriptMode: JavascriptMode.unrestricted,
      onPageStarted: (url){
        debugPrint("Loaded url is -->$url");
      },
      onPageFinished: (url){
        //Navigator.pushNamed(context, "/second");
        debugPrint("Loaded1 url is -->$url");
        _getAuthCode(url);
      },
   /*   onWebViewCreated: (controller) {
        webviewController = controller;
        webviewController.loadContent(
          // 'https://youinroll.com',
          'https://flutter.dev',
          SourceType.urlBypass,
        );
      },*/
    );
  }

  Future<void> _getAuthCode(String url) async {

    // Wait for the web view to redirect after successful authentication then parse the code from the redirect url.
    // It then uses the code from the previous step to POST to the token endpoint.
    //Check that the web view has loaded the page before continuing
    Uri response = Uri.dataFromString(url);
    print("response.path------> ${response.path}");
    //Check that the user is past authentication and current URL is the redirect with the code.
    if(response.path.contains("https://mail.google.com/mail/&ogbl") ) {
      //iOS does not get to this part. Only on android does the webview go to the redirect URI.
      //iOS shows the loading dots at the top of the screen and hangs there indefinitely.
      print("Webview has redirected");

    }
  }
}


class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  String myurl = Uri.base.toString(); //get complete url
  // String? para1 = Uri.base.queryParameters["para1"]; //get parameter with attribute "para1"
  // String? para2 = Uri.base.queryParameters["para2"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children:[
            Text("Url=${myurl}?length=3.14&bredth=5.54"),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("BACK"))
          ],
        ),
      ),
    );
  }
}
