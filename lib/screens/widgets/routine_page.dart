import 'package:flutter/material.dart';

import '../../constants/sizes.dart';

class RoutinePage extends StatelessWidget {
  const RoutinePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          RoutineType(),
          RoutineName(),
        ],
      ),
    );
  }
}

class RoutineName extends StatelessWidget {
  const RoutineName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.5,
      child: TextField(
        decoration: InputDecoration(
          isDense: true,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black.withAlpha(70),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black.withAlpha(70),
            ),
          ),
        ),
        style: const TextStyle(
          color: Colors.white,
          fontSize: Sizes.size24,
          fontWeight: FontWeight.w300,
        ),
        textAlign: TextAlign.center,
        cursorColor: Colors.white,
        maxLines: 1,
      ),
    );
  }
}

class RoutineType extends StatelessWidget {
  const RoutineType({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.size72,
      height: Sizes.size28,
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(30),
        borderRadius: BorderRadius.circular(Sizes.size6),
      ),
      child: const Center(
        child: Text(
          "상체",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
