import 'package:offstage_common_bnv/models/boolean_model.dart';
import 'package:offstage_common_bnv/models/employee_model.dart';
import 'package:offstage_common_bnv/services/service.dart';
import 'package:offstage_common_bnv/utils/dialogs/popup.dart';

class CallAPIs {
  static call<T>(
    Future<T> api, {
    bool showError = true,
    void Function(T)? onSuccess,
    void Function(T)? onError,
  }) async {
    final dynamic response = await api;
    if (response != null && response.status != null) {
      if (response.status == true) {
        onSuccess?.call(response);
      } else if (response.status == false) {
        if (showError) {
          Popup.error(response.message);
        }
        onError?.call(response);
      } else {
        Popup.error("Status isn't boolean : ${response.message}");
        onError?.call(response);
      }
    } else {
      Popup.error('response is null');
      onError?.call(response);
    }
  }
}

class APIs extends CallAPIs {
  static Future<RepoEmployee?> signIn(Map<String, dynamic> body) async {
    try {
      final response = await Service.post('/signIn.php', body);
      return RepoEmployee.fromJson(response);
    } catch (e) {
      return RepoEmployee(message: '$e');
    }
  }

  static Future<RepoBoolean?> signUp(Map<String, dynamic> body) async {
    try {
      final response = await Service.post('/signUp.php', body);
      return RepoBoolean.fromJson(response);
    } catch (e) {
      return RepoBoolean(message: '$e');
    }
  }

  static Future<RepoEmployees?> getEmployees(Map<String, dynamic> body) async {
    try {
      final response =
          await Service.post('/getEmployeeWithoutMySelf.php', body);
      return RepoEmployees.fromJson(response);
    } catch (e) {
      return RepoEmployees(message: '$e');
    }
  }

  static Future<RepoBoolean?> deleteEmployee(Map<String, dynamic> body) async {
    try {
      final response = await Service.post('/deleteEmployee.php', body);
      return RepoBoolean.fromJson(response);
    } catch (e) {
      return RepoBoolean(message: '$e');
    }
  }

  static Future<RepoBoolean?> editEmployee(Map<String, dynamic> body) async {
    try {
      final response = await Service.post('/editEmployeeWhereId.php', body);
      return RepoBoolean.fromJson(response);
    } catch (e) {
      return RepoBoolean(message: '$e');
    }
  }
}
