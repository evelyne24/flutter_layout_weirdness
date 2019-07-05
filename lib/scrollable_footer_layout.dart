import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScrollableFooterLayout extends StatelessWidget {
  const ScrollableFooterLayout({
    Key key,
    @required this.children,
    @required this.footer,
    this.padding = EdgeInsets.zero,
  })  : assert(children != null),
        assert(footer != null),
        super(key: key);

  final List<Widget> children;
  final Widget footer;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final mediaQuery = MediaQuery.of(context);
        return SingleChildScrollView(
          padding: padding + EdgeInsets.only(bottom: mediaQuery.padding.bottom),
          child: MinHeightOrUnbounded(
            minHeight: constraints.maxHeight -
                padding.vertical -
                mediaQuery.padding.bottom,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                ),
                footer,
              ],
            ),
          ),
        );
      },
    );
  }
}

class MinHeightOrUnbounded extends SingleChildRenderObjectWidget {
  const MinHeightOrUnbounded({
    Key key,
    @required this.minHeight,
    @required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  final double minHeight;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderMinHeightOrUnbounded(
      minHeight: minHeight,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderMinHeightOrUnbounded renderObject) {
    renderObject..minHeight = minHeight;
  }
}

class RenderMinHeightOrUnbounded extends RenderProxyBox {
  RenderMinHeightOrUnbounded({
    double minHeight,
    RenderBox child,
  })  : _minHeight = minHeight,
        super(child);

  double _minHeight;

  set minHeight(double value) {
    if (_minHeight != value) {
      _minHeight = value;
      markNeedsLayout();
    }
  }

  @override
  void performLayout() {
    child.layout(constraints.copyWith(minHeight: _minHeight),
        parentUsesSize: true);
    size = child.size;
  }
}
