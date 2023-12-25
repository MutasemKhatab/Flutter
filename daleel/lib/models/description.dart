class Description {
  Description(
      {required this.id,
      required this.name,
      required this.orders,
      this.category,this.phones,
      this.descs,
      this.coords});
  factory Description.fromJSON(Map<String, dynamic> data) {
    final dataPhones = <String>[];
    for (var i = 0; i < 6; i++) {
      if (data['phone$i'] != null) {
        if (data['phone$i'] != '') {
          dataPhones.add(data['phone$i']);
        }
      }
    }
    final dataDescs = <String>[];
    for (var i = 0; i < 6; i++) {
      if (data['desc$i'] != null) {
        if (data['desc$i'] != '') {
          dataDescs.add(data['desc$i']);
        }
      }
    }
    final dataCoords = <String>[];
    for (var i = 0; i < 6; i++) {
      if (data['coord$i'] != null) {
        if (data['coord$i'].isNotEmpty) {
          dataCoords.add(data['coord$i']);
        }
      }
    }
    return Description(
        id: data['id'],
        name: data['name'],
        orders: data['orders'],
        category: data['cat'],
        phones: dataPhones,
        descs: dataDescs,
        coords: dataCoords);
  }
  String id;
  String name;
  String orders;
  String? category;
  List<String>? phones;
  List<String>? descs;
  List<String>? coords;
}
