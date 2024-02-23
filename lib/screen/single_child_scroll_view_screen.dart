import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_scrollable_widgets/const/colors.dart';
import 'package:flutter_scrollable_widgets/layout/main_layout.dart';

class SingleChildScrollViewScreen extends StatelessWidget {
  final List<int> numbers = List.generate(
    100,
    (index) => index,
  );

  SingleChildScrollViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'SingleChildScrollView',
      body: renderPreformance(),
    );
  }

  //1. 기본 렌더링법
  Widget renderSimple() {
    return SingleChildScrollView(
      child: Column(
        children: rainbowColors
            .map(
              (e) => renderContainar(
                color: e,
              ),
            )
            .toList(),
      ),
    );
  }

  //2. 화면 안넘어가도 스크롤 되게 하기
  Widget renderAlwaysScroll() {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      //NeverScrollableScrollPhysics() => 스크롤 안됨
      child: Column(
        children: [
          renderContainar(
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  //3. 위젯이 잘리지 않게 하기
  Widget renderClip() {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: [
          renderContainar(
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  //4. 여러가지 physics 정리
  Widget renderPhysics() {
    return SingleChildScrollView(
      //NeverScrollableScrollPhysics() => 스크롤 안됨
      //AlwaysScrollableScrollPhysics() => 스크롤 됨
      //BouncingScrollPhysics() => ios 스타일 스크롤
      //ClampingScrollPhysics() => android 스타일 스크롤
      physics: ClampingScrollPhysics(),
      child: Column(
        children: rainbowColors
            .map(
              (e) => renderContainar(
                color: e,
              ),
            )
            .toList(),
      ),
    );
  }

  //5. SingleChildView 퍼포먼스
  Widget renderPreformance() {
    return SingleChildScrollView(
      child: Column(
        children: numbers
            .map(
              (e) => renderContainar(
                color: rainbowColors[e % rainbowColors.length],
                index: e,
              ),
            )
            .toList(),
      ),
    );
  }

  Widget renderContainar({
    required Color color,
    int? index,
  }) {
    if (index != null) {
      print(index);
    }

    return Container(
      height: 300,
      color: color,
    );
  }
}
