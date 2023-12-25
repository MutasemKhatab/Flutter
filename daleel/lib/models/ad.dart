class Ad {
  Ad({
    required this.id,
    required this.name,
    required this.url,
    required this.expired,
    required this.phone,
    required this.whatsapp,
    required this.snapchat,
    required this.instgram,
    required this.twitter,
    required this.icon,
    required this.image,
  });
  factory Ad.fromJSON(Map<String, dynamic> data) {
    return Ad(
        image: data['imgurl'],
        icon: data['iconurl'],
        id: data['id'],
        name: data['sname'],
        url: data['url'],
        expired: data['expired'],
        phone: data['phone'],
        whatsapp: data['whatsapp'],
        snapchat: data['snapchat'],
        instgram: data['instagram'],
        twitter: data['twitter']);
  }
  String id;
  String name;
  String url;
  String image;
  String icon;
  String expired;
  String phone;
  String whatsapp;
  String snapchat;
  String instgram;
  String twitter;
}
