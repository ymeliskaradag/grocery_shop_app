import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../components/grocery_item_tile.dart';
import '../model/card_model.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQuery = "";

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
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value.toLowerCase();
                    });
                  },
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

            Expanded(
              child: Consumer<CardModel>(builder: (context, value, child){
                final filteredItems = value.shopItems.where((item) {
                  final itemName = item[0].toString().toLowerCase();
                  return itemName.contains(searchQuery);
                }).toList();
                return GridView.builder(itemCount: filteredItems.length,
                  padding: EdgeInsets.all(12.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1 / 1.3,),
                  itemBuilder: (context, index) {
                    return GroceryItemTile(
                      itemName: filteredItems[index][0],
                      itemPrice: filteredItems[index][1],
                      imagePath: filteredItems[index][2],
                      color: filteredItems[index][3],
                      onPressed: () {
                        Provider.of<CardModel>(context, listen: false).addItemToCart(filteredItems[index][0]);
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
