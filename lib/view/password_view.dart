import 'package:flutter/material.dart';
import 'package:password_validation/core/base/constants/app_constants.dart';

class PasswordView extends StatefulWidget {
  const PasswordView({Key? key}) : super(key: key);

  @override
  _PasswordViewState createState() => _PasswordViewState();
}

class _PasswordViewState extends State<PasswordView> {
  bool _isVisible = false;
  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');

    setState(() {
      _isPasswordEightCharacters = false;
      if (password.length >= 8) _isPasswordEightCharacters = true;

      _hasPasswordOneNumber = false;
      if (numericRegex.hasMatch(password)) _hasPasswordOneNumber = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create Your Account",
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Container(
        padding: AppConstants.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Set a Password",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            AppConstants.heightSizedBox,
            const Text("Please create a secure password"),
            AppConstants.heightSizedBox,
            textField(),
            AppConstants.heightSizedBox,
            Row(
              children: [
                animatedContainer(
                    _isPasswordEightCharacters
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.grey.shade400),
                    _isPasswordEightCharacters
                        ? Colors.green
                        : Colors.transparent),
                AppConstants.widthSizedBox,
                const Text(AppConstants.firstRowText),
              ],
            ),
            AppConstants.heightSizedBox,
            Row(
              children: [
                animatedContainer(
                    _hasPasswordOneNumber
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.grey.shade400),
                    _hasPasswordOneNumber ? Colors.green : Colors.transparent),
                AppConstants.widthSizedBox,
                const Text(AppConstants.secondRowText),
              ],
            ),
            AppConstants.heightSizedBox,
            materialButton()
          ],
        ),
      ),
    );
  }

  TextField textField() {
    return TextField(
            onChanged: ((password) => onPasswordChanged(password)),
            obscureText: !_isVisible,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isVisible = !_isVisible;
                  });
                },
                icon: _isVisible
                    ? const Icon(
                        Icons.visibility,
                        color: Colors.black,
                      )
                    : const Icon(
                        Icons.visibility_off,
                        color: Colors.grey,
                      ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black),
              ),
              hintText: "Password",
              contentPadding: AppConstants.contentPadding,
            ),
          );
  }

  AnimatedContainer animatedContainer(BoxBorder border, Color color) {
    return AnimatedContainer(
      duration: Duration(
        milliseconds: 400,
      ),
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: color,
        border: border,
        borderRadius: AppConstants.borderRadius,
      ),
      child: Icon(
        Icons.check,
        color: Colors.white,
        size: 15,
      ),
    );
  }

  MaterialButton materialButton() {
    return MaterialButton(
      onPressed: () {},
      height: 40,
      minWidth: double.infinity,
      color: Theme.of(context).primaryColor,
      child: const Text(
        "Create Account",
      ),
      shape: RoundedRectangleBorder(
        borderRadius: AppConstants.borderRadius,
      ),
    );
  }
}
