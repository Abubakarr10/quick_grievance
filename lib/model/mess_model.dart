class MessModel{
  final String docId,optionA,optionB;
  final String optionPriceA,optionPriceB;
  final String optionImageA,optionImageB;
  final String descriptionA,descriptionB;
  final String messDate;
  final List<dynamic> voteA;
  final List<dynamic> voteB;
  const MessModel(
      {
         this.docId = '',
         this.optionA = '',
         this.optionB = '',
         this.optionPriceA = '',

         this.optionPriceB = '',
         this.messDate = '',
         this.optionImageA = '',
         this.optionImageB = '',
        this.descriptionA = '',
        this.descriptionB = '',

         this.voteA = const [],
         this.voteB = const []
      });

  Map<String,dynamic> toJson(){
    return {
      'doc_id' : docId,
      'option_a' : optionA,
      'option_b' : optionB,
      'option_price_a' : optionPriceA,
      'option_price_b' : optionPriceB,
      'mess_date' : messDate,
      'option_image_a' : optionImageA,
      'option_image_b' : optionImageB,
      'description_a' : descriptionA,
      'description_b' : descriptionB,
      'vote_a' : voteA,
      'vote_b' : voteB
    };
  }

  factory MessModel.fromJson(Map<String, dynamic> json){
    return MessModel(
      docId: json['doc_id'],
      optionA: json['option_a'],
      optionB: json['option_b'],
      optionPriceA: json['option_price_a'],
      optionPriceB: json['option_price_b'],
      messDate: json['mess_date'],
      optionImageA: json['option_image_a'],
      optionImageB: json['option_image_b'],
      descriptionA: json['description_a'],
      descriptionB: json['description_b'],
      voteA: json['vote_a'] ?? [],
      voteB: json['vote_b'] ?? [],
    );
  }
}