import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kasapplikasi/shared/theme.dart';
import 'package:kasapplikasi/ui/pages/loginandsignupscreen/login_page.dart';
import 'package:provider/provider.dart';
import 'auth_view_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var obscureText = true;
  var obscureText2 = true;

  String? email;
  String? password;
  String? confirmPassword;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    final namaField = TextFormField(
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          hintText: "Name lengkap",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ));

    final emailField = TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
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
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
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
                  ),
          ),
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
        });

    final confirmField = TextFormField(
      obscureText: obscureText2,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.vpn_key),
        suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                obscureText2 = !obscureText2;
              });
            },
            child: obscureText2
                ? const Icon(
                    Icons.visibility_off_rounded,
                  )
                : const Icon(
                    Icons.visibility_rounded,
                  )),
        hintText: "Confirm Password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onChanged: (value) {
        confirmPassword = value;
      },
      autovalidateMode: AutovalidateMode.always,
      validator: (value) {
        if (confirmPassword != password) {
          return "Password don't match";
        }
        return null;
      },
    );
    final signUp = SizedBox(
      width: 500,
      height: 40, 
      child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kPrimaryColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      child: const Text(
        "SIGNUP",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          try {
            await Future.delayed(const Duration(seconds: 2))
                .then((value) async =>
                    await authViewModel.signUp(email!, password!))
                .then((value) => {
                      Fluttertoast.showToast(msg: "Account Created").then(
                        (value) => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
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
                  namaField,
                    SizedBox(
                    height: 25,
                  ),
                  emailField,
                    SizedBox(
                    height: 30,
                  ),
                  passwordField,
                    SizedBox(
                    height: 30,
                  ),
                  confirmField,
                    SizedBox(
                    height: 15,
                  ),
                  signUp,
                   TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: const Text("Login"),),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
