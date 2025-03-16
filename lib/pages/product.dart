import 'package:flutter/material.dart';
import 'package:new_web/helper/constants.dart';
import 'package:new_web/pages/footer.dart';
import 'package:new_web/providers/CartProvider.dart';
import 'package:new_web/providers/SideMenuProvider.dart';
import 'package:new_web/providers/UserDataProvider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid/responsive_grid.dart';

class Product extends StatefulWidget {
  Function callback;
  Product({super.key,required this.callback});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final List<Map<String, String>> products = [
    {
      'id': '1',
      "name": "The Sukoon Chai",
      "image": "assets/sukoon_chai.png",
      "price": "12",
      "description": "Promotes relaxation, relieves tension, fights insomnia.",
      "Benefits":"Promotes relaxation, relieves tension, fights insomnia, and strengthens the immune system to combat cancer cells",
      "Ingredients":"Mahua flowers (Madhuka Puspa), Couscous, Indian spices, creamer, coconut milk powder, Misri and tea leaves"
    },
    {
      'id': '2',
      "name": "Madhumeha Chai",
      "image": "assets/madhumeha_chai.png",
      "price": "14",
      "description": "Boosts energy, regulates hunger, helps manage diabetes.",
      "Benefits":"Boosts energy and stamina, prevents dizziness, improves endurance, regulates hunger, and helps manage diabetes",
      "Ingredients":"Tanner’s cassia (Mridvika/Tangedu), Blackcurrant seeds, creamer, coconut milk powder, misri and tea leaves"
    },
    {
      'id': '3',
      "name": "The Savyasachin Chai",
      "image": "assets/savyasachin_chai.png",
      "price": "13",
      "description": "Aids blood circulation, prevents arterial blockages.",
      "Benefits":"Assists with arterial health, aids in resolving blood circulation problems, purifies the blood, and prevents arterial blockages",
      "Ingredients":"Arjunaa, vayunarayana, cinnamon, creamer, coconut milk powder, misri and tea leaves"
    },
    {
      'id': '4',
      "name": "Soukhya Chai",
      "image": "assets/soukhya_chai.png",
      "price": "15",
      "description": "Supports treatment of fibroids, PCOD, PCOS.",
      "Benefits":"Supports the treatment of fibroids and cysts, addresses PCOD and PCOS conditions, and alleviates issues with white discharge",
      "Ingredients":"Saraca asoka (Ashoka), Areca nut, Butea monosperma (Muttuga), creamer, coconut milk powder, misri and tea leaves"
    },
    {
      'id': '5',
      "name": "Metaboost Magic",
      "image": "assets/metaboost_magic.png",
      "price": "10",
      "description": "Rich in vitamins, cools the body, energy booster.",
      "Benefits":"Abundant in Vitamins C and E, beneficial for skin ailments and acne, possesses anti-inflammatory properties, serves as an energy enhancer during summer, and provides a cooling sensation to the body",
      "Ingredients":"Lemon grass, Indian spices, cumin seeds, pepper, dry ginger, misri and tea leaves"
    },
    {
      'id': '6',
      "name": "The Gut Glow Infusion",
      "image": "assets/gut_glow.png",
      "price": "11",
      "description": "Supports gut microbiome, improves digestion, boosts immunity.",
      "Benefits":"Supports Gut microbiome, improves digestion, enhances nutrients absorption, boosts immunity, detoxifies the body",
      "Ingredients":"creamer, coconut milk powder, misri and tea leaves"
    },
    {
      'id': '7',
      "name": "The Kidney Detox",
      "image": "assets/kidney_detox.png",
      "price": "16",
      "description": "Promotes kidney detoxification, improves kidney function.",
      "Benefits":"Promotes kidney detoxification, supports hydration, improves kidney function, balances electrolytes and improves overall kidney functions",
      "Ingredients":"Boerhavia diffusa (Punarnawa), Achyranthes aspera (Uttereni), creamer, coconut milk powder, misri and tea leaves"
    },
    {
      'id': '8',
      "name": "The Red Sandal",
      "image": "assets/red_sandal.png",
      "price": "14",
      "description": "Supports blood purification, alleviates skin allergies.",
      "Benefits":"Supports blood purification, alleviates skin allergies, addresses hair-related problems, and nourishes the skin for a healthy glow",
      "Ingredients":"Red sandal, Rubia cordifolia (Manjishta), creamer, coconut milk powder, misri and tea leaves"
    },
    {
      'id': '9',
      "name": "Halka Phool Chai",
      "image": "assets/halka_phool.png",
      "price": "13",
      "description": "Boosts metabolism, enhances fat burning, detoxifies body.",
      "Benefits":"Boosts Metabolism, Suppresses Appetite, Enhances Fat burning, Improves digestion, Detoxification, Improves energy levels.",
      "Ingredients":"Vayunarayana, Jasimne (parijatha), dry ginger, pepper, creamer, coconut milk powder, misri and tea leaves"
    },
    {
      'id': '10',
      "name": "Sandhi Sudha",
      "image": "assets/sandhi_sudha.png",
      "price": "18",
      "description": "Relieves joint pain, improves mobility, rich in antioxidants.",
      "Benefits":" Inhibits the development of cancer cells, boosts overall energy levels, preserves equilibrium among blood cells, fortifies the body's strength, stimulates hunger",
      "Ingredients":"Marigold, Lotus, Chrysanths (Sevanti), Chamomile, turmeric, creamer, coconut milk powder, misri and tea leaves"
    },
  ];

  SideMenuProvider? sProvider;

  @override
  Widget build(BuildContext context) {
    sProvider = Provider.of<SideMenuProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30,right: 30),
            child: ResponsiveGridList(
              desiredItemWidth: 200,
              shrinkWrap: true,
              scroll: false,
              minSpacing: 16,
              children: products.map((product) => buildProductCard(product)).toList(),
            ),
          ),
          Footer()
        ],
      ),
    );
  }

  Widget buildProductCard(Map<String, String> product) {
    return GestureDetector(
      onTap: (){
        widget.callback(product);
      },
      child: Card(

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
              child: Image.asset(
                Asset.string.kProd,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 250,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    product["name"]!,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4),
                  Text(
                    product["description"]!,
                    maxLines: 1,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "₹${product["price"]??""}/1000gms",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1c5c3c),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Provider.of<CartProvider>(context).hasItem(product['id'].toString())?Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      color:  Color(0xFF1c5c3c),
                      borderRadius: BorderRadius.circular(8),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: (){
                            Provider.of<CartProvider>(context, listen: false).removeOneItem(product['id'].toString());
                          },
                          icon: Icon(Icons.remove, color: Colors.white),
                        ),
                        Text(
                          '${Provider.of<CartProvider>(context).getItemCount(product['id'].toString())}',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                        IconButton(
                          onPressed: (){
                            Provider.of<CartProvider>(context, listen: false).addItem(
                              product['id'].toString(),
                              product['name'].toString(),
                              double.parse((product['price'] ?? "0").toString()),
                            );
                          },
                          icon: Icon(Icons.add, color: Colors.white),
                        ),
                      ],
                    ),
                  ):Container(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if((Provider.of<UserDataProvider>(context,listen: false).user??{}).isNotEmpty){
                          Provider.of<CartProvider>(context, listen: false).addItem(
                            product['id'].toString(),
                            product['name'].toString(),
                            double.parse((product['price'] ?? "0").toString()),
                          );
                        }else{
                          widget.callback({});
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1c5c3c),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text("Buy Now", style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
