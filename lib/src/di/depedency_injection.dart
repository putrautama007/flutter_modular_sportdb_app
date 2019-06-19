import 'package:core/core.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class Injection{
  static Injector injector;

  static void initInjection(){
    injector = Injector.getInjector();

    injector.map<SportRepository>((i) => SportRepositoryImpl());

    injector.map<GetSportsUseCase>((i) => GetSportsUseCase(injector.get<SportRepository>()));

    injector.map<SportBloc>((i) => SportBloc(injector.get<GetSportsUseCase>()),
    isSingleton: false);


    injector.map<GetLeaguesUseCase>((i) => GetLeaguesUseCase(injector.get<SportRepository>()));

    injector.map<LeaguesBloc>((i) => LeaguesBloc(injector.get<GetLeaguesUseCase>()),
    isSingleton: false);
  }
}