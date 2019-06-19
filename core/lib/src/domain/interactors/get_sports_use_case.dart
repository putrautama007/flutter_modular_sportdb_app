import 'package:core/core.dart';
import 'package:core/src/domain/repositories/sport_repository.dart';
import 'package:core/src/model/sport.dart';
import 'package:rxdart/rxdart.dart';

class GetSportsUseCase extends UseCase<SportRepository, String>{
  final BehaviorSubject<List<Sport>> _sports = BehaviorSubject();
  final BehaviorSubject<String> _errorMessage = BehaviorSubject();

  GetSportsUseCase(SportRepository repository) : super(repository);

  Stream<List<Sport>> get sports => _sports.stream;
  Stream<String> get errorMessage => _errorMessage.stream;

  @override
  void execute({String params}) {
    repository.getSport(params).listen(
        (sports) => _sports.sink.add(sports),
    onError: (error) => _errorMessage.sink.add(error));
  }

  @override
  void dispose() {
    _sports.close();
    _errorMessage.close();
  }


}