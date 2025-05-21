import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    double scaleW(double x) => x * w / 375;
    double scaleH(double y) => y * h / 812;

    final onboardingData = [
      {
        'icons': [
          {
            'src': 'assets/images/bread.png',
            'x': -30.0,
            'y': 319.0,
            'w': 75.09,
            'h': 67.0,
            'angle': 0,
          },
          {
            'src': 'assets/images/icecream.png',
            'x': 117.81,
            'y': 314.0,
            'w': 66.0,
            'h': 90.0,
            'angle': -5,
          },
          {
            'src': 'assets/images/sweetpotato.png',
            'x': 255.0,
            'y': 327.0,
            'w': 62.0,
            'h': 66.0,
            'angle': 0,
          },
          {
            'src': 'assets/images/ramen.png',
            'x': 68.0,
            'y': 468.0,
            'w': 93.0,
            'h': 56.0,
            'angle': 0,
          },
          {
            'src': 'assets/images/pumpkin.png',
            'x': 204.0,
            'y': 457.0,
            'w': 71.24,
            'h': 68.0,
            'angle': 0,
          },
          {
            'src': 'assets/images/apple.png',
            'x': 340.4,
            'y': 439.47,
            'w': 90.87,
            'h': 100.87,
            'angle': -30,
          },
        ],
        'blurs': [
          {'src': 'assets/images/blur1.png', 'x': -30.0, 'y': 291.0},
          {'src': 'assets/images/blur2.png', 'x': 88.0, 'y': 291.0},
          {'src': 'assets/images/blur3.png', 'x': 224.0, 'y': 291.0},
          {'src': 'assets/images/blur5.png', 'x': 42.0, 'y': 427.0},
          {'src': 'assets/images/blur6.png', 'x': 178.0, 'y': 427.0},
          {'src': 'assets/images/blur7.png', 'x': 300.0, 'y': 427.0},
        ]
      },
      {
        'icons': [
          {
            'src': 'assets/images/Asset12.png',
            'x': 45.25,
            'y': 284.2,
            'w': 290.5,
            'h': 290.5,
            'angle': 0,
          }
        ],
        'blurs': []
      },
      {
        'icons': [
          {
            'src': 'assets/images/Asset19.png',
            'x': 60.6,
            'y': 308.56,
            'w': 270.75,
            'h': 270.75,
            'angle': 0,
          }
        ],
        'blurs': []
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: onboardingData.length,
              onPageChanged: (index) => setState(() => _currentIndex = index),
              itemBuilder: (context, index) {
                final page = onboardingData[index];
                return Stack(
                  children: [
                    Positioned(
                      top: h * 0.22,
                      left: w * -0.1,
                      width: w * 1.2,
                      height: w * 1.2,
                      child: Image.asset('assets/images/Ellipse32.png', fit: BoxFit.contain),
                    ),
                    if (index == 0) ...[
                      Positioned(
                        top: h * 0.27,
                        left: w * -0.3,
                        width: w * 0.75,
                        height: w * 0.75,
                        child: Image.asset('assets/images/Rectangle361.png'),
                      ),
                      Positioned(
                        top: h * 0.43,
                        left: w - w * 0.5,
                        width: w * 0.75,
                        height: w * 0.75,
                        child: Image.asset('assets/images/Rectangle360.png'),
                      ),
                    ],
                    for (final blur in page['blurs'] as List)
                      Positioned(
                        left: scaleW(blur['x']),
                        top: scaleH(blur['y']),
                        width: scaleW(124),
                        height: scaleH(124),
                        child: Image.asset(blur['src'], fit: BoxFit.contain),
                      ),
                    for (final icon in page['icons'] as List)
                      Positioned(
                        left: scaleW(icon['x']),
                        top: scaleH(icon['y']),
                        width: scaleW(icon['w']),
                        height: scaleH(icon['h']),
                        child: icon['angle'] != 0
                            ? Transform.rotate(
                                angle: (icon['angle'] as num) * 3.1415926535 / 180,
                                child: Image.asset(icon['src'], fit: BoxFit.contain),
                              )
                            : Image.asset(icon['src'], fit: BoxFit.contain),
                      ),
                    Positioned(
                      top: scaleH(142),
                      left: scaleW(51),
                      right: scaleW(0),
                      child: SizedBox(
                        width: scaleW(289),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _currentIndex == 0
                                  ? '필요 없는 식재료는 나누고,'
                                  : _currentIndex == 1
                                      ? '모두의 냉장고, 버려지는 음식'
                                      : '혼자보다 함께, 우리 집 앞',
                              style: const TextStyle(
                                fontFamily: 'Noto Sans KR',
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                height: 1.55,
                                color: Colors.black,
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(-scaleW(8), 0),
                              child: Text(
                                _currentIndex == 0
                                    ? '필요한 건 학우에게서 받아요'
                                    : _currentIndex == 1
                                        ? '대신 정이 오가는 공간을 만들어요'
                                        : '냉장고에서 시작되는 나눔의 맛',
                                style: const TextStyle(
                                  fontFamily: 'Noto Sans KR',
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  height: 1.55,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Positioned(
              bottom: h * 0.17,
              left: (w - 80) / 2,
              child: Row(
                children: List.generate(onboardingData.length, (index) {
                  final isActive = index == _currentIndex;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: isActive ? 30 : 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: isActive ? const Color(0xFF657AE3) : const Color(0xFFE4E9FF),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  );
                }),
              ),
            ),
            Positioned(
              bottom: h * 0.07,
              left: w * 0.065,
              width: w * 0.87,
              height: h * 0.065,
              child: GestureDetector(
                onTapDown: (_) => setState(() => _isPressed = true),
                onTapUp: (_) {
                  setState(() => _isPressed = false);
                  if (_currentIndex == 2) {
                    Navigator.pushNamed(context, '/login');
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  }
                },
                child: Image.asset(
                  _currentIndex == 2
                      ? 'assets/images/CTA.png'
                      : _isPressed
                          ? 'assets/images/Group2351.png'
                          : 'assets/images/Group235.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            if (_currentIndex < 2)
              Positioned(
                bottom: h * 0.035,
                left: (w - 40) / 2,
                child: GestureDetector(
                  onTap: () => _pageController.jumpToPage(2),
                  child: const Text(
                    "건너뛰기",
                    style: TextStyle(color: Color(0xFF6B6B6B), fontSize: 12),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}