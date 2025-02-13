
class UserModel{
  final String uid,email,fullName,password,regNo,phoneNo,roomNo,departmentName;
  const UserModel(
      {
        required this.uid,
        required this.email,
        required this.fullName,
        required this.password,
        required this.regNo,
        required this.phoneNo,
        required this.roomNo,
        required this.departmentName,
      });

  Map<String,dynamic> toJson(){
    return {
      'uid' : uid,
      'email' : email,
      'full_name' : fullName,
      'password' : password,
      'reg_no' : regNo,
      'phone_no' : phoneNo,
      'room_no' : roomNo,
      'department_name' : departmentName,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      uid: json['uid'],
      email: json['email'],
      fullName: json['full_name'],
      password: json['password'],
      regNo: json['reg_no'],
      phoneNo: json['phone_no'],
      roomNo: json['room_no'],
      departmentName: json['department_name'],
    );
  }
}