import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmist/models/app_user.dart';
import 'package:flutter/material.dart';
import 'package:farmist/models/todo_dm.dart';
import 'package:farmist/ui/common/text_field.dart';
import 'package:farmist/ui/providers/list_provider.dart';
import 'package:provider/provider.dart';

class AddBottomSheet extends StatefulWidget {
  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionsController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  late ListProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            "add new task",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 16,
          ),
          MyTextFeild(
              hintText: "Enter the task description",
              controller: titleController),
          SizedBox(
            height: 16,
          ),
          MyTextFeild(
              hintText: "Enter the task title",
              controller: descriptionsController),
          SizedBox(
            height: 16,
          ),
          Text(
            "select Data",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          InkWell(
            onTap: (){
              showMyDatePicker();
            },
              child: Text(
            "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.grey),
            textAlign: TextAlign.center,
          )),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              addTodoFirestore();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            ),
            child: Text("Add"),
          )
        ],
      ),
    );
  }

  void showMyDatePicker() async{
   selectedDate =  await showDatePicker(context: context,
        initialDate:selectedDate ,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)))??selectedDate;
   setState(() {

   });
  }
  void addTodoFirestore() async {
    CollectionReference todosCollectionRef =
    AppUser.collection().doc(AppUser.currentUser!.id).collection(TodoDm.collectionName);
    DocumentReference newEmptyDoc = todosCollectionRef.doc();
    await newEmptyDoc.set(
        {
          "id": newEmptyDoc.id,
          "title": titleController.text,
          "description": descriptionsController.text ,
          "date": selectedDate ,
          "isDone": false
        }
    );
    provider.refershTodoList();
    Navigator.pop(context);
  }


}




