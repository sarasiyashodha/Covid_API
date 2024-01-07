class CovidDataModel {
  int? totalDeaths;
  int? totalRecovered;
  int? totalCases;
  int? activeCases;

  CovidDataModel({this.totalDeaths, this.totalRecovered, this.totalCases, this.activeCases});

  factory CovidDataModel.fromJson(Map<String, dynamic> json){
    return CovidDataModel(
    totalDeaths: json["local_deaths"],
    activeCases: json["local_recovered"],
  totalCases: json["local_total_cases"],
  totalRecovered: json["local_recovered"]


    );

  }

}