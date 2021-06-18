class RepoBoolean {
  bool? status;
  String? message;

  RepoBoolean({this.status, this.message});

  RepoBoolean.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['Message'] = this.message;
    return data;
  }
}
