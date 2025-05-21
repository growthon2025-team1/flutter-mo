import 'package:flutter/material.dart';
import 'package:my_app/api/user_info.dart';

class HomeScreen extends StatefulWidget {
  final String token;

  const HomeScreen({super.key, required this.token});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? userName;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  Future<void> fetchUser() async {
    try {
      final userInfo = await getUserInfo(widget.token);
      debugPrint('${widget.token}');
      debugPrint('사용자 정보: $userInfo');
      setState(() {
        userName = userInfo['nickname'] ?? '사용자';
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        userName = '알 수 없음';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('메인화면')),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                '메인화면\n안녕하세요, $userName 님!',
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
