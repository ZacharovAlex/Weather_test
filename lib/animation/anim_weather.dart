
import 'package:flutter/material.dart';

import '../gen/assets/assets.gen.dart';


class Story1 extends StatefulWidget {
  const Story1({Key? key}) : super(key: key);

  @override
  State<Story1> createState() => _Story1State();
}

class _Story1State extends State<Story1> with SingleTickerProviderStateMixin {
  final phoneAnimInterval = 0.3;
  final stickerAnimInterval = 0.6;
  final dialogAnimInterval = 0.8;
  late final AnimationController _controller =
  AnimationController(vsync: this, duration: Duration(milliseconds: 12000));
  late final _phonePositionAnim = Tween(begin: const Offset(1, 0), end: Offset.zero).animate(CurvedAnimation(
      parent: _controller, curve: Interval(0, phoneAnimInterval, curve: Curves.easeInOutCubic)));
  late final _phoneFadeOutAnim = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller, curve: Interval(0, phoneAnimInterval, curve: Curves.easeInOutCubic)));


  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  color: Colors.transparent,
                  // margin: const EdgeInsets.only(top: 35),
                  child: SlideTransition(
                    position: _phonePositionAnim,
                    child: FadeTransition(opacity: _phoneFadeOutAnim, child: Assets.icons.sun.svg()),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                 // margin: const EdgeInsets.only(top: 35),
                  child: SlideTransition(
                    position: _phonePositionAnim,
                    child: FadeTransition(opacity: _phoneFadeOutAnim, child: Assets.icons.cloud2.svg()),
                  ),
                ),



              ],
            ),
          ),
        ],
      );

  }
}
class Gbnbn extends InheritedWidget{
 const Gbnbn({required super.child});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    throw UnimplementedError();
  }
  
}
