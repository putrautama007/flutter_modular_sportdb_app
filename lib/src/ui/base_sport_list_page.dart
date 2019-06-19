import 'package:core/core.dart';
import 'package:core/src/model/sport.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular_sportdb_app/src/ui/sport_card.dart';

class SportListPage extends StatefulWidget{
  final SportBloc sportBloc;
  final String sport;

  SportListPage(this.sportBloc,this.sport,{Key key}) : super(key:key);

  @override
  State<StatefulWidget> createState() => _SportListPageState();


}

class _SportListPageState extends State<SportListPage>{

  @override
  void initState() {
    super.initState();
    widget.sportBloc.setSport.add(widget.sport);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('SPORT'),
            Icon(Icons.radio_button_unchecked),
            Text('PEDIA'),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: StreamBuilder(
            stream: widget.sportBloc.errorStream,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (!snapshot.hasData) return _streamSport();

              return Center(child: Text(snapshot.data));
            }),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _streamSport() =>
      StreamBuilder(
          stream: widget.sportBloc.getSports,
          builder: (BuildContext context,
              AsyncSnapshot<List<Sport>> snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());

            return GridView.count(
              padding: const EdgeInsets.all(16),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              crossAxisCount: 2,
              children:
              snapshot.data.map((sport) => SportCard(sport: sport)).toList(),
            );
          });
}