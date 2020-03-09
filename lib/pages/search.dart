import 'package:flutter/material.dart';
import 'package:lg_movel/controllers/EbookController.dart';
import 'package:lg_movel/widgets/details/Ebook.dart';
import 'package:provider/provider.dart';

class Buscar extends StatefulWidget {
  @override
  _BuscarState createState() => _BuscarState();
}

class _BuscarState extends State<Buscar> {
 
  _buildList(EbookController ebookController) {
    return ListView.builder(
      itemCount: ebookController.ebooks.length,
      itemBuilder: (ctx, index) {
        final item = ebookController.ebooks[index];
        return Ebooks(
          info: item,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EbookController>(
      builder: (ctx, ebookController, widget) {
        return _buildList(ebookController);
      },
    );
  }
}
