import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kasapplikasi/models/api_models.dart';
import 'package:kasapplikasi/ui/pages/inputpage/input_view_model.dart';
import 'package:provider/provider.dart';

class InputPost extends StatefulWidget {
  final String? name;
  const InputPost({Key? key, this.name}) : super(key: key);

  @override
  State<InputPost> createState() => _InputPostState();
}

class _InputPostState extends State<InputPost> {
  String? _dateTime;
  String? _nominal;
  String? _keterangan;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final wargamasuk = Provider.of<InputViewmodel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name.toString()),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildDatePicker(context),
                  SizedBox(
                    height: 10,
                  ),
                  buildNominal(context),
                  SizedBox(
                    height: 10,
                  ),
                  buildKeterangan(context),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: SizedBox(
                      width: 230,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            wargamasuk.getAllListWarga(KasMasuk(
                                name: widget.name.toString(),
                                date: _dateTime.toString(),
                                keterangan: _keterangan,
                                nominal: _nominal));
                            Navigator.pop(context);
                          }
                        },
                        child: const Text('Simpan'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNominal(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Masukan Nominal'),
        SizedBox(
          height: 10,
        ),
        TextField(
          onChanged: (value) {
            setState(() {
              _nominal = value;
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
      ],
    );
  }

  Widget buildDatePicker(BuildContext context) {
    final format = DateFormat("dd-MM-yyyy");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Tanggal", style: TextStyle(color: Colors.blue)),
        DateTimeField(
          format: format,
          onShowPicker: (context, currentValue) {
            return showDatePicker(
                firstDate: DateTime(1900),
                initialDate: DateTime.now(),
                lastDate: DateTime(DateTime.now().year + 5),
                context: context);
          },
          validator: (value) {
            if ((value.toString().isEmpty)) {
              return 'Please Enter Valid Date';
            } else {
              return null;
            }
          },
          onChanged: (value) {
            setState(() => _dateTime = value.toString());
          },
          decoration: InputDecoration(
            hintText: 'dd/mm/yyyy',
          ),
        ),
      ],
    );
  }

  Widget buildKeterangan(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Masukan Keterangan'),
        SizedBox(
          height: 10,
        ),
        TextField(
          onChanged: (value) {
            setState(() {
              _keterangan = value;
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
      ],
    );
  }
}
