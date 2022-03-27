// To parse this JSON data, do
//
//     final wordgame = wordgameFromJson(jsonString);

import 'dart:convert';

Wordgame wordgameFromJson(String str) => Wordgame.fromJson(json.decode(str));

String wordgameToJson(Wordgame data) => json.encode(data.toJson());

class Wordgame {
  Wordgame({
    required this.status,
    this.message,
    required this.data,
  });

  String status;
  dynamic message;
  List<Datum> data;

  factory Wordgame.fromJson(Map<String, dynamic> json) => Wordgame(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.imageUrl,
    required this.answer,
    required this.choiceList,
  });

  String imageUrl;
  int answer;
  List<String> choiceList;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    imageUrl: json["image_url"],
    answer: json["answer"],
    choiceList: List<String>.from(json["choice_list"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "image_url": imageUrl,
    "answer": answer,
    "choice_list": List<dynamic>.from(choiceList.map((x) => x)),
  };
}
