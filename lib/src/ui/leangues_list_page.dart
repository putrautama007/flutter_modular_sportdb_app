import 'package:core/src/bloc/leangues_bloc.dart';
import 'package:flutter_modular_sportdb_app/src/ui/base_leangues_list_page.dart';

class LeaguesList extends LeanguesListPage{
  LeaguesList(LeaguesBloc leaguesBloc, String leagues) : super(leaguesBloc, leagues);

}