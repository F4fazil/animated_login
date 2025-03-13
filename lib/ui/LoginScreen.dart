import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  bool _isPasswordFocused = false;
  final FocusNode _passwordFocusNode = FocusNode();
  final TextEditingController _passwordController = TextEditingController();
  String imgpath = "assets/normal.jpg";

  @override
  void initState() {
    super.initState();
    _passwordFocusNode.addListener(() {
      setState(() {
        _isPasswordFocused = _passwordFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Login Screen')),
      body: Stack(
        children: [
          // Panda Image
          Positioned(
            top: 50,
            left: MediaQuery.of(context).size.width / 4,
            child: SizedBox(
              width: 200,
              height: 200,
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 100),
                child:
                    _isPasswordFocused
                        ? Image.asset(
                          imgpath,
                          key: ValueKey('panda_shy'),
                          width: 170,
                          height: 170,
                        )
                        : Image.asset(
                          'assets/eye.jpg',
                          key: ValueKey('panda_normal'),
                          width: 170,
                          height: 170,
                        ),
              ),
            ),
          ),
          // Password Field
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: SizedBox(
                width: 300,
                child: TextField(
                  controller: _passwordController,
                  focusNode: _passwordFocusNode,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 500.0, left: 140),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 96, 163, 218),
              ),
              onPressed: onPressed,
              child: Text('Login', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  onPressed() {
    if (_passwordController.text != 'password') {
      setState(() {
        imgpath = "assets/crying.jpg";
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid Password'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      setState(() {
        imgpath = "assets/normal.jpg";
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login Successful'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
