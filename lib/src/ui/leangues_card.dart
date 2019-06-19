import 'package:core/src/model/leagues.dart';
import 'package:flutter/material.dart';

class LeanguesCard extends StatelessWidget{
  final Leagues leagues;

  const LeanguesCard({Key key, @required this.leagues}) :super(key : key);

  void _showSnackBar(BuildContext context) =>
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(leagues.strLeague),
        duration: Duration(milliseconds: 500),
      ));

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.body1;

    return InkWell(
      onTap: () => _showDetail(context),
      child: Hero(
          tag: leagues.idLeague,
          child: Card(
            elevation: 10,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Opacity(
                    opacity: 0.7,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      constraints: BoxConstraints(maxHeight: 170),
                      color: Colors.blue,
                      child: Text(
                        leagues.strLeague,
                        textAlign: TextAlign.center,
                        style: textStyle.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
  void _showDetail(BuildContext context) {
    _showSnackBar(context);
//    Future.delayed(Duration(milliseconds: 500)).then((_) {
//      Navigator.of(context).push(
//        MaterialPageRoute(
//          builder: (BuildContext context) => RecipeDetailPage(meal: meal),
//        ),
//      );
//    });
  }
}