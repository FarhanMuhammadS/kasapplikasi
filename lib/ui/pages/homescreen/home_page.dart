import 'package:flutter/material.dart';
import 'package:kasapplikasi/shared/theme.dart';
import 'package:kasapplikasi/ui/pages/inputpage/input_view_model.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final name = Provider.of<InputViewmodel>(context, listen: false);
      await name.getKasMasuk();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final kasmasuk = Provider.of<InputViewmodel>(context);
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          left: 24,
          right: 24,
          top: 20,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi Welcome',
                    style: robotoblackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Kas Sukamanah',
                    style: robotoTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.account_circle, size: 50,),
          ],
        ),
      );
    }

    // ignore: non_constant_identifier_names
    Widget Search() {
      return Padding(
        padding: const EdgeInsets.only(top: 15, right: 12, left: 12),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            style: TextStyle(
              color: Color(0xff959595),
            ),
            decoration: InputDecoration(
              fillColor: Color(0xffF1F4F8),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              icon: Icon(Icons.search),
              hintText: 'Cari',
              hintStyle: robotoTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      );
    }

    Widget body() {
      return Padding(
        padding: EdgeInsets.all(10),
        child: ListView.separated(
          separatorBuilder: (context, index) {
            return Divider();
          },
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                child: Text(kasmasuk.kasmasuk[index].name[0]),
              ),
              title: Text(kasmasuk.kasmasuk[index].name),
              subtitle: Text(kasmasuk.kasmasuk[index].date),
              trailing: Text(kasmasuk.kasmasuk[index].nominal),
            );
          },
          itemCount: kasmasuk.kasmasuk.length,
        ),
      );
    }

    return ListView(
      children: [
        header(),
        Search(),
        body(),
      ],
    );
  }
}
