import 'package:core/core.dart';
import 'package:core/src/domain/interactors/get_leanguess_use_case.dart';
import 'package:core/src/model/leagues.dart';
import 'package:rxdart/rxdart.dart';

class LeaguesBloc extends BaseBloc{
  final GetLeaguesUseCase _getLeaguesUseCase;

  final BehaviorSubject<String> _leagues = BehaviorSubject();

  Sink<String> get setLeagues => _leagues.sink;
  Stream<String> get leagues => _leagues.stream;

  LeaguesBloc(this._getLeaguesUseCase){
    leagues.listen((leagues) => _getLeaguesUseCase.execute(params: leagues));

    _getLeaguesUseCase.errorMessage
    .listen((errorMessage) => error.add(errorMessage));
  }

  Stream<List<Leagues>> get getLeagues => _getLeaguesUseCase.leagues;

  @override
  void dispose() {
    super.dispose();
    _getLeaguesUseCase.dispose();
    _leagues.close();
  }
}