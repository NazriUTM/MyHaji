class User {
  String id;
  String email;
  String name;
  String phone;
  String group;
  String hajID;
  String mutaName;
  String mutaPhone;
  List reportID;
  List todosID;

  User(
      {this.id,
      this.email,
      this.name,
      this.phone,
      this.group,
      this.hajID,
      this.mutaName,
      this.mutaPhone,
      this.reportID,
      this.todosID});

  User.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            email: json['email'],
            name: json['name'],
            phone: json['phone'],
            group: json['group'],
            hajID: json['hajID'],
            mutaName: json['mutaName'],
            mutaPhone: json['mutaPhone'],
            reportID: json['reportID'],
            todosID: json['todosID']);
  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'phone': phone,
        'group': group,
        'hajID': hajID,
        'mutaName': mutaName,
        'mutaPhone': mutaPhone,
        'reportID': reportID,
        'todosID': todosID
      };
}
