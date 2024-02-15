// To parse this JSON data, do
//
//     final universityModel = universityModelFromJson(jsonString);

import 'dart:convert';

List<UniversityModel> universityModelFromJson(String str) =>
    List<UniversityModel>.from(
        json.decode(str).map((x) => UniversityModel.fromJson(x)));

String universityModelToJson(List<UniversityModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UniversityModel {
  AlphaTwoCode? alphaTwoCode;
  List<String>? webPages;
  String? name;
  List<String>? domains;
  Country? country;
  String? stateProvince;

  UniversityModel({
    this.alphaTwoCode,
    this.webPages,
    this.name,
    this.domains,
    this.country,
    this.stateProvince,
  });

  factory UniversityModel.fromJson(Map<String, dynamic> json) =>
      UniversityModel(
        alphaTwoCode: alphaTwoCodeValues.map[json["alpha_two_code"]]!,
        webPages: json["web_pages"] == null
            ? []
            : List<String>.from(json["web_pages"]!.map((x) => x)),
        name: json["name"],
        domains: json["domains"] == null
            ? []
            : List<String>.from(json["domains"]!.map((x) => x)),
        country: countryValues.map[json["country"]]!,
        stateProvince: json["state-province"],
      );

  Map<String, dynamic> toJson() => {
        "alpha_two_code": alphaTwoCodeValues.reverse[alphaTwoCode],
        "web_pages":
            webPages == null ? [] : List<dynamic>.from(webPages!.map((x) => x)),
        "name": name,
        "domains":
            domains == null ? [] : List<dynamic>.from(domains!.map((x) => x)),
        "country": countryValues.reverse[country],
        "state-province": stateProvince,
      };
}

enum AlphaTwoCode { US }

final alphaTwoCodeValues = EnumValues({"US": AlphaTwoCode.US});

enum Country { UNITED_STATES }

final countryValues = EnumValues({"United States": Country.UNITED_STATES});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
