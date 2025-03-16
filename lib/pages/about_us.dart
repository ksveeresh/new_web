import 'package:flutter/material.dart';
import 'package:new_web/helper/constants.dart';
import 'package:new_web/pages/footer.dart';
import 'package:new_web/providers/CartProvider.dart';
import 'package:provider/provider.dart';
import 'package:responsive_grid/responsive_grid.dart';

class AboutUs extends StatelessWidget {
  Function? callBack;

  AboutUs({super.key, this.callBack});
  final List<Map<String, String>> products = [
    {
      'id': '1',
      "name": "The Sukoon Chai",
      "image": "assets/sukoon_chai.png",
      "price": "12",
      "description": "Promotes relaxation, relieves tension, fights insomnia.",
    },
    {
      'id': '2',
      "name": "Madhumeha Chai",
      "image": "assets/madhumeha_chai.png",
      "price": "14",
      "description": "Boosts energy, regulates hunger, helps manage diabetes.",
    },
    {
      'id': '3',
      "name": "The Savyasachin Chai",
      "image": "assets/savyasachin_chai.png",
      "price": "13",
      "description": "Aids blood circulation, prevents arterial blockages.",
    },
    {
      'id': '4',
      "name": "Soukhya Chai",
      "image": "assets/soukhya_chai.png",
      "price": "15",
      "description": "Supports treatment of fibroids, PCOD, PCOS.",
    },
    {
      'id': '5',
      "name": "Metaboost Magic",
      "image": "assets/metaboost_magic.png",
      "price": "10",
      "description": "Rich in vitamins, cools the body, energy booster.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    var isLargeScreen = width > 800;

    return Scaffold(
      backgroundColor: Colors.green[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                Asset.string.kBanner,
                width: double.infinity,
                fit: BoxFit.fitWidth,
                height: 500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  SizedBox(height: 20),
                  isLargeScreen?Row(
                    children: [
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    "Welcome to Kesarla's Herbal Tea",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green[800],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    "Kesarla's is a pioneering company dedicated to producing high-quality herbal teas that promote health and well-being. Rooted in the ancient wisdom of natural remedies, Kesarla's combines traditional knowledge with modern innovation to create herbal teas that are not only refreshing but also packed with medicinal benefits. The company is committed to sustainability, ethical sourcing, and delivering products that enhance the overall quality of life for its customers.",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 30),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            Asset.string.kBanner1,
                            fit: BoxFit.fitWidth,
                            height: 200,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ],
                  ):Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  "Welcome to Kesarla's Herbal Tea",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[800],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Text(
                                  "Kesarla's is a pioneering company dedicated to producing high-quality herbal teas that promote health and well-being. Rooted in the ancient wisdom of natural remedies, Kesarla's combines traditional knowledge with modern innovation to create herbal teas that are not only refreshing but also packed with medicinal benefits. The company is committed to sustainability, ethical sourcing, and delivering products that enhance the overall quality of life for its customers.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          Asset.string.kBanner1,
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                          height: 300,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),
                  isLargeScreen?Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Our Mission",
                              style: TextStyle(
                               fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[800],
                              ),
                            ),
                            Text(
                              "Kesarla's mission is to provide natural, health-enhancing herbal teas that empower individuals to lead healthier lives. The company envisions becoming a global leader in the herbal tea industry by promoting wellness through nature's bounty.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 30),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Our Vission",
                              style: TextStyle(
                               fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[800],
                              ),
                            ),
                            Text(
                              "Kesarla's is more than just a tea company; it is a lifestyle brand that encourages a holistic approach to health and wellness. With every sip of Kesarla's herbal tea, customers can experience the healing power of nature and take a step toward a healthier, more balanced life.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ):Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Our Mission",
                            style: TextStyle(
                             fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[800],
                            ),
                          ),
                          Text(
                            "Kesarla's mission is to provide natural, health-enhancing herbal teas that empower individuals to lead healthier lives. The company envisions becoming a global leader in the herbal tea industry by promoting wellness through nature's bounty.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(width: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Our Vission",
                            style: TextStyle(
                             fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[800],
                            ),
                          ),
                          Text(
                            "Kesarla's is more than just a tea company; it is a lifestyle brand that encourages a holistic approach to health and wellness. With every sip of Kesarla's herbal tea, customers can experience the healing power of nature and take a step toward a healthier, more balanced life.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Key Highlights of Kesarla's Herbal Teas:",
                    style: TextStyle(
                     fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        isLargeScreen?Row(
                          children: [
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Text(
                                    "Health-Centric Formulations:",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green[800],
                                    ),
                                  ),
                                  Text(
                                    "Kesarla's herbal teas are crafted using a blend of natural herbs, flowers, and spices known for their therapeutic properties. Each product is designed to address specific health concerns, such as boosting immunity, aiding digestion, reducing stress, improving sleep, and detoxifying the body.",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "Medicinal Advantages:",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green[800],
                                    ),
                                  ),
                                  Text(
                                    "The teas are rich in antioxidants, vitamins, and minerals, making them a natural remedy for various ailments. Ingredients like tulsi (holy basil), ginger, turmeric, ashwagandha, and lemongrass are carefully selected for their proven health benefits.",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "Pure and Natural:",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green[800],
                                    ),
                                  ),
                                  Text(
                                    "Kesarla's prioritizes purity and quality. All teas are free from artificial additives, preservatives, and chemicals, ensuring a wholesome and natural experience for consumers.",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 30),
                            Flexible(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.asset(
                                      Asset.string.key1,
                                      fit: BoxFit.fitWidth,
                                      height: 310,
                                      width: double.infinity,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ): Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(
                                  "Health-Centric Formulations:",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[800],
                                  ),
                                ),
                                Text(
                                  "Kesarla's herbal teas are crafted using a blend of natural herbs, flowers, and spices known for their therapeutic properties. Each product is designed to address specific health concerns, such as boosting immunity, aiding digestion, reducing stress, improving sleep, and detoxifying the body.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "Medicinal Advantages:",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[800],
                                  ),
                                ),
                                Text(
                                  "The teas are rich in antioxidants, vitamins, and minerals, making them a natural remedy for various ailments. Ingredients like tulsi (holy basil), ginger, turmeric, ashwagandha, and lemongrass are carefully selected for their proven health benefits.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "Pure and Natural:",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[800],
                                  ),
                                ),
                                Text(
                                  "Kesarla's prioritizes purity and quality. All teas are free from artificial additives, preservatives, and chemicals, ensuring a wholesome and natural experience for consumers.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            SizedBox(width: 30),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    Asset.string.key1,
                                    width: double.infinity,
                                    fit: BoxFit.fitWidth,
                                    height: 300,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        isLargeScreen?Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.asset(
                                      Asset.string.key2,
                                      fit: BoxFit.fitWidth,
                                      height: 310,
                                      width: double.infinity,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 30),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Sustainability and Ethical Practices:",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green[800],
                                    ),
                                  ),
                                  Text(
                                    "The company is committed to sustainable farming practices and works closely with local farmers to source organic ingredients. Kesarla's also emphasizes fair trade and supports the livelihoods of farming communities.",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "Wide Range of Products:",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green[800],
                                    ),
                                  ),
                                  Text(
                                    "Kesarla's offers a diverse range of herbal teas tailored to meet the needs of different consumers. Whether you're looking for an energy boost, relaxation, or a detox, there's a blend for every purpose.",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "Customer-Centric Approach",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green[800],
                                    ),
                                  ),
                                  Text(
                                    "Kesarla's places a strong emphasis on customer satisfaction, ensuring that every product meets the highest standards of quality and efficacy. The company also educates its customers on the benefits of herbal teas and how to incorporate them into their daily routines.",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ):Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sustainability and Ethical Practices:",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[800],
                                  ),
                                ),
                                Text(
                                  "The company is committed to sustainable farming practices and works closely with local farmers to source organic ingredients. Kesarla's also emphasizes fair trade and supports the livelihoods of farming communities.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "Wide Range of Products:",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[800],
                                  ),
                                ),
                                Text(
                                  "Kesarla's offers a diverse range of herbal teas tailored to meet the needs of different consumers. Whether you're looking for an energy boost, relaxation, or a detox, there's a blend for every purpose.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  "Customer-Centric Approach",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[800],
                                  ),
                                ),
                                Text(
                                  "Kesarla's places a strong emphasis on customer satisfaction, ensuring that every product meets the highest standards of quality and efficacy. The company also educates its customers on the benefits of herbal teas and how to incorporate them into their daily routines.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    Asset.string.key2,
                                    width: double.infinity,
                                    fit: BoxFit.fitWidth,
                                    height: 300,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                      Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Top seller",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: ResponsiveGridList(
                    desiredItemWidth: 300,
                    shrinkWrap: true,
                    scroll: false,
                    minSpacing: 16,
                    children: products.map((product) => buildProductCard(product)).toList(),
                  )),

              ],
                      )
                ],
              ),
            ),
            Footer()
          ],
        ),
      ),
    );

  }

  Widget buildFeature(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.green[700],
            ),
          ),
          Text(description, style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }

  Widget buildProductCard(Map<String, String> product) {
    return Card(

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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black),
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
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1c5c3c),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                // Provider.of<CartProvider>(context).hasItem(product['id'].toString())?Container(
                //   width: 150,
                //   height: 50,
                //   decoration: BoxDecoration(
                //     color:  Color(0xFF1c5c3c),
                //     borderRadius: BorderRadius.circular(8),
                //   ),
                //
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       IconButton(
                //         onPressed: (){
                //           Provider.of<CartProvider>(context, listen: false).removeOneItem(product['id'].toString());
                //         },
                //         icon: Icon(Icons.remove, color: Colors.white),
                //       ),
                //       Text(
                //         '${Provider.of<CartProvider>(context).getItemCount(product['id'].toString())}',
                //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
                //       ),
                //       IconButton(
                //         onPressed: (){
                //           Provider.of<CartProvider>(context, listen: false).addItem(
                //             product['id'].toString(),
                //             product['name'].toString(),
                //             double.parse((product['price'] ?? "0").toString()),
                //           );
                //         },
                //         icon: Icon(Icons.add, color: Colors.white),
                //       ),
                //     ],
                //   ),
                // ):Container(
                //   width: 150,
                //   height: 50,
                //   child: ElevatedButton(
                //
                //     onPressed: () {
                //       Provider.of<CartProvider>(context, listen: false).addItem(
                //         product['id'].toString(),
                //         product['name'].toString(),
                //         double.parse((product['price'] ?? "0").toString()),
                //       );
                //       // if((Provider.of<UserDataProvider>(context,listen: false).user??{}).isNotEmpty){
                //       //   Provider.of<CartProvider>(context, listen: false).addItem(
                //       //     product['id'].toString(),
                //       //     product['name'].toString(),
                //       //     double.parse((product['price'] ?? "0").toString()),
                //       //   );
                //       // }else{
                //       //   widget.callback({});
                //       // }
                //     },
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: Color(0xFF1c5c3c),
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(8.0),
                //       ),
                //     ),
                //     child: Text("Buy Now", style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
