import 'package:flutter/material.dart';
import 'package:lg_movel/controllers/EbookController.dart';
import 'package:lg_movel/models/books.dart';
import 'package:lg_movel/widgets/details/Ebook.dart';
import 'package:provider/provider.dart';

class Favoritos extends StatefulWidget {
  @override
  FavoritosState createState() => FavoritosState();
}

class FavoritosState extends State<Favoritos> {
  _buildList() {
    EbookController ebookController = Provider.of<EbookController>(context);
    List<Book> list = ebookController.ebooks.where((a) => a.favorite == true).toList();
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (ctx, index) {
        final item = list[index];
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
        return _buildList();
      },
    );
  }
}
