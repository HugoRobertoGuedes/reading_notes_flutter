import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class ViewPdf extends StatefulWidget {
  @override
  _ViewPdfState createState() => _ViewPdfState();
}

class _ViewPdfState extends State<ViewPdf> {
  final pageController = PageController(
    initialPage: 3,
  );

  @override
  Widget build(BuildContext context) {
    return pdfView();
  }
}

Widget pdfView() => FutureBuilder<PDFDocument>(
      // Open document
      future: PDFDocument.openAsset('assets/mongodb.pdf'),
      builder: (_, snapshot) {
        if (snapshot.hasData) {
          // Show document
          return PDFView(document: snapshot.data);
        }

        if (snapshot.hasError) {
          // Catch
          return Center(
            child: Text(
              'PDF Rendering does not '
              'support on the system of this version',
            ),
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
