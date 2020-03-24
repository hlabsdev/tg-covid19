// To parse this JSON data, do
//
//     final countryDataModel = countryDataModelFromJson(jsonString);

import 'dart:convert';

CountryDataModel countryDataModelFromJson(String str) => CountryDataModel.fromJson(json.decode(str));

String countryDataModelToJson(CountryDataModel data) => json.encode(data.toJson());

class CountryDataModel {
  final List<ContryData> countrydata;
  final List countrynewsitems;

  CountryDataModel({
    this.countrydata,
    this.countrynewsitems,
  });

  factory CountryDataModel.fromJson(Map<String, dynamic> json) => CountryDataModel(
    countrydata: json["results"] == null ? null : List<ContryData>.from(json["results"].map((x) => ContryData.fromJson(x))),
//    countrynewsitems: json["countrynewsitems"] == null ? null : List<ContryNewsItems>.from(json["countrynewsitems"].map((x) => ContryNewsItems.fromJson(x))),
//    countrynewsitems: json["countrynewsitems"] == null ? null : json["stat"],
  );

  Map<String, dynamic> toJson() => {
    "countrydata": countrydata == null ? null : List<dynamic>.from(countrydata.map((x) => x.toJson())),
    "countrynewsitems": countrynewsitems == null ? null : List<dynamic>.from(countrynewsitems.map((x) => x.toJson())),
//    "countrynewsitems": countrynewsitems == null ? null : countrynewsitems,
  };
}
class Info{
  final int ourid;
  final String title;
  final String code;
  final String source;

  Info({
    this.ourid,
    this.title,
    this.code,
    this.source
});

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    ourid: json["ourid"] == null ? null : json["ourid"],
    title: json["title"] == null ? null : json["title"],
    code: json["code"] == null ? null : json["code"],
    source: json["source"] == null ? null : json["source"],
  );

  Map<String, dynamic> toJson() => {
    "ourid": ourid == null ? null : ourid,
    "title": title == null ? null : title,
    "code": code == null ? null : code,
    "source": source == null ? null : source,
  };

}

class ContryNewsItems{

}
class ContryData {
  final List<Info> info;
  final int totalCases;
  final int totalRecovered;
  final int totalUnresolved;
  final int totalDeaths;
  final int totalNewCasesToday;
  final int totalNewDeathsToday;
  final int totalActiveCases;
  final int totalSeriousCases;

  ContryData({
    this.info,
    this.totalCases,
    this.totalRecovered,
    this.totalUnresolved,
    this.totalDeaths,
    this.totalNewCasesToday,
    this.totalNewDeathsToday,
    this.totalActiveCases,
    this.totalSeriousCases,
  });

  factory ContryData.fromJson(Map<String, dynamic> json) => ContryData(
//    info: json["info"] == null ? null : Info.fromJson(json["info"]),
    totalCases: json["total_cases"] == null ? null : json["total_cases"],
    totalRecovered: json["total_recovered"] == null ? null : json["total_recovered"],
    totalUnresolved: json["total_unresolved"] == null ? null : json["total_unresolved"],
    totalDeaths: json["total_deaths"] == null ? null : json["total_deaths"],
    totalNewCasesToday: json["total_new_cases_today"] == null ? null : json["total_new_cases_today"],
    totalNewDeathsToday: json["total_new_deaths_today"] == null ? null : json["total_new_deaths_today"],
    totalActiveCases: json["total_active_cases"] == null ? null : json["total_active_cases"],
    totalSeriousCases: json["total_serious_cases"] == null ? null : json["total_serious_cases"],
  );

  Map<String, dynamic> toJson() => {
    "total_cases": totalCases == null ? null : totalCases,
    "total_recovered": totalRecovered == null ? null : totalRecovered,
    "total_unresolved": totalUnresolved == null ? null : totalUnresolved,
    "total_deaths": totalDeaths == null ? null : totalDeaths,
    "total_new_cases_today": totalNewCasesToday == null ? null : totalNewCasesToday,
    "total_new_deaths_today": totalNewDeathsToday == null ? null : totalNewDeathsToday,
    "total_active_cases": totalActiveCases == null ? null : totalActiveCases,
    "total_serious_cases": totalSeriousCases == null ? null : totalSeriousCases,
//    "source": source == null ? null : source.toJson(),
  };
}
//
//class Info {
//  final String url;
//
//  Source({
//    this.url,
//  });
//
//  factory Source.fromJson(Map<String, dynamic> json) => Source(
//    url: json["url"] == null ? null : json["url"],
//  );
//
//  Map<String, dynamic> toJson() => {
//    "url": url == null ? null : url,
//  };
//}
