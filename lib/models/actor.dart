class Actor{
  late String id;
  late String name;
  late String bio;
  late String photoUrl;

  Actor(Map<String, dynamic> json) 
        : id = json['id'],
        name = json['name'],
        bio = json['bio'],
        photoUrl = json['photoUrl'];

}