import 'package:core/src/model/sport.dart';
import 'package:flutter/material.dart';

class SportCard extends StatelessWidget {
  final Sport sport;

  const SportCard({Key key, @required this.sport}) : super(key: key);

  void _showSnackBar(BuildContext context) =>
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(sport.strSport),
        duration: Duration(milliseconds: 500),
      ));

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.body1;

    return InkWell(
      onTap: () => _showDetail(context),
      child: Hero(
          tag: sport.idSport,
          child: Card(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Stack(
              children: <Widget>[
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Image.network(
                    sport.strSportThumb,
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Opacity(
                    opacity: 0.7,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      constraints: BoxConstraints(maxHeight: 50),
                      color: Colors.blue,
                      child: Text(
                        sport.strSport,
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
