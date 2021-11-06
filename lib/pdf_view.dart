import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';



class MyPdfViewer extends StatefulWidget {
  String bookPath;
  String bookName;

  MyPdfViewer({this.bookPath,this.bookName});

  @override
  _MyPdfViewerState createState() => _MyPdfViewerState();
}

class _MyPdfViewerState extends State<MyPdfViewer> {
  String url = "http://www.pdf995.com/samples/pdf.pdf";
  PDFDocument _doc;
  bool _loading;

  @override
  void initState() {
    super.initState();
    _initPdf();
  }

  _initPdf() async {
    setState(() {
      _loading = true;
    });
    final doc = await PDFDocument.fromAsset(widget.bookPath);
    setState(() {
      _doc=doc;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(backgroundColor: HexColor('#075852').withOpacity(0.5) ,title: Text("${widget.bookName}",style: TextStyle(color: Colors.white),),),
      body: _loading ? Center(child: CircularProgressIndicator(),) : PDFViewer(document: _doc,
        indicatorBackground:  HexColor('#075852'),
        showIndicator: true,
        showPicker: true,
      ),
    );
  }
}
