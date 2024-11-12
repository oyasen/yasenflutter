class SignUpModel
{
  Map<String,dynamic>? data;
  bool? status = false;
  String? message = "";
  SignUpModel({required this.data,this.message,this.status});
  factory SignUpModel.fromjson(Map<String,dynamic> json)
  {
    return SignUpModel(data: json["data"],status: json["status"],message: json["message"]);
  }
  static Map<String,dynamic>? tojson(SignUpModel user)
  {
    return user.data;
  }
}