import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toktok/blocs/login/login_bloc.dart';
import 'package:toktok/models/home_screen_models/user.dart';
import 'package:toktok/src/screens/auth_screens/register_screen.dart';
import 'package:toktok/src/screens/home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginBloc(),
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Sign Up",
              style: TextStyle(color: Color(0xff0d0d0d)),
            ),
            centerTitle: true,
            backgroundColor: Color(0xfffafafa),
            elevation: 0,
          ),
          body: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Home();
                }));
              } else if (state is LoginFailed) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    state.message,
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.red,
                ));
              }
            },
            builder: (context, state) {
              return SafeArea(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 42,
                        ),
                        Text(
                          "Welcome Back!",
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.w900),
                        ),
                        Text(
                          "You've been missed.",
                          style:
                              TextStyle(color: Color(0xffa1a1a1), fontSize: 18),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 14),
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color(0xfff1f1f1),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: "Email"),
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 14),
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color(0xfff1f1f1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: passwordController,
                                  obscureText: isHidden,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                  ),
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isHidden = !isHidden;
                                  });
                                },
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  color: Color(0xffa1a1a1),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Forget Password?",
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xffa1a1a1)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 32,
                        ),
                        BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                            return MaterialButton(
                                minWidth: double.infinity,
                                height: 50,
                                padding: EdgeInsets.all(6),
                                color: Colors.amber,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                elevation: 0,
                                onPressed: () {
                                  if (emailController.text != "" &&
                                      passwordController.text != "") {
                                    BlocProvider.of<LoginBloc>(context)
                                      ..add(RequestLoginEvent(
                                          user: User(
                                              email: emailController.text,
                                              password:
                                                  passwordController.text)));
                                  }
                                },
                                child: !(state is LoginLoading)
                                    ? Text(
                                        "Login",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.white),
                                      )
                                    : CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 1,
                                      ));
                          },
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) {
                                      return RegisterScreen();
                                    }));
                                  },
                                  child: RichText(
                                      text: TextSpan(
                                          style: TextStyle(fontSize: 16),
                                          children: <TextSpan>[
                                        TextSpan(
                                            text: "Don't have an account? ",
                                            style: TextStyle(
                                                color: Color(0xffa1a1a1))),
                                        TextSpan(
                                            text: "Sign Up",
                                            style:
                                                TextStyle(color: Colors.orange))
                                      ])),
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                Text(
                                  "OR",
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xffa1a1a1)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        MaterialButton(
                            minWidth: double.infinity,
                            height: 50,
                            padding: EdgeInsets.all(6),
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            elevation: 0,
                            onPressed: () {},
                            child: Text(
                              "Connect with Google",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            )),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
