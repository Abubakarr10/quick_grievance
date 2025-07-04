
class ComplaintModel{
  final String uid,fullName,regNo,phoneNo,roomNo;
  final String complaintType,description,priority;
  final String assistantMessage;
  final String submitDate;
  final String image;
  final String status;

  const ComplaintModel(
      {
        required this.uid,
        required this.fullName,
        required this.regNo,
        required this.phoneNo,
        required this.roomNo,

        required this.complaintType,
        required this.description,
        required this.priority,

        required this.image,

        required this.assistantMessage,
        required this.status,

        required this.submitDate,
      });

  Map<String,dynamic> toJson(){
    return {
      'uid' : uid,
      'full_name' : fullName,
      'reg_no' : regNo,
      'phone_no' : phoneNo,
      'room_no' : roomNo,
      'image' : image,

      'complaintType' : complaintType,
      'description' : description,
      'priority' : priority,
      'assistantMessage' : assistantMessage,
      'status' : status,

      'submitDate' : submitDate,


    };
  }

  factory ComplaintModel.fromJson(Map<String, dynamic> json){
    return ComplaintModel(
      uid: json['uid'],
      fullName: json['full_name'],
      regNo: json['reg_no'],
      phoneNo: json['phone_no'],
      roomNo: json['room_no'],
      complaintType: json['complaintType'],
      description: json['description'],
      priority: json['priority'],
      assistantMessage: json['assistantMessage'],
      image: json['image'] ?? '',
      status: json['status'] ?? '',
      submitDate: json['submitDate'],
    );
  }
}