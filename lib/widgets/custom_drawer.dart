import 'package:flutter/material.dart';
import 'package:loja/screens/login_screen.dart';
import 'package:loja/tiles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  
  final PageController pageController;

  CustomDrawer(this.pageController);

  final Color gradientColor_1 = const Color(0xFF0d7377);
  final Color gradientColor_2 = const Color(0xFF68b0ab);


  @override
  Widget build(BuildContext context) {
    Widget _drawerBodyBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              gradientColor_1,
              gradientColor_2,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
        );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _drawerBodyBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: Text('Loja de\n Natal',
                        style: TextStyle(
                          fontSize: 34.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Hai,",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          GestureDetector(
                            child: Text(
                              "Entre ou cadastre-se",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            onTap: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => LoginScreen(),)
                              );
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),

              Divider(),
              DrawerTile(
                Icons.home,
                "Inico",
                pageController,
                0,
              ),

              DrawerTile(
                Icons.list,
                "Pedidos",
                pageController,
                1,
              ),

              DrawerTile(
                Icons.location_city,
                "Lojas",
                pageController,
                2,
              ),

              DrawerTile(
                Icons.playlist_add_check,
                "Carrinho",
                pageController,
                3,
              ),

            ],
          )
        ],
      ),
    );
  }
}
