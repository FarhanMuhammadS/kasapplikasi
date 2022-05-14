import 'package:flutter/material.dart';
import 'package:kasapplikasi/ui/pages/homescreen/search_screen.dart';
import 'package:kasapplikasi/ui/pages/inputpage/input_post.dart';
import 'package:kasapplikasi/ui/pages/listwargascreen/view_model_daftarwarga.dart';
import 'package:kasapplikasi/ui/pages/namepost/name_post.dart';
import 'package:provider/provider.dart';

class ListWargaPage extends StatefulWidget {
  const ListWargaPage({Key? key}) : super(key: key);

  @override
  State<ListWargaPage> createState() => _ListWargaPageState();
}

class _ListWargaPageState extends State<ListWargaPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final name = Provider.of<Daftarmodel>(context, listen: false);
      await name.getAllListWarga();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final daftarWarga = Provider.of<Daftarmodel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Warga'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: SearchWarga());
              },
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider();
          },
          itemBuilder: (context, index) {
            return ListTile(
              title: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InputPost(
                          name: daftarWarga.warga[index].name.toString(),
                        ),
                      ),
                    );
                  },
                  child: Text(daftarWarga.warga[index].name)),
            );
          },
          itemCount: daftarWarga.warga.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Namepost(name: 'name',),
            ),
          );
        },
        child: const Icon(Icons.person_add_outlined),
      ),
    );
  }
}
