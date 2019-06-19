import 'package:core/core.dart';
import 'package:core/src/model/leagues.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular_sportdb_app/src/ui/leangues_card.dart';

class LeanguesListPage extends StatefulWidget{
  final LeaguesBloc leanguesBloc;
  final String leangues;

  LeanguesListPage(this.leanguesBloc,this.leangues,{Key key}) :super(key:key);

  @override
  State<StatefulWidget> createState() => _LeanguesListPageState();

}

class _LeanguesListPageState extends State<LeanguesListPage> {
  @override
  void initState() {
    super.initState();
    widget.leanguesBloc.setLeagues.add(widget.leangues);
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
            stream: widget.leanguesBloc.errorStream,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (!snapshot.hasData) return _streamLeangues();

              return Center(child: Text(snapshot.data));
            }),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _streamLeangues() =>
      StreamBuilder(
          stream: widget.leanguesBloc.getLeagues,
          builder: (BuildContext context,
              AsyncSnapshot<List<Leagues>> snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());

            return GridView.count(
              padding: const EdgeInsets.all(16),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              crossAxisCount: 2,
              children:
              snapshot.data.map((leangues) => LeanguesCard(leagues: leangues)).toList(),
            );
          });
}