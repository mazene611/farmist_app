import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
void showLoadig(BuildContext context){
  showDialog(context: context,
      barrierDismissible: false,
      builder: (_){
      return AlertDialog(
        content: Row(
          children: [
            Text("loading...." , style: TextStyle(fontSize: 15),),
        Spacer(),
        LoadingAnimationWidget.beat(
          color: Colors.green,
          size: 30,
        )
          ],
        ),
      );
      }
  );

}
void hideLoading(BuildContext context){
  Navigator.pop(context);
}
void showError(BuildContext context , String message){
  showDialog(context: context,
      barrierDismissible: false,
      builder: (_){
        return AlertDialog(
          title: Text("Error!"),
          content: Text( message, style: TextStyle(fontSize: 15),),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("ok"))
          ],
        );
      }
  );
}


