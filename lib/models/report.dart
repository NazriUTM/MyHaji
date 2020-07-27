class Report {
  String id;
  String title;
  String desc;
  String status;

  Report({this.id, this.title, this.desc, this.status = 'Pending'});

  Report.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            title: json['title'],
            desc: json['desc'],
            status: json['status']);

  Map<String, dynamic> toJson() =>
      {'title': title, 'desc': desc, 'status': status};

  //Report.copy(Report from) : this(from.title, from.desc, from.status);
}
