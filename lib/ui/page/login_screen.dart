// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_app/ui/data/colors.dart';
import 'package:flutter_app/ui/layout/image_placeholder.dart';

import '../../main.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appBar: AppBar(automaticallyImplyLeading: true),
        body: SafeArea(
          child: _MainView(
            usernameController: _usernameController,
            passwordController: _passwordController,
          ),
        ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

class _SmallLogo extends StatelessWidget {
  const _SmallLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 64),
      child: SizedBox(
        height: 160,
        // child: ExcludeSemantics(
        //   child: FadeInImagePlaceholder(
        //     image: AssetImage('logo.png', package: 'rally_assets'),
        //     child: Icon(Icons.shopping_bag_outlined ),
        //     placeholder: SizedBox.shrink(),
        //   ),
        // ),
        child: Icon(Icons.shopping_bag_outlined, size: 160, color: DemoColors.buttonColor,),
      ),
    );
  }
}

class _MainView extends StatelessWidget {
  const _MainView({
    Key key,
    this.usernameController,
    this.passwordController,
  }) : super(key: key);

  final TextEditingController usernameController;
  final TextEditingController passwordController;

  void _doLogin(BuildContext context) {
    Navigator.of(context).pop();// <= TODO we no longer need login screen when moving to main screen
    // Navigator.of(context).pushReplacementNamed(MyDemoApp.homeRoute);
    // pushNamedAndRemoveUntil <= perfect for payment flow!
    Navigator.of(context).pushNamed(MyDemoApp.homeRoute);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> listViewChildren;

      listViewChildren = [
        // const SizedBox(height: 180),
        const _SmallLogo(),
        _UsernameInput(
          usernameController: usernameController,
        ),
        const SizedBox(height: 12),
        _PasswordInput(
          passwordController: passwordController,
        ),
        _LoginButton(
          onTap: () {
            _doLogin(context);
          },
        ),
      ];

    return Column(
      children: [
        // if (isDesktop) const _TopBar(),
        Expanded(
          child: Align(
            alignment: Alignment.topLeft,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: listViewChildren,
            ),
          ),
        ),
      ],
    );
  }
}

class _UsernameInput extends StatelessWidget {
  const _UsernameInput({
    Key key,
    this.maxWidth,
    this.usernameController,
  }) : super(key: key);

  final double maxWidth;
  final TextEditingController usernameController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth ?? double.infinity),
        child: TextField(
          style: TextStyle(color: Colors.white, decorationColor: Colors.white),
          controller: usernameController,
          decoration: InputDecoration(
            labelText: 'Username',
            labelStyle: TextStyle(color: Colors.white),
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({
    Key key,
    this.maxWidth,
    this.passwordController,
  }) : super(key: key);

  final double maxWidth;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth ?? double.infinity),
        child: TextField(
          style: TextStyle(color: Colors.white, decorationColor: Colors.white),
          controller: passwordController,
          decoration: InputDecoration(
            labelText: 'Password',
          ),
          obscureText: true,
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    Key key,
    @required this.onTap,
    this.maxWidth,
  }) : super(key: key);

  final double maxWidth;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth ?? double.infinity),
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Row(

          children: [
            const Icon(Icons.check_circle_outline,
                color: DemoColors.buttonColor),
            const SizedBox(width: 12),
            Text('Remember Me', style: TextStyle(color: Colors.white)),
            const Expanded(child: SizedBox.shrink()),
            _FilledButton(
              text: 'Login',
              onTap: onTap,
            ),
            // const Expanded(child: SizedBox.shrink()),
          ],
        ),
      ),
    );
  }
}

class _FilledButton extends StatelessWidget {
  const _FilledButton({Key key, @required this.text, @required this.onTap})
      : super(key: key);

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: DemoColors.buttonColor,
        // backgroundColor: DemoColors.billColor(3),
        primary: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onTap,
      child: Row(
        children: [
          const Icon(Icons.lock_outline),
          const SizedBox(width: 6),
          Text(text),
        ],
      ),
    );
  }
}
