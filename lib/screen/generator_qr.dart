import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  var quer = 'Add Data';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('creat QR '),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            BarcodeWidget(
              data: quer,
              barcode: Barcode.qrCode(),
              color: Colors.blue,
              height: 250,
              width: 250,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                onChanged: (val) {
                  setState(() {
                    quer = val;
                  });
                },
                decoration: InputDecoration(
                    hintText: 'Enter your Data',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ))),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
            )
          ],
        ),
      ),
    );
  }
}
