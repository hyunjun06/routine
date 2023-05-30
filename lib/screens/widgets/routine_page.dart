import 'package:flutter/material.dart';
import 'package:routine/constants/gaps.dart';

import '../../constants/sizes.dart';

class RoutinePage extends StatefulWidget {
  const RoutinePage({
    super.key,
  });

  @override
  State<RoutinePage> createState() => _RoutinePageState();
}

class _RoutinePageState extends State<RoutinePage> {
  final _colors = [
    Colors.pink,
    Colors.cyan,
    Colors.green,
    Colors.lime,
  ];
  int _colorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        color: _colors[_colorIndex],
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.size32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TopSection(
                refreshBackground: () => setState(() {
                  _colorIndex++;
                  _colorIndex %= _colors.length;
                }),
              ),
              const BottomSection()
            ],
          ),
        ),
      ),
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [RoutineData(), Gaps.v24, RoutineSetData()],
    );
  }
}

class RoutineSetData extends StatefulWidget {
  const RoutineSetData({
    super.key,
  });

  @override
  State<RoutineSetData> createState() => _RoutineSetDataState();
}

class _RoutineSetDataState extends State<RoutineSetData> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: Sizes.size96,
          height: Sizes.size72,
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(30),
            borderRadius: BorderRadius.circular(Sizes.size12),
          ),
          child: const TextField(
            keyboardType: TextInputType.number,
            maxLength: 2,
            decoration: InputDecoration(
              border: InputBorder.none,
              counterText: "",
            ),
            style: TextStyle(
              color: Colors.white,
              fontSize: Sizes.size60,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
            cursorColor: Colors.white,
          ),
        ),
        Gaps.h4,
        const Text(
          "SET",
          style: TextStyle(
            color: Colors.white,
            fontSize: Sizes.size32,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}

class RoutineData extends StatefulWidget {
  const RoutineData({
    super.key,
  });

  @override
  State<RoutineData> createState() => _RoutineDataState();
}

class _RoutineDataState extends State<RoutineData> {
  int _leftData = 0, _rightData = 0;
  final RoutineTypeController _leftController = RoutineTypeController(),
      _rightController = RoutineTypeController();

  void _incrementLeftData(bool isReverse) {
    setState(() {
      _leftData += isReverse ? -1 : 1;
      if (_leftData < 0) _leftData = 0;
      if (_leftData > 100) _leftData = 100;
    });
  }

  void _incrementRightData(bool isReverse) {
    if (_rightController.initIndex == 1) return;
    setState(() {
      _rightData += isReverse ? -1 : 1;
      if (_rightData < 0) _rightData = 0;
      if (_rightData > 100) _rightData = 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () => _incrementLeftData(true),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    shape: const CircleBorder(),
                  ),
                  child: const Text(
                    "-",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.size24,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Text(
                  _leftData.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size40,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                TextButton(
                  onPressed: () => _incrementLeftData(false),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    shape: const CircleBorder(),
                  ),
                  child: const Text(
                    "+",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.size24,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
            RoutineType(
              typeList: const ["REP", "SEC"],
              controller: _leftController,
            )
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () => _incrementRightData(true),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    shape: const CircleBorder(),
                  ),
                  child: Text(
                    "-",
                    style: TextStyle(
                      color: _rightController.initIndex == 0
                          ? Colors.white
                          : Colors.black.withAlpha(30),
                      fontSize: Sizes.size24,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Text(
                  _rightData.toString(),
                  style: TextStyle(
                    color: _rightController.initIndex == 0
                        ? Colors.white
                        : Colors.black.withAlpha(30),
                    fontSize: Sizes.size40,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                TextButton(
                  onPressed: () => _incrementRightData(false),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    shape: const CircleBorder(),
                  ),
                  child: Text(
                    "+",
                    style: TextStyle(
                      color: _rightController.initIndex == 0
                          ? Colors.white
                          : Colors.black.withAlpha(30),
                      fontSize: Sizes.size24,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
            RoutineType(
              typeList: const ["KG", "NONE"],
              controller: _rightController,
              onTouch: () => setState(() {}),
            ),
          ],
        )
      ],
    );
  }
}

class TopSection extends StatefulWidget {
  final Function refreshBackground;

  const TopSection({
    super.key,
    required this.refreshBackground,
  });

  @override
  State<TopSection> createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection> {
  final _controller = RoutineTypeController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RoutineType(
          typeList: const ["상체", "하체", "코어", "기타"],
          controller: _controller,
          onTouch: widget.refreshBackground,
        ),
        Gaps.v12,
        const RoutineName(),
        Gaps.v12,
        const RoutineDate(),
      ],
    );
  }
}

class RoutineDate extends StatefulWidget {
  const RoutineDate({
    super.key,
  });

  @override
  State<RoutineDate> createState() => _RoutineDateState();
}

class _RoutineDateState extends State<RoutineDate> {
  DateTime _dateTime = DateTime.now();

  void _nextDate(bool isReverse) {
    setState(() {
      _dateTime = _dateTime.add(Duration(days: isReverse ? -1 : 1));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () => _nextDate(true),
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            shape: const CircleBorder(),
          ),
          child: const Text("-"),
        ),
        Gaps.h12,
        Text(
          "${_dateTime.month}/${_dateTime.day}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: Sizes.size24,
            fontWeight: FontWeight.w300,
          ),
        ),
        Gaps.h12,
        TextButton(
          onPressed: () => _nextDate(false),
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            shape: const CircleBorder(),
          ),
          child: const Text("+"),
        ),
      ],
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
          hintText: "운동 이름",
          hintStyle: const TextStyle(
            color: Colors.white,
          ),
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
  final List<String> typeList;
  final RoutineTypeController controller;
  final Function? onTouch;

  const RoutineType({
    super.key,
    required this.typeList,
    required this.controller,
    this.onTouch,
  });

  @override
  State<RoutineType> createState() => _RoutineTypeState();
}

class _RoutineTypeState extends State<RoutineType>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

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

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _nextIndex() {
    _animationController
      ..stop()
      ..value = 0.25
      ..forward();
    setState(() {
      widget.controller.initIndex =
          (widget.controller.initIndex + 1) % widget.typeList.length;
    });
    if (widget.onTouch != null) widget.onTouch!();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _nextIndex,
      behavior: HitTestBehavior.translucent,
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
              widget.typeList[widget.controller.initIndex],
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class RoutineTypeController {
  int initIndex = 0;
}
