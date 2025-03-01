import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';

class PageProvider extends ChangeNotifier {
  PageController scrollController = new PageController();

  // ignore: prefer_final_fields
  List<String> _pages = ['home', 'about', 'pricing', 'contact', 'location'];

  int _currentIndex = 0; //Contiene la pagina actual

  //Metodo posicion de _pages
  createScrollController(String routeName) {
    this.scrollController = new PageController(
      //obteniendo la pagina inicial
      initialPage: getPageindex(routeName),
    );

    //obteniendo la ruta con el Scroll
    this.scrollController.addListener(() {
      final index = (this.scrollController.page ?? 0).round();

      if (index != _currentIndex) {
        html.window.history.pushState(null, 'none', '#/${_pages[index]}');
        _currentIndex = index;
        html.document.title = _pages[index];
      }
    });
  }

  //obtener la pagina inicial usando el metodo indexOf
  int getPageindex(String routeName) {
    // ignore: prefer_contains
    // Condicion para evitar el -1
    return _pages.indexOf(routeName) == -1 ? 0 : _pages.indexOf(routeName);
  }

  goTo(int index) {
    scrollController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
