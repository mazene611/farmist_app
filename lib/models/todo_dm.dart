import 'package:cloud_firestore/cloud_firestore.dart';

class TodoDm{
  late String id;
  late String title;
  late String description;
  late DateTime date;
  late bool isDone;
  static String collectionName = "todos";
  TodoDm(this.id , this.title , this.description , this.date , this.isDone);
  TodoDm.fromjson(Map json){
      id = json["id"];
      title = json["title"];
      description = json["description"];
      Timestamp timest = json["date"];
      date = timest.toDate();
      isDone = json["isDone"];
  }
  Map<String , Object?> Tojson(){
    return {
      "id":id,
      "title":title,
      "description":description,
      "date":date,
      "isDone":isDone,

    };
  }
}