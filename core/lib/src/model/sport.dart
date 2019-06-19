class SportResponse {
  final List<Sport> sports;

  SportResponse(this.sports);

  SportResponse.fromJSON(Map<String, dynamic> json)
      : sports = (json['sports'] as List)
            .map((json) => Sport.fromJSON(json))
            .toList();
}

class Sport {
  final String idSport;
  final String strSport;
  final String strSportThumb;
  final String strSportDescription;

  Sport(this.idSport, this.strSport, this.strSportThumb,
      this.strSportDescription);

  Sport.fromJSON(Map<String, dynamic> json)
      : idSport = json['idSport'],
        strSport = json['strSport'],
        strSportThumb = json['strSportThumb'],
        strSportDescription = json['strSportDescription'];
}
