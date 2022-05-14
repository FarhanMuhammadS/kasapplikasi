import 'package:flutter/material.dart';
import 'package:kasapplikasi/ui/pages/homescreen/view_model_search.dart';
import 'package:provider/provider.dart';

class SearchWarga extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    final kasmasuk = Provider.of<SearchViewModel>(context);
    return FutureBuilder(
        future: kasmasuk.getKasMasuk(query),
        builder: (context, snapshot) {
          if (kasmasuk.kasmasuk.isEmpty) {
            return (Center(
              child: Text(
                "Cari Nama",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.bold),
              ),
            ));
          }
          return  Padding(
        padding: EdgeInsets.all(10),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider();
          },
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                child: Text(kasmasuk.listkas[index].name![0]),
              ),
              title: Text(kasmasuk.listkas[index].name!),
              subtitle: Text(kasmasuk.listkas[index].date!),
              trailing: Text(kasmasuk.listkas[index].nominal!),
            );
          },
          itemCount: kasmasuk.listkas.length,
        ),
      );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
          child: Text(
        "Cari Nama Warga",
        textAlign: TextAlign.justify,
        style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade700,
            fontWeight: FontWeight.bold),
      )),
    );
  }
}