class GameItem {

  final String imageUrl;
  final int answer;
  final List<String> choiceList;

  GameItem({
    required this.imageUrl,
    required this.answer,
    required this.choiceList,
  });

  factory GameItem.fromJson(Map<String, dynamic> json) {
    return GameItem(
      imageUrl: json["image_url"],
      answer: json["answer"],
      choiceList: List<String>.from(json["choice_list"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "image_url": imageUrl,
    "answer": answer,
    "choice_list": List<dynamic>.from(choiceList.map((x) => x)),
  };


  @override
  String toString() {
    return '$answer: $choiceList ';
  }
}