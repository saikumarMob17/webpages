import 'dart:html';

import 'package:flutter/material.dart';
import 'package:web_example/html_element.dart';

class IframeWidget extends HtmlElementWidget {
  const IframeWidget({
    Key? key,
    @required this.src,
    this.width = 640.0,
    this.height = 360.0,
    this.style = 'border: none;',
    this.allow =
        'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture',
    this.allowFullscreen = true,
  }) : super();

  final String? src;

  final double width;
  final double height;
  final String style;
  final String allow;
  final bool allowFullscreen;

  @override
  HtmlElement createHtmlElement(BuildContext context) {
    return IFrameElement()
      ..width = width.toString()
      ..height = height.toString()
      ..src = src
      ..style.cssText = style
      ..allow = allow
      ..allowFullscreen = allowFullscreen;
  }
}
