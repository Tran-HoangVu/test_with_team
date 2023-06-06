import 'package:flutter/material.dart';

class CardStackListView extends StatefulWidget {
  @override
  _CardStackListViewState createState() => _CardStackListViewState();
}

class _CardStackListViewState extends State<CardStackListView> {
  final List<int> items = List.generate(10, (index) => index);
  final double cardHeight = 200.0;
  final double cardWidth = 340.0;
  final double opacityFocused = 1.0;
  final double opacityUnfocused = 0.3;

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: cardHeight,
          child: PageView.builder(
            scrollDirection: Axis.vertical,
            reverse: false,
            physics: const ScrollPhysics(),
            controller: PageController(
              viewportFraction: cardHeight / MediaQuery.of(context).size.height,
              initialPage: currentIndex,
            ),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              final int pageIndex = index % items.length;
              final double scaleFactor =
                  1 - (pageIndex - currentIndex).abs() * 0.2;
              final double opacity =
                  pageIndex == currentIndex ? opacityFocused : opacityUnfocused;

              return Transform.scale(
                scale: scaleFactor,
                child: Opacity(
                  opacity: opacity,
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(currentIndex == pageIndex ? 0.0 : 0.3),
                    alignment: Alignment.center,
                    child: Card(
                      elevation: 4.0,
                      child: Container(
                        color: Colors.pink,
                        height: cardHeight,
                        width: cardWidth,
                        child: Center(
                          child: Text('Card ${items[pageIndex]}'),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index % items.length;
              });
            },
          ),
        ),
      ),
    );
  }
}
