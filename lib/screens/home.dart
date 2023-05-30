import 'package:flutter/material.dart';
import 'package:routine/constants/sizes.dart';
import 'package:routine/screens/widgets/routine_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(itemBuilder: (context, index) {
            return const RoutinePage();
          }),
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
