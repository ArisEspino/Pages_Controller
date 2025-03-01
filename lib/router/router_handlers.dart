import 'package:fluro/fluro.dart';
import 'package:flutter_application_2/provider/page_provider.dart';
import 'package:flutter_application_2/ui/pages/home_page.dart';
import 'package:provider/provider.dart';

final homeHandler = Handler(
  // ignore: body_might_complete_normally_nullable
  handlerFunc: (context, params) {
    final page = params['page']!.first;
    if (page != '/') {
      final pageProvider = Provider.of<PageProvider>(context!, listen: false);
      pageProvider.createScrollController(page);
      return HomePage();
    }
  },
);
