import 'dart:html';
import 'dart:ui' as ui;

// import 'package:experiments_with_web/app_level/extensions/hover_extension.dart';
// import 'package:experiments_with_web/app_level/utilities/screen_size.dart';
// import 'package:experiments_with_web/app_level/widgets/desktop/custom_drawer.dart';
// import 'package:experiments_with_web/app_level/widgets/desktop/custom_scaffold.dart';
// import 'package:experiments_with_web/app_level/widgets/desktop/generic_dialog.dart';
// import 'package:experiments_with_web/iframe/utilities/constants.dart';
// import 'package:experiments_with_web/iframe/widgets/bottom_sheet.dart';

import 'package:flutter/material.dart';

class IframeScreen extends StatefulWidget {
  const IframeScreen({Key? key}) : super(key: key);

  @override
  _IframeScreenState createState() => _IframeScreenState();
}

class _IframeScreenState extends State<IframeScreen> {

  final IFrameElement _iframeElement = IFrameElement();

  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _iframeElement.height = '500';
    _iframeElement.width = '500';

    _iframeElement.src = 'https://www.youtube.com/embed/bYQJp8XQd6U';
    _iframeElement.style.border = 'none';

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
          (int viewId) => _iframeElement,
    );

    // _iframeWidget = HtmlElementView(
    //   key: UniqueKey(),
    //   viewType: 'iframeElement',
    // );
  }

  @override
  Widget build(BuildContext context) {
    //
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;


    return Scaffold(
      body: Center(
        child: Text('TEST'),
      ),
    );

  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  bool _isValidURL(String text) {
    return Uri.parse(text).isAbsolute;
  }


}





class IFrameConstants {
  IFrameConstants._();

  static const String youtube = 'https://www.youtube.com/watch?v=L4iLMRHVmZ8';

  static const String website =
      'https://flatteredwithflutter.com/flutter-web-and-iframe/';

  static const String medium =
      'https://medium.com/flutter-community/flutter-web-and-iframe-f26399aa1e2a';

  static const String devTo =
      'https://dev.to/aseemwangoo/flutter-web-and-iframe-n2d';
}