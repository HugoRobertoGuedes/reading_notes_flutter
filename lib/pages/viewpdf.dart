import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:lg_movel/controllers/EbookController.dart';
import 'package:lg_movel/models/books.dart';
import 'package:lg_movel/models/statement.dart';
import 'package:lg_movel/services/StatementService.dart';
import 'package:provider/provider.dart';

class ViewPdf extends StatefulWidget {
  String namefile;
  ViewPdf({this.namefile = 'book_01'});

  @override
  _ViewPdfState createState() => _ViewPdfState();
}

class _ViewPdfState extends State<ViewPdf> {
  bool _isLoading = true;
  PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    EbookController ebookController = Provider.of<EbookController>(context, listen: false);
    Book ebook = ebookController.getByFileName(widget.namefile);
    Object obj = new Object(objectType: 'Activity', id: 'http://id.tincanapi.com/activitytype/book', definition: new Definition(name: new Display(ptBr: ebook.titulo)));
    Verb verb = new Verb(id: 'http://activitystrea.ms/schema/1.0/open', display: new Display(ptBr: 'Abrir'));
    await sendStatemnet(verb, obj);
    document = await PDFDocument.fromAsset('assets/pdfs/${widget.namefile}.pdf');
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : PDFViewer(
                document: document,
                indicatorBackground: Colors.black,
              ));
  }
}
