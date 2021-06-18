class RepoEmployees {
  bool? status;
  List<Employee>? data;
  String? message;

  RepoEmployees({this.status, this.message});

  RepoEmployees.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    if (json['Data'] != null) {
      data = <Employee>[];
      json['Data'].forEach((v) {
        data!.add(new Employee.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['Message'] = this.message;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RepoEmployee {
  bool? status;
  // List<Employee>? data;
  Employee? data;
  String? message;

  RepoEmployee({this.status, this.data, this.message});

  RepoEmployee.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    data = json['Data'] != null ? Employee.fromJson(json['Data']) : null;
    // if (json['Data'] != null) {
    //   data = <Employee>[];
    //   json['Data'].forEach((v) {
    //     data!.add(new Employee.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Status'] = this.status;
    data['Message'] = this.message;
    if (this.data != null) {
      data['Data'] = this.data!.toJson();
    }
    // if (this.data != null) {
    //   data['Data'] = this.data!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Employee {
  dynamic id;
  String? name;
  String? lastName;
  String? phoneNumber;
  String? password;
  String? createDate;
  String? image;
  String? loginDate;

  Employee(
      {this.id,
      this.name,
      this.lastName,
      this.phoneNumber,
      this.password,
      this.createDate,
      this.image,
      this.loginDate});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    lastName = json['LastName'];
    phoneNumber = json['PhoneNumber'];
    password = json['Password'];
    createDate = json['CreateDate'];
    image = json['Image'];
    loginDate = json['LoginDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Name'] = this.name;
    data['LastName'] = this.lastName;
    data['PhoneNumber'] = this.phoneNumber;
    data['Password'] = this.password;
    data['CreateDate'] = this.createDate;
    data['Image'] = this.image;
    data['LoginDate'] = this.loginDate;
    return data;
  }
}
