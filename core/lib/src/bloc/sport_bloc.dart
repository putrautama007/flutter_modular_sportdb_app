import 'package:core/core.dart';
import 'package:core/src/domain/interactors/get_sports_use_case.dart';
import 'package:core/src/model/sport.dart';
import 'package:rxdart/rxdart.dart';

class SportBloc extends BaseBloc{
  final GetSportsUseCase _getSportsUseCase;

  final BehaviorSubject<String> _sport = BehaviorSubject();

  Sink<String> get setSport => _sport.sink;
  Stream<String> get sport => _sport.stream;

  SportBloc(this._getSportsUseCase){
    sport.listen((sport) => _getSportsUseCase.execute(params: sport));

    _getSportsUseCase.errorMessage
    .listen((errorMessage) => error.add(errorMessage));
  }

  Stream<List<Sport>> get getSports => _getSportsUseCase.sports;

  @override
  void dispose() {
    super.dispose();
    _getSportsUseCase.dispose();
    _sport.close();
  }
}