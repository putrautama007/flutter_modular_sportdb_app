import 'package:core/src/model/sport.dart';
import 'package:core/src/model/leagues.dart';
import 'package:rxdart/rxdart.dart';

abstract class SportRepository{
  Observable<List<Sport>> getSport(String sport);
  Observable<List<Leagues>> getLeagues(String leagues);
}