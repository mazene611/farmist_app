import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:farmist/models/todo_dm.dart';
import 'package:farmist/ui/bottom_sheets/add_bottom_sheet.dart';

class TodoItem extends StatelessWidget {
  final TodoDm model;
  TodoItem({super.key , required this.model});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 22 , horizontal: 30),
      decoration: BoxDecoration(
        color: Color.fromRGBO(209, 225, 209, 100),
      ),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.25,
            motion:StretchMotion(),
          children: [
            SlidableAction(onPressed: (_){
            },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: "delete",

            )
          ],
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * .13,
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 16),

          child: Row(
            children: [
              VerticalDivider(
                thickness: 2,
                color: Colors.green,width: 10,
              ),
              SizedBox(width: 12,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(model.title, style: TextStyle(fontSize: 20),),
                    Text(model.description , textAlign: TextAlign.start,)],
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.green, // Set border radius
                  ),
                padding: EdgeInsets.symmetric(vertical: 5 , horizontal: 20),
                  child: Icon(Icons.check , color: Colors.white,))
            ],
          ),
        ),
      ),
    );
  }
}
