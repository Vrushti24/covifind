import 'dart:io';
import 'package:covifind/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {

bool _loading;
File _image;
List _output;
final _imagePicker = ImagePicker();

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
  
  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
      numThreads: 1);
  }

  pickImage() async {
    var image = await _imagePicker.getImage(source: ImageSource.gallery);
    if(image == null) return null;
    setState(() {
      _loading = true;
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  clickImage() async {
    var image = await _imagePicker.getImage(source: ImageSource.camera);
    if(image == null) return null;
    setState(() {
      _loading = true;
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
      );
      setState(() {
        _loading = false;
        _output = output;
        print(_output);
      });
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:  new AppBar(
      centerTitle: true,
            title: Text('X-Ray Scan',style: TextStyle(color: Colors.white) ,),
            leading: new IconButton(icon: new Icon(Icons.arrow_back_rounded), 
            onPressed: () {
              Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()));
            },
            color: Colors.white,),
            backgroundColor: Colors.blue),
      backgroundColor: Colors.white,
      body: _loading ? Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ) :
      Container(
        child: Column(
          children: [
            SizedBox(height:30),
            _image == null ?  Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blueGrey.shade100,
              ),
              width: 300,
              height: 300,
            ) : Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blueGrey.shade100,
                ),
                child:Image.file(_image),
                width: 300,
                height:300,
              )
            ),
            SizedBox(height: 20,),
            _output != null
                ? Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.12,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('RESULTS', style: TextStyle(fontSize: 20),),
                        Divider(thickness: 2,),
                        SizedBox(
                          height: 5,
                        ),
                        Text("Covid Status: ${_output[0]["label"]}".replaceAll(RegExp(r'[0-9]'), '',),
                          style: TextStyle(color:Colors.red, fontSize: 20),),
                      ],
                    ),
                  ),
                )
                : Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(15),
              ),
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.12,
              child: Center(child: Text("Please upload your X-ray \n or CT Scan image", style: TextStyle(color:Colors.blueGrey, fontSize: 20))),
            ),
            //SizedBox(height: 20,),
             Padding(
                 padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children:[
                     Container(
                         height: 70,
                         width: 150,
                         decoration: BoxDecoration(
                           color: Colors.blue,
                           borderRadius: BorderRadius.circular(20),
                         ),
                         child:GestureDetector(
                                onTap: () => clickImage() ,
                                child:Stack(
                               children: [
                                 Positioned(
                                   top: 10,
                                   height: 20,
                                   left: 53,
                                   child: Text('Click',style: TextStyle(color:Colors.white,fontSize: 20),)),
                                   Positioned(
                                     top: 35,
                                     left: 62,
                                     child: Icon(Icons.camera_enhance,color: Colors.white,))
                               ],
                         ))
                       ),
                     Container(
                           height: 70,
                           width: 150,
                           decoration: BoxDecoration(
                             color: Colors.blue,
                             borderRadius: BorderRadius.circular(20),
                         ),
                         child:GestureDetector(
                              onTap: () => pickImage(),
                              child:Stack(
                             children: [
                               Positioned(
                                 top: 10,
                                 height: 25,
                                 left: 48,
                                 child: Text('Upload',style: TextStyle(color:Colors.white,fontSize: 20),)),
                                 Positioned(
                                   top: 35,
                                   left: 62,
                                   child: Icon(Icons.file_upload,color: Colors.white,))
                             ],
                           )
                         )),
                   ],
             ),
         ),
             Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Container(
                     height: 60,
                     width: 250,
                     decoration: BoxDecoration(
                       color: Colors.blue,
                       borderRadius: BorderRadius.circular(20),
                   ),
                   child:GestureDetector(
                        onTap: (){

                        },
                        child:Stack(
                       children: [
                         Positioned(
                           top: 20,
                           height: 25,
                           left: 48,
                           child: Text('Consult a Doctor',style: TextStyle(color:Colors.white,fontSize: 20),)),
                       ],
                     )
                   )),
          ),
       ],
      ),
    ));
  }
}
