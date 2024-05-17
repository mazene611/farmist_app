import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class DetectingScreen extends StatefulWidget {
  static String routeName = "DetectingHome";
  DetectingScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<DetectingScreen> {
  late List _outputs = []; // Initialize _outputs with an empty list
  File? _image;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'plant diseases detection',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: _loading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _image == null
                ? Container()
                : Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black, // Choose your border color
                  width: 1, // Border width
                ),
                borderRadius: BorderRadius.circular(
                    10), // Adjust the radius as needed
              ),
              child: Image.file(
                _image!,
                height: 300,
                width: 300,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 20),
            _outputs.isNotEmpty
                ? Text(
              "${_outputs[0]["label"]}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            )
                : Container(),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton.extended(
              onPressed: () => pickImage(ImageSource.gallery),
              label: Text('Pick Image'),
              icon: Icon(Icons.image),
              backgroundColor: Colors.green,
            ),
            FloatingActionButton.extended(
              onPressed: () => pickImage(ImageSource.camera),
              label: Text('Take Photo'),
              icon: Icon(Icons.camera_alt),
              backgroundColor: Colors.green,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  pickImage(ImageSource source) async {
    var imagePicker = ImagePicker();
    var image = await imagePicker.pickImage(source: source);
    if (image == null) return null;

    setState(() {
      _loading = true;
      _image = File(image.path);
    });

    if (_image != null) {
      classifyImage(context, _image!);
    }
  }

  classifyImage(BuildContext context, File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    if (output == null || output.isEmpty) {
      // No output or empty output, handle invalid input
      setState(() {
        _loading = false;
        _outputs = [];
      });
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Invalid Input'),
          content: Text('The provided image does not contain a plant.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    setState(() {
      _loading = false;
      _outputs = output;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:tflite/tflite.dart';
//
// class Home extends StatefulWidget {
//   Home({Key? key, required this.title}) : super(key: key);
//   final String title;
//
//   @override
//   HomeState createState() => HomeState();
// }
//
// class HomeState extends State<Home> {
//   late List _outputs = []; // Initialize _outputs with an empty list
//   File? _image;
//   bool _loading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _loading = true;
//
//     loadModel().then((value) {
//       setState(() {
//         _loading = false;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'plant diseases detection',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.green,
//       ),
//       body: _loading
//           ? Center(
//         child: CircularProgressIndicator(),
//       )
//            :Container(
//         padding: EdgeInsets.all(20),
//         width: double.infinity,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             _image == null
//                 ? Container()
//                 : Container(
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.black, // Choose your border color
//                   width: 1, // Border width
//                 ),
//                 borderRadius: BorderRadius.circular(10), // Adjust the radius as needed
//               ),
//               child: Image.file(
//                 _image!,
//                 height: 300,
//                 width: 300,
//                 fit: BoxFit.contain, // Prevent image zooming in
//               ),
//             ),
//             SizedBox(height: 20),
//             _outputs.isNotEmpty
//                 ? Text(
//               "${_outputs[0]["label"]}",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 20.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             )
//                 : Container(),
//           ],
//         ),
//       )
//       //  -->   Container(
//       //   padding: EdgeInsets.all(20),
//       //   width: double.infinity,
//       //   child: Column(
//       //     crossAxisAlignment: CrossAxisAlignment.center,
//       //     children: [
//       //       _image == null
//       //           ? Container()
//       //           : Image.file(
//       //         _image!,
//       //         height: 300,
//       //         width: 300,
//       //         fit: BoxFit.contain, // Prevent image zooming in
//       //       ),
//       //       SizedBox(height: 20),
//       //       _outputs.isNotEmpty
//       //           ? Text(
//       //         "${_outputs[0]["label"]}",
//       //         style: TextStyle(
//       //           color: Colors.black,
//       //           fontSize: 20.0,
//       //           fontWeight: FontWeight.bold,
//       //         ),
//       //       )
//       //           : Container(),
//       //     ],
//       //   ),
//       // ),
//         ,
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.only(bottom: 20),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             FloatingActionButton.extended(
//               onPressed: () => pickImage(ImageSource.gallery),
//               label: Text('Pick Image'),
//               icon: Icon(Icons.image),
//               backgroundColor: Colors.green,
//             ),
//             FloatingActionButton.extended(
//               onPressed: () => pickImage(ImageSource.camera),
//               label: Text('Take Photo'),
//               icon: Icon(Icons.camera_alt),
//               backgroundColor: Colors.green,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
//
//   pickImage(ImageSource source) async {
//     var imagePicker = ImagePicker();
//     var image = await imagePicker.pickImage(source: source);
//     if (image == null) return null;
//
//     setState(() {
//       _loading = true;
//       _image = File(image.path);
//     });
//
//     if (_image != null) {
//       classifyImage(_image!);
//     }
//   }
//
//   classifyImage(File image) async {
//     var output = await Tflite.runModelOnImage(
//       path: image.path,
//       numResults: 2,
//       threshold: 0.5,
//       imageMean: 127.5,
//       imageStd: 127.5,
//     );
//
//     if (output == null || output.isEmpty) {
//       // No output or empty output, handle invalid input
//       setState(() {
//         _loading = false;
//         _outputs = [];
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: Text('Invalid Input'),
//             content: Text('The provided image does not contain a plant.'),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: Text('OK'),
//               ),
//             ],
//           ),
//         );
//       });
//       return;
//     }
//
//     setState(() {
//       _loading = false;
//       _outputs = output;
//     });
//   }
//
//   // classifyImage(File image) async {
//   //   var output = await Tflite.runModelOnImage(
//   //     path: image.path,
//   //     numResults: 2,
//   //     threshold: 0.5,
//   //     imageMean: 127.5,
//   //     imageStd: 127.5,
//   //   );
//   //   setState(() {
//   //     _loading = false;
//   //     _outputs = output!;
//   //   });
//   // }
//
//   loadModel() async {
//     await Tflite.loadModel(
//       model: "assets/model_unquant.tflite",
//       labels: "assets/labels.txt",
//     );
//   }
//
//   @override
//   void dispose() {
//     Tflite.close();
//     super.dispose();
//   }
// }

//***********//
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:tflite/tflite.dart';
//
// class Home extends StatefulWidget {
//   Home({Key? key, required this.title}) : super(key: key);
//   final String title;
//
//   @override
//   HomeState createState() => HomeState();
// }
//
// class HomeState extends State<Home> {
//   late List _outputs = []; // Initialize _outputs with an empty list
//   File? _image;
//   bool _loading = false;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('plant diseases detection'),
//       ),
//       body: _loading
//           ? Container(
//         alignment: Alignment.center,
//         child: CircularProgressIndicator(),
//       )
//           : Container(
//         width: MediaQuery.of(context).size.width,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _image == null ? Container() : Image.file(_image!),
//             SizedBox(
//               height: 20,
//             ),
//             _outputs.isNotEmpty // Check if _outputs is not empty before accessing
//                 ? Text(
//               "${_outputs[0]["label"]}",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 20.0,
//                 background: Paint()..color = Colors.white,
//               ),
//             )
//                 : Container(),
//           ],
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: () => pickImage(ImageSource.gallery),
//             tooltip: 'Pick Image from Gallery',
//             child: Icon(Icons.image),
//           ),
//           SizedBox(width: 10),
//           FloatingActionButton(
//             onPressed: () => pickImage(ImageSource.camera),
//             tooltip: 'Take a Photo',
//             child: Icon(Icons.camera_alt),
//           ),
//         ],
//       ),
//     );
//   }
//
//   pickImage(ImageSource source) async {
//     var imagePicker = ImagePicker();
//     var image = await imagePicker.pickImage(source: source);
//     if (image == null) return null;
//
//     setState(() {
//       _loading = true;
//       _image = File(image.path);
//     });
//
//     await loadModel(); // Load model every time an image is picked
//
//     if (_image != null) {
//       classifyImage(_image!);
//     }
//   }
//
//   classifyImage(File image) async {
//     var output = await Tflite.runModelOnImage(
//       path: image.path,
//       numResults: 2,
//       threshold: 0.5,
//       imageMean: 127.5,
//       imageStd: 127.5,
//     );
//     setState(() {
//       _loading = false;
//       _outputs = output!;
//     });
//   }
//
//   loadModel() async {
//     await Tflite.loadModel(
//       model: "assets/model_unquant.tflite",
//       labels: "assets/labels.txt",
//     );
//   }
//
//   @override
//   void dispose() {
//     Tflite.close();
//     super.dispose();
//   }
// }
