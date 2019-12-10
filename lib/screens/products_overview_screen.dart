import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../providers/products.dart';

import '../widgets/products_grid.dart';

enum FilterOptions {

Favorite,
All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {

  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {

   // final productContainer = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue){

              setState(() {
                if(selectedValue == FilterOptions.Favorite){
                  //  productContainer.showFavoritesOnly();
                  _showOnlyFavorites = true;
              }else{
               // productContainer.showAll();
               _showOnlyFavorites = false;
              }
              });

              
              print(selectedValue);
            },
            icon: Icon(Icons.more_vert
            ),
            itemBuilder: (_) =>[
              PopupMenuItem(child: Text('Only Favorites'), value: FilterOptions.Favorite,),
              PopupMenuItem(child: Text('Show All'), value: FilterOptions.All,)

            ],
            ),
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
