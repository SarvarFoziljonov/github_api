
class User {
  int id;
  String name;
  String company;
  String bio;
  String location;
  String avatar_url;
  User ({this.id, this.name, this.bio, this.company, this.location, this.avatar_url});

  User.fromJson(Map<String,dynamic> json):
        id = json['id'],
        name = json['name'],
        company = json['company'],
        bio = json['bio'],
        avatar_url = json['avatar_url'],
        location = json['location'];

  Map<String,dynamic> toJson(){
    return {
      'id': this.id,
      'name':this.name,
      'company':this.company,
      'bio': this.bio,
      'location': this.location,
      'avatar_url': this.avatar_url,
    };
  }
}