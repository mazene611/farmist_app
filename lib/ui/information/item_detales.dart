import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:farmist/ui/information/information_detales.dart';

class ItemDetalis extends StatefulWidget {
  static String routeName = "ItemDetalis";

  @override
  State<ItemDetalis> createState() => _ItemDetalisState();
}

class _ItemDetalisState extends State<ItemDetalis> {
  List<String> dataInfo = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as ItemDetalisArgs;
    if(dataInfo.isEmpty) {
      loadFile(args.index);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(32, 220, 45, 100),
        title: Center(child: Text("${args.name}")),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 1 , vertical: 10),
          padding: EdgeInsets.all(12),
          child:
              // Image(image: ResizeImage(AssetImage("assets/images/cards/${args.imageName}.jpg" ) , width: 400 , height: 250 )),
              Column(
                children: [
              Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),child: Image(image: ResizeImage(AssetImage("assets/images/cards/${args.imageName}.jpg" ) , width: 550 , height: 400 ))),
                  Expanded(
                    child: dataInfo.length == 0? Center(child: CircularProgressIndicator()):
                    ListView.builder(
                      itemBuilder: (context, index) {
                        return InformationDetales(name: dataInfo[index] );
                      },

                      itemCount: dataInfo.length),
                  ),]
              )),
    );
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/informations/${index}.txt');
    List<String> lines = content.split('\n');
    dataInfo = lines;
    setState(() {

    });
  }
}

class ItemDetalisArgs {
  String name;
  String imageName;
  int index;
  ItemDetalisArgs(
      {required this.name, required this.index, required this.imageName});
}
