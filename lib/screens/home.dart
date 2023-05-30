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
          const SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: Sizes.size12),
                child: Text(
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
        ],
      ),
    );
  }
}
