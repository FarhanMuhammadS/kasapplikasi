import 'package:flutter/material.dart';
import 'package:kasapplikasi/models/api_models.dart';
import 'package:kasapplikasi/ui/pages/namepost/name_view_model.dart';
import 'package:provider/provider.dart';

class Namepost extends StatefulWidget {
  final String? name;
  const Namepost({Key? key, this.name}) : super(key: key);

  @override
  State<Namepost> createState() => _NamepostState();
}

class _NamepostState extends State<Namepost> {
  String? _name;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final inputwarga = Provider.of<NameViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Nama'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
         key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Masukan Nama Warga'),
              SizedBox(
                height: 10,
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
                style: TextStyle(color: Colors.black, backgroundColor: Colors.white),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Center(
                child: SizedBox(
                  width: 230,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        inputwarga.postNameWarga(WargaModel(
                           name: _name
                        ));
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Simpan'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
