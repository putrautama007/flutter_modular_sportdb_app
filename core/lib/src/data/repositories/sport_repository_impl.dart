import 'package:core/src/data/network/sport_network_data_source.dart';
import 'package:core/src/domain/repositories/sport_repository.dart';
import 'package:core/src/model/leagues.dart';
import 'package:core/src/model/sport.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/src/observables/observable.dart';

class SportRepositoryImpl extends SportRepository{
  @override
  Observable<List<Sport>> getSport(String sport) {
    return Observable.fromFuture(
      SportNetworkDataSource().getSport(sport))
    .map((sportResponse) => sportResponse.sports);
  }

  @override
  Observable<List<Leagues>> getLeagues(String leagues) {
    return Observable.fromFuture(
        SportNetworkDataSource().getLeagues(leagues))
    .map((leaguesResponse) => leaguesResponse.leangues);
  }

}