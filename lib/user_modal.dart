import 'dart:convert';

Usermodal usermodalFromJson(String str) =>
    Usermodal.fromJson(json.decode(str));

String usermodalToJson(Usermodal data) => json.encode(data.toJson());

class Usermodal {
Usermodal({
    this.image,
    required this.id,
    required this.name,
     required this.email,
  });

  String? image;
 String name;
String email;
  String id;

  factory Usermodal.fromJson(Map<String, dynamic> json) => Usermodal(
        id: json["id"],
        image: json["image"],
        name: json["name"],
         email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "email":email,
      };


      
    Usermodal copyWith({
String? name,image
    }) => Usermodal(
    id: id,

     name: name??this.name,
  email: email,
    image:image??this.image,
   

    );
}
