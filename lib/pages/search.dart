import 'package:flutter/material.dart';
import 'package:lg_movel/controllers/EbookController.dart';
import 'package:lg_movel/widgets/details/Ebook.dart';
import 'package:provider/provider.dart';

class Buscar extends StatefulWidget {
  Function openPdf;

  Buscar({this.openPdf});

  @override
  _BuscarState createState() => _BuscarState();
}

class _BuscarState extends State<Buscar> {
  bool loader = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      loader = true;
    });
    _loader();
  }

  _loader() async {
    EbookController controller = Provider.of<EbookController>(context, listen: false);
    bool loading = await controller.getBooksHasura();
    if (loading) {
      setState(() {
        loader = false;
      });
    }
  }

  _buildList(EbookController ebookController) {
    return ListView.builder(
      itemCount: ebookController.ebooks.length,
      itemBuilder: (ctx, index) {
        final item = ebookController.ebooks[index];
        return Ebooks(
          info: item,
          funcOpen: widget.openPdf
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return (loader == true)
        ? new Center(
            child: CircularProgressIndicator(),
          )
        : Consumer<EbookController>(
            builder: (ctx, ebookController, widget) {
              return _buildList(ebookController);
            },
          );
  }
}
