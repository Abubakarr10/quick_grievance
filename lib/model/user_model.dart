
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  final String uid,email,fullName,password,regNo,phoneNo,roomNo,batch,departmentName,degree;
  final bool isAuthorized;

  const UserModel(
      {
        required this.uid,
        required this.email,
        required this.fullName,
        required this.password,
        required this.regNo,
        required this.phoneNo,
        required this.roomNo,
        required this.batch,
        required this.departmentName,
        required this.isAuthorized,
        required this.degree,
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
      'batch' : batch,
      'department_name' : departmentName,
      'degree' : degree,
      'isAuthorized' : isAuthorized
    };
  }

  factory UserModel.fromFirestore(DocumentSnapshot doc){
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      uid:  data['uid'] ?? '',
      email: data['email'] ?? '',
      fullName: data['full_name'] ?? '',
      password: data['password'] ?? '',
      regNo: data['reg_no'] ?? '',
      phoneNo: data['phone_no'] ?? '',
      roomNo: data['room_no'] ?? '',
      batch: data['batch'] ?? '',
      isAuthorized: data['isAuthorized'] ?? '',
      departmentName: data['department_name'] ?? '',
      degree: data['degree'] ?? '',
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      fullName: json['full_name'],
      email: json['email'],
      password: json['password'],
      regNo: json['regNo'],
      phoneNo: json['phoneNo'],
      roomNo: json['roomNo'],
      batch: json['batch'],
      departmentName: json['departmentName'],
      isAuthorized: json['isAuthorized'],
      degree: json['degree'],
    );
  }
  }