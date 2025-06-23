class PostModel{
  final String uid,fullName,regNo,departmentName;
  final String captions;
  final String postImage;
  final String postDate;
  final List<dynamic> likes;
  const PostModel(
      {
        required this.uid,
        required this.fullName,
        required this.regNo,
        required this.departmentName,

        required this.captions,
        required this.postDate,
        required this.postImage,

        required this.likes
      });

  Map<String,dynamic> toJson(){
    return {
      'uid' : uid,
      'full_name' : fullName,
      'reg_no' : regNo,
      'department_name' : departmentName,
      'captions' : captions,
      'post_date' : postDate,
      'post_image' : postImage,
      'likes' : likes
    };
  }

  factory PostModel.fromJson(Map<String, dynamic> json){
    return PostModel(
      uid: json['uid'],
      fullName: json['full_name'],
      regNo: json['reg_no'],
      departmentName: json['department_name'],
      captions: json['captions'],
      postDate: json['post_date'],
      postImage: json['post_image'],
      likes: json['likes'] ?? [],
    );
  }
}