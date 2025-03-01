import 'package:flutter/material.dart';
import 'package:flutter_application_2/provider/page_provider.dart';
import 'package:flutter_application_2/ui/shared/custom_app_menu.dart';
import 'package:flutter_application_2/ui/view/about_view.dart';
import 'package:flutter_application_2/ui/view/contact_view.dart';
import 'package:flutter_application_2/ui/view/home_view.dart';
import 'package:flutter_application_2/ui/view/location_view.dart';
import 'package:flutter_application_2/ui/view/pricing_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  //Container general del home_page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: buildBoxDecoration(),
        child: Stack(
          //coloca elemento en capas STACK
          children: [
            _HomeBody(),
            Positioned(right: 20, top: 20, child: CustomAppMenu()),
          ],
        ),
      ),
    );
  }

  //Para el gradiente de comienzo y final de las paginas es decir del scroll
  BoxDecoration buildBoxDecoration() => BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.pink, Colors.purpleAccent],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.5, 0.5],
    ),
  );
}

//Permite deslizar entre secciones de la pagina
class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);
    return PageView(
      //deslizar entre diferentes secciones de la pagina PAGEVIEW
      controller: pageProvider.scrollController,
      scrollDirection: Axis.vertical,
      children: [
        HomeView(),
        AboutView(),
        PricingView(),
        ContactView(),
        LocationView(),
      ],
    );
  }
}
