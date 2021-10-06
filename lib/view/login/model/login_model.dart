class LoginModel {
  String? token;
  String? msg;
  String? status;

  LoginModel({
    this.token,
    this.msg,
    this.status,
  });
  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    msg = json['msg'];
    status = json['status'];
  }
}
