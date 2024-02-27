class BtcMartketCap {
  String btcPrice;
  String btcMarketCap;
  String btcTotalVolume;
  String btcChangePercentage;

  
  BtcMartketCap({
    required this.btcPrice,
    required this.btcMarketCap,
    required this.btcTotalVolume,
    required this.btcChangePercentage,
  });

  factory BtcMartketCap.fromJson(Map<String, dynamic> json) {
    return BtcMartketCap(
      btcPrice: json['btcPrice'],
      btcMarketCap: json['btcMarketCap'],
      btcTotalVolume: json['btcTotalVolume'],
      btcChangePercentage: json['btcChangePercentage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'btcPrice': btcPrice,
      'btcMarketCap': btcMarketCap,
      'btcTotalVolume': btcTotalVolume,
      'btcChangePercentage': btcChangePercentage,
    };
  }
  
}
