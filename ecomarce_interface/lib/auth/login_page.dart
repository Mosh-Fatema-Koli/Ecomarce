import 'dart:convert';
import 'package:ecomarce_interface/auth/navbar.dart';
import 'package:ecomarce_interface/auth/registation.dart';
import 'package:ecomarce_interface/widget/custom_TextField.dart';
import 'package:ecomarce_interface/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;
  SharedPreferences? sharedPreferences;
  String? token;
  String loginLlink = "https://apihomechef.antopolis.xyz/api/admin/sign-in";

  isLogin() async {
    sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences!.getString("token");
    if (token != null) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => NavPage()));
    } else {
      print("token is null");
    }
  }

  getLogin() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var map = Map<String, dynamic>();
    map["email"] = emailController.text.toString();
    map["password"] = passwordController.text.toString();
    var responce = await http.post(
      Uri.parse(loginLlink),
      body: map,
    );
    final data = jsonDecode(responce.body);
    print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh$data");
    if (responce.statusCode == 200) {
      setState(() {
        sharedPreferences!.setString("token", data["access_token"]);
      });
      token = sharedPreferences!.getString("token");
      print("Token Saved $token");
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => NavPage()));
      showInToast("Login Succesfull");
    } else {
      showInToast("Login Failed");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    isLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => NavPage()));
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Sign In"),
      ),
      body: Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 80,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: Colors.red, width: 2, style: BorderStyle.solid)),
        height: 400,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 35,
              ),
              Text(
                "Log In",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 25,
              ),
              CustomTextField(
                controller: emailController,
                hintText: "Enter your Email",
              ),
              CustomTextField(
                controller: passwordController,
                hintText: "Enter your password",
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  getLogin();
                },
                child: Text("Log In"),
              ),
              SizedBox(
                height: 5,
              ),
              Text("Or"),
              SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => RegistationPage()));
                },
                child: Text(
                  "Register",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
