import 'package:core/core.dart';
import 'package:core/src/domain/repositories/sport_repository.dart';
import 'package:core/src/model/leagues.dart';
import 'package:rxdart/rxdart.dart';

class GetLeaguesUseCase extends UseCase<SportRepository, String>{
  final BehaviorSubject<List<Leagues>> _leagues = BehaviorSubject();
  final BehaviorSubject<String> _errorMessage = BehaviorSubject();

  GetLeaguesUseCase(SportRepository repository) : super(repository);

  Stream<List<Leagues>> get leagues => _leagues.stream;
  Stream<String> get errorMessage => _errorMessage.stream;

  @override
  void dispose() {
    _leagues.close();
    _errorMessage.close();
  }

  @override
  void execute({String params}) {
    repository.getLeagues(params).listen((leagues) => _leagues.sink.add(leagues),
    onError: (error) => _errorMessage.sink.add(error.toString()));
  }

}