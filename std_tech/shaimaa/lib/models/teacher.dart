class Teacher {
  final String id,
      name,
      number,
      qualification,
      location,
      save,
      holidays,
      boysNum,
      girlsNum,
      martialStatus;
  const Teacher(
      {this.id='',
      this.name='',
      this.number='',
      this.qualification='',
      this.location='',
      this.save='',
      this.holidays='',
      this.boysNum='',
      this.girlsNum='',
      this.martialStatus=''});

  factory Teacher.fromJson(Map<String, dynamic> json, String docID) {
    return Teacher(
      id: docID,
      name: json['name'],
      number: json['number'],
      qualification: json['qualification'],
      location: json['location'],
      save: json['save'],
      holidays: json['holidays'],
      boysNum: json['boysNum'],
      girlsNum: json['girlsNum'],
      martialStatus: json['martialStatus'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'number': number,
      'qualification': qualification,
      'location': location,
      'save': save,
      'holidays': holidays,
      'boysNum': boysNum,
      'girlsNum': girlsNum,
      'martialStatus': martialStatus,
    };
  }
}
