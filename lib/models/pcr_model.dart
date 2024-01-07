class PcrData {
  String? date;
  String? count;

  PcrData({this.date, this.count});

  factory PcrData.fromJson(Map<String, dynamic> json){
    return PcrData(
      date: json["date"],
      count: json["pcr_count"]
    );
  }

}