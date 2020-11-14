import 'package:flutter/material.dart';

class SliverTitle extends StatefulWidget {
  final Widget child;

  const SliverTitle({
    @required this.child,
  });

  @override
  _SliverTitleState createState() {
    return _SliverTitleState();
  }
}

class _SliverTitleState extends State<SliverTitle> {
  ScrollPosition _position;
  bool _visible;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _removeListener();
    _addListener();
  }

  @override
  void dispose() {
    _removeListener();
    super.dispose();
  }

  void _addListener() {
    _position = Scrollable.of(context)?.position;
    _position?.addListener(_positionListener);
    _positionListener();
  }

  void _removeListener() {
    _position?.removeListener(_positionListener);
  }

  void _positionListener() {
    final FlexibleSpaceBarSettings settings = context
        .dependOnInheritedWidgetOfExactType(aspect: FlexibleSpaceBarSettings);
    bool visible = settings == null ||
        settings.currentExtent >= MediaQuery.of(context).size.height * 0.3;
    if (_visible != visible) {
      setState(() {
        _visible = visible;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _visible,
      child: widget.child,
    );
  }
}
