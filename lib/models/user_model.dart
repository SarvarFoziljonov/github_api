
class User {
  int id;
  String name;
  String company;
  String bio;
  String location;
  User ({this.id, this.name, this.bio, this.company, this.location});

  User.fromJson(Map<String,dynamic> json):
        id = json['id'],
        name = json['name'],
        company = json['company'],
        bio = json['bio'],
        location = json['location'];

  Map<String,dynamic> toJson(){
    return {
      'id': this.id,
      'name':this.name,
      'company':this.company,
      'bio': this.bio,
      'location': this.location,
    };
  }
}