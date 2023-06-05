import 'package:flutter/material.dart';
import 'package:routine/constants/sizes.dart';
import 'package:routine/screens/widgets/routine_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController _pageController;
  final List<Widget> _pages = [
    const RoutinePage(),
    const RoutinePage(),
    const RoutinePage()
  ];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _addPage() {
    setState(() {
      _pages.add(const RoutinePage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _pages.length,
            onPageChanged: (index) => setState(() => _currentIndex = index),
            itemBuilder: (context, index) {
              return _pages[index];
            },
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: Sizes.size12),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity:
                      MediaQuery.of(context).viewInsets.bottom == 0 ? 1 : 0,
                  child: const Text(
                    "ROUTINE",
                    style: TextStyle(
                      fontSize: Sizes.size24,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      letterSpacing: Sizes.size10,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
