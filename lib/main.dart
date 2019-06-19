import 'package:flutter/material.dart';
import 'package:core/core.dart';
import 'package:flutter_modular_sportdb_app/src/di/depedency_injection.dart';
import 'package:flutter_modular_sportdb_app/src/ui/sport_list_page.dart';
import 'package:flutter_modular_sportdb_app/src/ui/leangues_list_page.dart';

void main() {
  Injection.initInjection();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static SportBloc sportBloc = Injection.injector.get<SportBloc>();
  static LeaguesBloc leanguesBloc = Injection.injector.get<LeaguesBloc>();

  int _selectedIndex = 0;

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOptions = <Widget>[
    SportList(sportBloc,'all_sports.php'),
    LeaguesList(leanguesBloc,'all_leagues.php'),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
    super.dispose();
    sportBloc.dispose();
    leanguesBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.brightness_1),
              title: Text('Sport')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.radio_button_unchecked),
              title: Text('Leangues')
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
