//In here first we create the users json model
// To parse this JSON data, do
//

class LoginModel {

  final String usrEmail;
  final String usrPassword;



  LoginModel({

    required this.usrEmail,
    required this.usrPassword
  });

  factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(

    usrEmail: json["usrEmail"],
      usrPassword: json["usrPassword"],

  );


  Map<String, dynamic> toMap() => {

    "usrEmail": usrEmail,
    "usrPassword": usrPassword,

  };
}
