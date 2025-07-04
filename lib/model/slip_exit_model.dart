
class SlipExitModel{
  final String uid,fullName,regNo,phoneNo,roomNo,batch,departmentName;
  final String guardianName,relation,guardianPhoneNo,address,destination;
  final String reason,token;
  final String fromDate,toDate;
  const SlipExitModel(
      {
        required this.uid,
        required this.fullName,
        required this.regNo,
        required this.phoneNo,
        required this.roomNo,
        required this.token,
        required this.batch,
        required this.departmentName,

        required this.guardianName,
        required this.relation,
        required this.guardianPhoneNo,
        required this.address,
        required this.destination,

        required this.reason,
        required this.fromDate,
        required this.toDate,
      });

  Map<String,dynamic> toJson(){
    return {
      'uid' : uid,
      'full_name' : fullName,
      'reg_no' : regNo,
      'phone_no' : phoneNo,
      'room_no' : roomNo,
      'token' : token,
      'batch' : batch,
      'departmentName' : departmentName,

      'guardianName' : guardianName,
      'relation' : relation,
      'guardianPhoneNo' : guardianPhoneNo,
      'address' : address,
      'destination' : destination,

      'reason' : reason,
      'fromDate' : fromDate,
      'toDate' : toDate,


    };
  }

  factory SlipExitModel.fromJson(Map<String, dynamic> json){
    return SlipExitModel(
      uid: json['uid'],
      fullName: json['full_name'],
      regNo: json['reg_no'],
      phoneNo: json['phone_no'],
      roomNo: json['room_no'],
      token: json['token'],
      guardianName: json['guardianName'],
      relation: json['relation'],
      guardianPhoneNo: json['guardianPhoneNo'],
      address: json['address'],
      destination: json['destination'],
      reason: json['reason'],
      fromDate: json['fromDate'],
      toDate: json['toDate'],
      batch: json['batch'],
      departmentName: json['departmentName'],
    );
  }
}