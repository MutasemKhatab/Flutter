class BtcMarketCap {
  String title;
  String number;
  String change;

  BtcMarketCap({
    required this.title,
    required this.number,
    required this.change,
  });

  factory BtcMarketCap.fromJson(Map<String, dynamic> json) {
    return BtcMarketCap(
      title: json['title'],
      number: json['number'],
      change: json['change'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'number': number,
      'change': change,
    };
  }
}
