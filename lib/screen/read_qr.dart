import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ReadScreen extends StatefulWidget {
  @override
  _ReadScreenState createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  var quer = 'Add Data';
  var height, width;
  String? scanResult;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery
        .of(context)
        .size
        .width;
    width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Read QR '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              quer,
              style: TextStyle(color: Colors.blue, fontSize: 30),
            ),
            ElevatedButton(onPressed:scanBarcode , child: Text('Scnnar')),
            SizedBox(
              height: height,
              width: width,
            ),
            SizedBox(
              height: 70,

              child:Text(
                scanResult==null?'scan a code!'
              :'Scan result:$scanResult'
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> scanQr() async {
    try {
      FlutterBarcodeScanner.scanBarcode('#2A99CF', 'cancel', true, ScanMode.QR);
    } catch (e) {
      setState(() {
        quer = 'can not read code';
      });
    }
  }
  Future<void> scanBarcode() async {
    String scanResult;
    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666',
          'Cancel',
          true,
          ScanMode.QR
      );
    } on PlatformException{
      scanResult='Faild to get platform vrisn.';
       }
       if (! mounted) return;
       setState(() {
         this.scanResult=scanResult;
       });
  }


}
