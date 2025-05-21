import 'package:flutter/material.dart';
import 'package:my_app/api/login_submit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    idController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.06),
            child: Column(
              children: [
                SizedBox(height: h * 0.09),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 140,
                    height: 30,
                    child: Text(
                      '혼자여도 함께인 식탁',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Noto Sans KR',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

                SizedBox(height: h * 0.05),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '아이디',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Noto Sans KR',
                      height: 1.65,
                      letterSpacing: 0,
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  width: 346,
                  height: 42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color(0xFF929292), width: 1.5),
                  ),
                  child: TextField(
                    controller: idController,
                    decoration: const InputDecoration(
                      hintText: '아이디를 입력해 주세요.',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),

                SizedBox(height: h * 0.03),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '비밀번호',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Noto Sans KR',
                      height: 1.65,
                      letterSpacing: 0,
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  width: 346,
                  height: 42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color(0xFF929292), width: 1.5),
                  ),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: '비밀번호(특수문자 포함 8자 이상)',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),

                SizedBox(height: h * 0.02),

                GestureDetector(
                  onTap: () {
                    final id = idController.text.trim();
                    final password = passwordController.text;

                    if (id.isEmpty || password.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('아이디와 비밀번호를 모두 입력해 주세요.')),
                      );
                      return;
                    }

                    submitLogin(context, id: id, password: password);
                  },
                  child: Image.asset(
                    'assets/images/Group223.png',
                    width: 346,
                    height: 53,
                    fit: BoxFit.contain,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('아이디 찾기', style: TextStyle(color: Colors.grey)),
                    ),
                    const Text('|', style: TextStyle(color: Colors.grey)),
                    TextButton(
                      onPressed: () {},
                      child: const Text('비밀번호 찾기', style: TextStyle(color: Colors.grey)),
                    ),
                  ],
                ),

                SizedBox(height: h * 0.04),

                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    'assets/images/Group223.png',
                    width: 346,
                    height: 53,
                    fit: BoxFit.contain,
                  ),
                ),

                SizedBox(height: h * 0.03),

                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    'assets/images/kakao_login_medium_wide.png',
                    width: 342,
                    height: 70,
                    fit: BoxFit.contain,
                  ),
                ),

                SizedBox(height: h * 0.02),

                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/signupStart');
                  },
                  child: Image.asset(
                    'assets/images/button1.png',
                    width: 342,
                    height: 40,
                    fit: BoxFit.contain,
                  ),
                ),

                SizedBox(height: h * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}