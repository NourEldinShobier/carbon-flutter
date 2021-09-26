import 'package:flutter/widgets.dart';
import 'package:carbon/shared/index.dart';

import 'package:vector_math/vector_math_64.dart' as VectorMath;

class COutline extends StatefulWidget {
  const COutline({
    Key? key,
    required this.child,
    this.color = CColors.white0,
    this.outlineWidth = 8,
    this.outlined = false,
    this.animationDuration = 250,
    this.borderRadius,
    this.animationCurve = Curves.easeInOut,
  }) : super(key: key);

  final Widget child;

  final Color color;

  final double outlineWidth;

  /// [ture] if you want to outline the child widget
  final bool outlined;

  final BorderRadius? borderRadius;

  final int animationDuration;

  final Curve animationCurve;

  @override
  _COutlineWidgetState createState() => _COutlineWidgetState();
}

class _COutlineWidgetState extends State<COutline> with TickerProviderStateMixin {
  var _itemKey = GlobalKey();

  Size? _size;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.animationDuration),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: widget.animationCurve,
    );

    super.initState();
  }

  @override
  void didChangeDependencies() {
    _animationController.duration = Duration(
      milliseconds: widget.animationDuration,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: widget.animationCurve,
    );

    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(oldWidget) {
    _calculateSize();

    if (widget.outlined) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }

    super.didUpdateWidget(oldWidget);
  }

  ///
  VectorMath.Vector3 _calculateScaleVector(double outlineWidth) {
    var value = VectorMath.Vector3(
      2 * outlineWidth / _size!.width,
      2 * outlineWidth / _size!.height,
      0.0,
    );

    return (value + VectorMath.Vector3.all(1.0)) * _animation.value;
  }

  void _calculateSize() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (_itemKey.currentContext?.size != _size) {
        setState(() {});
      }
      _size = _itemKey.currentContext?.size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        if (_size != null)
          AnimatedBuilder(
            animation: _animation,
            builder: (_, __) {
              final scaleFactor = _calculateScaleVector(widget.outlineWidth);
              return Stack(
                alignment: Alignment.center,
                children: [
                  Opacity(
                    opacity: 1,
                    child: Transform(
                      transform: Matrix4.compose(
                        VectorMath.Vector3.zero(),
                        VectorMath.Quaternion.identity(),
                        scaleFactor,
                      ),
                      origin: Offset(_size!.width / 2.0, _size!.height / 2.0),
                      child: Container(
                        width: _size!.width,
                        height: _size!.height,
                        decoration: BoxDecoration(
                          color: widget.color,
                          borderRadius: widget.borderRadius,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        SizedBox(key: _itemKey, child: widget.child),
      ],
    );
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }
}
