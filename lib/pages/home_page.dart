import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../components/grocery_item_tile.dart';
import '../model/card_model.dart';
import 'cart_page.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CartPage();
        })),
        backgroundColor: Colors.black,
        child: Icon(Icons.shopping_bag, color: Colors.white,),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 48),
            //good morning
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text("Good morning,"),
            ),

            const SizedBox(height: 4,),

            //Lets order fresh items for you
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Let's order fresh items for you",
                  style: GoogleFonts.notoSerif(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ),
            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Freshness you can trust, quality you can feel.",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 12),

            //Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search products",
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    icon: Icon(Icons.search, color: Colors.grey[400]),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            //divider
/*            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(

              ),
            ),

            const SizedBox(height: 24),*/

            //items + grid
            /*const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Fresh Items",
                style: TextStyle(fontSize: 16),
              ),
            ),*/

            Expanded(
              child: Consumer<CardModel>(builder: (context, value, child){
                return GridView.builder(itemCount: value.shopItems.length,
                  padding: EdgeInsets.all(12.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1 / 1.3,),
                  itemBuilder: (context, index) {
                    return GroceryItemTile(
                      itemName: value.shopItems[index][0],
                      itemPrice: value.shopItems[index][1],
                      imagePath: value.shopItems[index][2],
                      color: value.shopItems[index][3],
                      onPressed: () {
                        Provider.of<CardModel>(context, listen: false).addItemToCart(index);
                      },
                    );
                  },
                );
              },),
            )
          ],
        ),
      ),
    );
  }
}
