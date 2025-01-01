//In here first we create the users json model
// To parse this JSON data, do
//

class Users {
  final int? usrId;
  final String usrName;
  final String usrPassword;
  final String university;
  final String specility;
  final String usrEmail;
  final String usrCurrentworkplace;


  Users({
    this.usrId,
    required this.usrName,
    required this.usrPassword,
    required this.university,
    required this.specility,
    required this.usrEmail,
    required this.usrCurrentworkplace,

  });

  factory Users.fromMap(Map<String, dynamic> json) => Users(
        usrId: json["usrId"],
        usrName: json["usrName"],
        usrPassword: json["usrPassword"],
        university: json["university"],
        specility: json["specility"],
        usrEmail: json["usrEmail"],
        usrCurrentworkplace: json["usrCurrentworkplace"]
      );


Map<String, dynamic> toMap() => {
        "usrId": usrId,
        "usrName": usrName,
        "usrPassword": usrPassword,
        "university":university,
        "specility":specility,
        "usrEmail":usrEmail,
        "usrCurrentworkplace":usrCurrentworkplace,
      };
}
