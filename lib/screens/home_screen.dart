import 'package:flutter/material.dart';
import 'package:loja/tabs/home_tap.dart';
import 'package:loja/tabs/products_tab.dart';
import 'package:loja/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {

  // Controla a mudança de pagina
  final _pageController = PageController();


  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      children: <Widget>[
        Scaffold(
          body: HomeTap(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Produtos"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: ProductsTab(),
        ),
      ],
    );
  }
}