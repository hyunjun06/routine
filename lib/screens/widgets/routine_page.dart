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
          RoutineDate(),
        ],
      ),
    );
  }
}

class RoutineDate extends StatelessWidget {
  const RoutineDate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [],
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

class RoutineType extends StatefulWidget {
  const RoutineType({
    super.key,
  });

  @override
  State<RoutineType> createState() => _RoutineTypeState();
}

class _RoutineTypeState extends State<RoutineType>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  final _typeList = ["상체", "하체", "코어", "전신"];
  int _typeIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      lowerBound: 0.25,
      upperBound: 1,
    )
      ..stop()
      ..value = 1;
  }

  void _nextIndex() {
    _animationController
      ..stop()
      ..value = 0.25
      ..forward();
    setState(() {
      _typeIndex = (_typeIndex + 1) % _typeList.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _nextIndex,
      child: ScaleTransition(
        scale: CurvedAnimation(
          parent: _animationController,
          curve: Curves.elasticOut,
        ),
        child: Container(
          width: Sizes.size72,
          height: Sizes.size28,
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(30),
            borderRadius: BorderRadius.circular(Sizes.size6),
          ),
          child: Center(
            child: Text(
              _typeList[_typeIndex],
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
