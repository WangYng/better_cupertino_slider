import 'package:flutter/material.dart';
import 'package:better_cupertino_slider/better_cupertino_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double sliderValue = 2.5;
  final double maxValue = 5.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Current Value : ${sliderValue.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: Colors.redAccent,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("normal"),
              ),
              Container(
                constraints: BoxConstraints.expand(height: 44),
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: BetterCupertinoSlider(
                  min: 0.0,
                  max: maxValue,
                  value: sliderValue,
                  configure: BetterCupertinoSliderConfigure(),
                  onChanged: (value) {
                    setState(() {
                      sliderValue = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("custom track and thumb"),
              ),
              Container(
                constraints: BoxConstraints.expand(height: 44),
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: BetterCupertinoSlider(
                  min: 0.0,
                  max: maxValue,
                  value: sliderValue,
                  configure: BetterCupertinoSliderConfigure(
                    trackHorizontalPadding: 8.0,
                    trackHeight: 6.0,
                    trackLeftColor: Colors.greenAccent,
                    trackRightColor: Colors.redAccent,
                  ),
                  onChanged: (value) {
                    setState(() {
                      sliderValue = value;
                    });
                  },
                  onChangeStart: (value) {},
                  onChangeEnd: (value) {},
                ),
              ),
              Container(
                constraints: BoxConstraints.expand(height: 44),
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: BetterCupertinoSlider(
                  min: 0.0,
                  max: maxValue,
                  value: sliderValue,
                  configure: BetterCupertinoSliderConfigure(
                    trackHorizontalPadding: 8.0,
                    trackHeight: 4.0,
                    trackLeftColor: const Color(0xFFFF6B26),
                    trackRightColor: const Color(0xFFE3E9EF),
                    thumbRadius: 8.0,
                    thumbPainter: (canvas, rect) {
                      final RRect rrect = RRect.fromRectAndRadius(
                        rect,
                        Radius.circular(rect.shortestSide / 2.0),
                      );
                      const Color borderColor = Color(0x08000000);

                      // draw shadow
                      for (final BoxShadow shadow in kBetterSliderBoxShadows)
                        canvas.drawRRect(
                            rrect.shift(shadow.offset), shadow.toPaint());

                      // draw border
                      canvas.drawRRect(
                        rrect.inflate(0.5),
                        Paint()..color = borderColor,
                      );

                      // draw background
                      canvas.drawRRect(rrect, Paint()..color = Colors.white);

                      // draw center point
                      canvas.drawRRect(
                          rrect.deflate(4), Paint()..color = Color(0xFFFF671F));
                    },
                  ),
                  onChanged: (value) {
                    setState(() {
                      sliderValue = value;
                    });
                  },
                  onChangeStart: (value) {},
                  onChangeEnd: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("step"),
              ),
              Container(
                constraints: BoxConstraints.expand(height: 44),
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: BetterCupertinoSlider(
                  min: 0.0,
                  max: maxValue,
                  value: sliderValue,
                  configure: BetterCupertinoSliderConfigure(),
                  onChanged: (value) {
                    setState(() {
                      sliderValue = value;
                    });
                  },
                  onChangeStart: (value) {},
                  onChangeEnd: (value) {
                    setState(() {
                      sliderValue = value.round().toDouble();
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("no thumb"),
              ),
              Container(
                constraints: BoxConstraints.expand(height: 44),
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: BetterCupertinoSlider(
                  min: 0.0,
                  max: maxValue,
                  value: sliderValue,
                  configure: BetterCupertinoSliderConfigure(
                    thumbRadius: 2,
                    thumbPainter: (canvas, rect) {},
                  ),
                  onChangeStart: (value) {},
                  onChangeEnd: (value) {
                    setState(() {
                      sliderValue = value.round().toDouble();
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
