import 'package:covid_api/models/pcr_model.dart';

class CovidDataModel {
  int? totalDeaths;
  int? totalRecovered;
  int? totalCases;
  int? activeCases;
  List<PcrData>? pcrData;

  CovidDataModel({this.totalDeaths, this.totalRecovered, this.totalCases, this.activeCases, this.pcrData});

  factory CovidDataModel.fromJson(Map<String, dynamic> json){
    List<PcrData> pcrDataList = (json["daily_pcr_testing_data"] as List)
    .map((day) => PcrData.fromJson(day))
    .toList();
    return CovidDataModel(
    totalDeaths: json["local_deaths"],
    activeCases: json["local_recovered"],
    totalCases: json["local_total_cases"],
    totalRecovered: json["local_recovered"],
      pcrData: pcrDataList,


    );

  }

}