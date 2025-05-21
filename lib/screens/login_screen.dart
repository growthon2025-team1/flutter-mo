import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  final FocusNode _idFocus = FocusNode();
  final FocusNode _pwFocus = FocusNode();

  bool _showIdError = false;
  bool _showPwError = false;

  @override
  void dispose() {
    _idController.dispose();
    _pwController.dispose();
    _idFocus.dispose();
    _pwFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    double scaleW(double x) => x * w / 375;
    double scaleH(double y) => y * h / 812;

    final bool isValid = !_showIdError && !_showPwError &&
        _idController.text == 'dandan2' && _pwController.text == 'dandan1234!';

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: scaleW(125),
            top: scaleH(82),
            width: scaleW(150),
            height: scaleH(30),
            child: const Text(
              '혼자여도 함께인 식탁',
              style: TextStyle(
                fontFamily: 'Noto Sans KR',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1.85,
                color: Color(0xFF000000),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            left: scaleW(22),
            top: scaleH(249),
            child: const Text(
              '아이디',
              style: TextStyle(
                fontFamily: 'Noto Sans KR',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                height: 1.65,
                color: Color(0xFF000000),
              ),
            ),
          ),
          Positioned(
            left: scaleW(22),
            top: scaleH(277),
            child: SizedBox(
              width: scaleW(346),
              height: scaleH(42),
              child: TextField(
                controller: _idController,
                focusNode: _idFocus,
                cursorColor: _showIdError ? const Color(0xFFDE4242) : const Color(0xFF657AE3),
                style: const TextStyle(fontSize: 12),
                onChanged: (text) {
                  setState(() {
                    _showIdError = text != 'dandan2';
                  });
                },
                decoration: InputDecoration(
                  hintText: _idFocus.hasFocus ? null : '아이디를 입력해 주세요.',
                  hintStyle: const TextStyle(
                    fontFamily: 'Noto Sans KR',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    height: 1.65,
                    color: Color(0xFF929292),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  suffixIcon: _showIdError
                      ? Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Image.asset(
                            'assets/images/error_icon.png',
                            width: 18,
                            height: 18,
                          ),
                        )
                      : null,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: _showIdError ? const Color(0xFFDE4242) : const Color(0xFF929292),
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: _showIdError ? const Color(0xFFDE4242) : const Color(0xFF929292),
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (_showIdError)
            Positioned(
              left: scaleW(24),
              top: scaleH(323),
              child: const Text(
                '아이디 또는 비밀번호가 틀렸습니다.',
                style: TextStyle(color: Color(0xFFDE4242), fontSize: 10),
              ),
            ),
          Positioned(
            left: scaleW(22),
            top: scaleH(333),
            child: const Text(
              '비밀번호',
              style: TextStyle(
                fontFamily: 'Noto Sans KR',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                height: 1.65,
                color: Color(0xFF000000),
              ),
            ),
          ),
          Positioned(
            left: scaleW(22),
            top: scaleH(361),
            child: SizedBox(
              width: scaleW(346),
              height: scaleH(42),
              child: TextField(
                controller: _pwController,
                focusNode: _pwFocus,
                obscureText: true,
                cursorColor: _showPwError ? const Color(0xFFDE4242) : const Color(0xFF657AE3),
                style: const TextStyle(fontSize: 12),
                onChanged: (text) {
                  setState(() {
                    _showPwError = text != 'dandan1234!';
                  });
                },
                decoration: InputDecoration(
                  hintText: _pwFocus.hasFocus ? null : '비밀번호(특수문자 포함 8자 이상)',
                  hintStyle: const TextStyle(
                    fontFamily: 'Noto Sans KR',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    height: 1.65,
                    color: Color(0xFF929292),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  suffixIcon: _showPwError
                      ? Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Image.asset(
                            'assets/images/error_icon.png',
                            width: 18,
                            height: 18,
                          ),
                        )
                      : (_pwFocus.hasFocus
                          ? Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Image.asset(
                                'assets/images/NoPreview1.png',
                                width: 20,
                                height: 20,
                              ),
                            )
                          : null),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: _showPwError ? const Color(0xFFDE4242) : const Color(0xFF929292),
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: _showPwError ? const Color(0xFFDE4242) : const Color(0xFF929292),
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (_showPwError)
            Positioned(
              left: scaleW(24),
              top: scaleH(407),
              child: const Text(
                '아이디 또는 비밀번호가 틀렸습니다.',
                style: TextStyle(color: Color(0xFFDE4242), fontSize: 10),
              ),
            ),
          Positioned(
            left: scaleW(131),
            top: scaleH(_showPwError ? 432 : 412),
            child: Row(
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    '아이디 찾기',
                    style: TextStyle(fontSize: 10, color: Color(0xFF6B6B6B)),
                  ),
                ),
                const Text(' | ', style: TextStyle(color: Color(0xFFD9D9D9))),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    '비밀번호 찾기',
                    style: TextStyle(fontSize: 10, color: Color(0xFF6B6B6B)),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: scaleW(22),
            top: scaleH(462),
            child: GestureDetector(
              onTap: () {
                if (isValid) {
                  Navigator.pushNamed(context, '/home');
                }
              },
              child: Image.asset(
                isValid ? 'assets/images/Group245.png' : 'assets/images/Group223.png',
                width: scaleW(346),
                height: scaleH(53),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            left: scaleW(24),
            top: scaleH(631),
            child: GestureDetector(
              onTap: () {
                print('카카오 로그인 버튼 눌림');
              },
              child: Image.asset(
                'assets/images/kakao-icon.png',
                width: scaleW(342),
                height: scaleH(70),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            left: scaleW(24),
            top: scaleH(721),
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/signupStart'),
              child: Image.asset(
                'assets/images/button1.png',
                width: scaleW(342),
                height: scaleH(40),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
