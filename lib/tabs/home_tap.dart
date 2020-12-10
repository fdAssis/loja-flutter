import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeTap extends StatelessWidget {

  final Color gradientColor_1 = const Color(0xFF0d7377);
  final Color gradientColor_2 = const Color(0xFF68b0ab);

  @override
  Widget build(BuildContext context) {
    // Cria um fundo degrade
    Widget _buildBodyBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              gradientColor_1,
              gradientColor_2,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
        );

    return Stack(
      children: <Widget>[
        _buildBodyBack(),
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Principais produtos"),
                centerTitle: true,
              ),
            ),
            FutureBuilder<QuerySnapshot>(
              future: Firestore.instance
                  .collection("home")
                  .orderBy("priority")
                  .getDocuments(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return SliverToBoxAdapter(
                      child: Container(
                    height: 200.0,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ));
                else
                  return SliverStaggeredGrid.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    staggeredTiles: snapshot.data.documents.map((doc) {
                      return StaggeredTile.count(
                          doc.data['width'], doc.data['height']);
                    }).toList(),
                    children: snapshot.data.documents.map(
                      (doc){
                        return FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage, 
                          image: doc.data["url_image"],
                          fit: BoxFit.cover,
                        );
                      }
                    ).toList(),
                  );
              },
            )
          ],
        )
      ],
    );
  }
}
