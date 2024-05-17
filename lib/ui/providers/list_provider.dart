import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmist/models/app_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timeline_calendar/timeline/flutter_timeline_calendar.dart';

import '../../models/todo_dm.dart';

class ListProvider extends ChangeNotifier{
  List<TodoDm> todos = [];
  DateTime currentDateTime = DateTime.now();

  CalendarDateTime selectedDate = CalendarDateTime(year: DateTime.now().year, month: DateTime.now().month, day: DateTime.now().day);

  refershTodoList()async{
    CollectionReference<TodoDm> todoesCollections =AppUser.collection().doc(AppUser.currentUser!.id).collection(TodoDm.collectionName).withConverter<TodoDm>(
        fromFirestore: (docSnapShot, _){
          Map json = docSnapShot.data() as Map;
          TodoDm todo =  TodoDm.fromjson(json);
          return todo;
        }, toFirestore: (todoDm, _){
      return todoDm.Tojson();
    });
    QuerySnapshot<TodoDm> todoSnapshot= await todoesCollections
        .orderBy("date")
        // .where("date" , isEqualTo: selectedDate.day)
        .get();
    List<QueryDocumentSnapshot<TodoDm>> docs =  todoSnapshot.docs;
    // for(int i = 0; i<docs.length ; i++){
    //    todos.add(docs[i].data());
    // }
    // better soulution
    todos = docs.map((docSnapShot) {
      return docSnapShot.data();
    }).toList();

    // for(int i = 0 ; i<todos.length ; i++){
    //   print("todos[i].date.day ${todos[i].date.day} ,selectedDate.day ${selectedDate.day} ");
    //   if(todos[i].date.day !=selectedDate.day ||
    //       todos[i].date.month !=selectedDate.month ||
    //       todos[i].date.year !=selectedDate.year){
    //         todos.removeAt(i);
    //         i--;
    //   }
    // }

    // better selution
    todos = todos.where((todo) {
      if(todo.date.day !=selectedDate.day ||
          todo.date.month !=selectedDate.month ||
          todo.date.year !=selectedDate.year){
        return false;
      }else{
        return true;
      }
    }).toList();
   notifyListeners();
  }


}
