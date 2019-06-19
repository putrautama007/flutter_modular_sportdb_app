class LeaguesResponse {
  final List<Leagues> leangues;

  LeaguesResponse(this.leangues);

  LeaguesResponse.fromJSON(Map<String, dynamic> json)
      : leangues = (json['leagues'] as List)
            .map((json) => Leagues.fromJSON(json))
            .toList();
}

class Leagues {
  final String idLeague;
  final String strLeague;
  final String strSport;
  final String strLeagueAlternate;

  Leagues(
      this.idLeague, this.strLeague, this.strSport, this.strLeagueAlternate);

  Leagues.fromJSON(Map<String, dynamic> json)
      : idLeague = json['idLeague'],
        strLeague = json['strLeague'],
        strSport = json['strSport'],
        strLeagueAlternate = json['strLeagueAlternate'];
}
