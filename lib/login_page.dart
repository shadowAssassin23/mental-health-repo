import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:wscube_logintutorial/assess_page.dart';
import 'package:wscube_logintutorial/assessment_page.dart';
// import 'package:wscube_logintutorial/main.dart';
import 'package:wscube_logintutorial/signup_page.dart';
import 'package:wscube_logintutorial/ui_helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login(String email, String password) async {
    if (email == "" && password == "") {
      Uihelper.customAlertBox(context, "Enter Required Fields");
    } else {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);

        if (!mounted) {
          return;
        }
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AssessmentPage(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        return Uihelper.customAlertBox(context, e.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login Page'),
          backgroundColor: Colors.deepPurple[300],
          foregroundColor: Colors.white,
          elevation: 1,
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Uihelper.customTextField(
                emailController, "Email", Icons.mail, false),
            Uihelper.customTextField(
                passwordController, "Password", Icons.password, true),
            const SizedBox(
              height: 30,
            ),
            Uihelper.customButtom(() {
              // login(emailController.text.toString(),
              //     passwordController.text.toString());
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => AssessmentPage(),
                ),
              );
            }, "Login"),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Not Have an account??'),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        (MaterialPageRoute(builder: (context) {
                          return const SignupPage();
                        })));
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
