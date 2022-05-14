import 'package:flutter/material.dart';
import 'package:kasapplikasi/ui/pages/homescreen/view_model.dart';
import 'package:kasapplikasi/ui/pages/homescreen/view_model_search.dart';
import 'package:kasapplikasi/ui/pages/inputpage/input_view_model.dart';
import 'package:kasapplikasi/ui/pages/listwargascreen/view_model_daftarwarga.dart';
import 'package:kasapplikasi/ui/pages/loginandsignupscreen/auth_view_model.dart';
import 'package:kasapplikasi/ui/pages/loginandsignupscreen/login_page.dart';
import 'package:kasapplikasi/ui/pages/namepost/name_view_model.dart';
import 'package:kasapplikasi/ui/pages/splash_screen.dart';
import 'package:provider/provider.dart';

void main() { runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider<Viewmodel>(create: (_) => Viewmodel(),
        ),
        ChangeNotifierProvider<Daftarmodel>(create: (_) => Daftarmodel(),
        ),
        ChangeNotifierProvider<AuthViewModel>(create: (_) => AuthViewModel(),
       ),
         ChangeNotifierProvider<InputViewmodel>(create: (_) => InputViewmodel(),
       ),
        ChangeNotifierProvider<SearchViewModel>(create: (_) => SearchViewModel(),
       ),
       ChangeNotifierProvider<NameViewModel>(create: (_) => NameViewModel(),
       ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => SplashPage(),
          '/login-page': (context) => LoginScreen(),
        },
      ),
    );
  }
}