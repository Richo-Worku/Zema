import 'package:flutter/material.dart';
import 'package:zema_multimedia/screens/home.dart';
import 'package:zema_multimedia/translation/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'auth_service.dart';
import 'create_account.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/loginlogo.png"),
              const SizedBox(
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: const Text(
                  'Your Musics Are Waiting.....',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.2,
                child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        hintText: LocaleKeys.email.tr(),
                        counterText: '',
                        border: InputBorder.none,
                        fillColor: const Color(0xfff3f3f4),
                        filled: true)),
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: LocaleKeys.password.tr(),
                        counterText: '',
                        border: InputBorder.none,
                        fillColor: const Color(0xfff3f3f4),
                        filled: true),
                  )),
              const SizedBox(
                height: 30.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize:
                        Size(MediaQuery.of(context).size.width / 1.5, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    backgroundColor: const Color(0xffFE3562)),
                onPressed: () async {
                  final message = await AuthService().login(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );

                  if (message == "Success") {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Home(),
                      ),
                    );
                  } else {
                    var snackBar = SnackBar(content: Text(message.toString()));
                    // Step 3
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Text(LocaleKeys.login.tr()),
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CreateAccount(),
                    ),
                  );
                },
                child: RichText(
                  text: TextSpan(
                      text: LocaleKeys.donthaveaccount.tr(),
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                      children: <TextSpan>[
                        TextSpan(
                          text: LocaleKeys.createaccount.tr(),
                          style: const TextStyle(
                              color: Color(0xffFE3562),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
