import 'package:core/src/bloc/sport_bloc.dart';
import 'package:flutter_modular_sportdb_app/src/ui/base_sport_list_page.dart';

class SportList extends SportListPage{
  SportList(SportBloc sportBloc, String sport) : super(sportBloc, sport);

}