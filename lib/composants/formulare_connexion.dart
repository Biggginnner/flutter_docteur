import 'package:application_docteur/main.dart';
import 'package:application_docteur/models/auth_model.dart';
import 'package:application_docteur/providers/dio_provider.dart';
import 'package:application_docteur/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:application_docteur/composants/Bouton_connexion.dart';
import 'package:provider/provider.dart';

class FormConnexion extends StatefulWidget {
  const FormConnexion({super.key});

  @override
  State<FormConnexion> createState() => _FormConnexionState();
}

class _FormConnexionState extends State<FormConnexion> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool obscurePass = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Config.primaryColor,
            decoration: const InputDecoration(
                alignLabelWithHint: true,
                hintText: "Adresse email",
                labelText: "Email",
                prefixIcon: Icon(Icons.email_outlined),
                prefixIconColor: Config.primaryColor),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: _passController,
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Config.primaryColor,
            obscureText: obscurePass,
            decoration: InputDecoration(
                alignLabelWithHint: true,
                hintText: "Entrer votre mot de passe",
                labelText: "Mot de passe",
                prefixIcon: const Icon(Icons.lock_outline),
                prefixIconColor: Config.primaryColor,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscurePass = !obscurePass;
                      });
                    },
                    icon: obscurePass
                        ? const Icon(Icons.visibility_off_outlined,
                            color: Config.primaryColor)
                        : const Icon(Icons.visibility_outlined))),
          ),
          Config.petitEspacement,
          Consumer<AuthModel>(
            builder: (context, value, child) {
              return Boutonconnexion(
                  title: "Connexion",
                  onPressed: () async {
                    final token = await DioProvider()
                        .getToken(_emailController.text, _passController.text);
                    if (token) {
                      value.loginSuccess();
                      MyApp.navigatorKey.currentState!.pushNamed('main');
                    }
                    // Navigator.of(context).pushNamed('main');
                  },
                  width: double.infinity,
                  desactive: false);
            },
          ),
        ],
      ),
    );
  }
}
