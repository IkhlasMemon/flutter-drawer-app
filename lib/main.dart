import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

final ThemeData kIOSTheme = new ThemeData(
  primaryColor: Colors.grey[100],
  primarySwatch: Colors.orange,
  primaryColorBrightness: Brightness.light,
);

final ThemeData kDefaultTheme = new ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400],
);

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  var routes = <String, WidgetBuilder> {
    AddPhotoActivity.routeName : (BuildContext context) => new AddPhotoActivity(),
  };

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: defaultTargetPlatform == TargetPlatform.iOS
          ? kIOSTheme
          : kDefaultTheme,
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
      routes: routes,
    );
  }
}

class AddPhotoActivity extends StatelessWidget {

  static String routeName = "addphoto";

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Add Photo',
      theme: defaultTargetPlatform == TargetPlatform.iOS
          ? kIOSTheme
          : kDefaultTheme,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Add Photo Activity"),
          elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
        ),
        body: new Center(
          child: new Container(child: new Center(child: new Text("Add Photo Activity"))),
        )
      ) 
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful,
  // meaning that it has a State object (defined below) that contains
  // fields that affect how it looks.

  // This class is the configuration for the state. It holds the
  // values (in this case the title) provided by the parent (in this
  // case the App widget) and used by the build method of the State.
  // Fields in a Widget subclass are always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that
      // something has changed in this State, which causes it to rerun
      // the build method below so that the display can reflect the
      // updated values. If we changed _counter without calling
      // setState(), then the build method would not be called again,
      // and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance
    // as done by the _incrementCounter method above.
    // The Flutter framework has been optimized to make rerunning
    // build methods fast, so that you can just rebuild anything that
    // needs updating rather than having to individually change
    // instances of widgets.
    return new Scaffold(
      drawer: _buildDrawer(),
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that
        // was created by the App.build method, and use it to set
        // our appbar title.
        title: new Text(widget.title),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
      body: new Center(
        child: new Text(
          'Button tapped $_counter time${ _counter == 1 ? '' : 's' }.',
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Drawer _buildDrawer() {
    var fontFamily = "Roboto";
    var accountEmail = new Text(
      "dnsoftindia@gmail.com", 
      style: new TextStyle(
        color: Theme.of(context).accentColor,
        fontSize: 14.0,
        fontFamily: fontFamily
      )
    );
    var accountName = new Text(
      "DN Soft India", 
      style: new TextStyle(
        color: Theme.of(context).accentColor,
        fontSize: 18.0,
        fontFamily: fontFamily
      )
    );
    var accountPicture = new CircleAvatar(
      child: new Icon(Icons.person_outline), 
      backgroundColor: Theme.of(context).accentColor
    );

    var header = new UserAccountsDrawerHeader(
      accountEmail: accountEmail, 
      accountName: accountName, 
      currentAccountPicture: accountPicture,
      decoration: new BoxDecoration(
        color: Theme.of(context).cardColor
      ),
    );

    var tileItem1 = new ListTile(
      leading: new Icon(Icons.add_a_photo),
      title: new Text("Add Photo"),
      subtitle: new Text("Add a photo to your album"),
      onTap: _onTap
    );

    var listView = new ListView(children: [header, tileItem1]);
    
    var drawer = new Drawer(child: listView);

    return drawer;
  }

  void _onTap() {
    Navigator.popAndPushNamed(context, AddPhotoActivity.routeName);

  }
}
