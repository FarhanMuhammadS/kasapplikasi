import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kasapplikasi/shared/theme.dart';
import 'package:kasapplikasi/ui/pages/homescreen/home_screen.dart';
import 'package:kasapplikasi/ui/pages/loginandsignupscreen/auth_view_model.dart';
import 'package:kasapplikasi/ui/pages/loginandsignupscreen/sign_up_page.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  var obscureText = true;
  final _emailEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();
  String? email;
  String? password;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    final emailField = TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: _emailEditingController,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
        onChanged: (value) {
          email = value;
        },
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        });

    final passwordField = TextFormField(
      controller: _passwordEditingController,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.mail),
        suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: obscureText
                ? const Icon(
                    Icons.visibility_off_rounded,
                  )
                : const Icon(
                    Icons.visibility_rounded,
                  )),
        hintText: "Password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      onChanged: (value) {
        password = value;
      },
      validator: (value) {
        RegExp regex = RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
        return null;
      },
    );

    final loginButton = SizedBox(
      width: 500,
      height: 40,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kPrimaryColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ))),
        child: const Text(
          "LOGIN",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () async {
           if (isLoading) return;
          setState(() => isLoading = false);
          await Future.delayed(Duration(seconds: 3));
          setState(() => isLoading = true);
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            try {
              await Future.delayed(const Duration(seconds: 2))
                  .then((value) async =>
                      await authViewModel.signIn(email!, password!))
                  .then((value) => {
                        Fluttertoast.showToast(msg: "Login Success").then(
                          (value) => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          ),
                        ),
                      });
            } catch (e) {
              Fluttertoast.showToast(msg: e.toString());
            }
          }
        },
      ),
    );
    
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(36.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  emailField,
                    SizedBox(
                    height: 30,
                  ),
                  passwordField,
                    SizedBox(
                    height: 30,
                  ),
                  loginButton,
                  TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },
                  child: const Text("Sign Up"),),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
