import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pr_3/utills/product_utills.dart';
import 'package:flutter_pr_3/utills/routes.dart';
import 'package:flutter_pr_3/views/extensions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List imagesSlider = [
    "lib/assets/image/1.png",
    "lib/assets/image/2.png",
    "lib/assets/image/3.png",
    "lib/assets/image/4.png",
    "lib/assets/image/5.png",
  ];
  Color color = Colors.white;

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    var fanCarouselImageSlider;
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                "Dhruv Bhalani",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              accountEmail: Text(
                "Dhruvbhalani9@.gmail",
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
              decoration: BoxDecoration(color: Colors.white),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/156923442?s=400&u=8b2e6cf085f2185acbd956c2d57714c15f80d74e&v=4"),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          "Tasty Foods",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('Favauritepage');
            },
            icon: const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 25,
            ),
          ),
          10.toWidth(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: s.height * 0.25,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                ),
                items: List.generate(
                  imagesSlider.length,
                  (index) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          imagesSlider[index],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              10.toHeight(),
              Column(
                children: allRecipies
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.detail,
                              arguments: e,
                            );
                          },
                          child: Container(
                            height: s.height * 0.25,
                            width: s.width * 20,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              border:
                                  Border.all(color: Colors.black54, width: 2),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  width: s.width * 0.5,
                                  height: s.height * 0.2,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.brown.shade300,
                                    image: DecorationImage(
                                      image: NetworkImage(e['image']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e['name'],
                                        maxLines: 2,
                                        overflow: TextOverflow.visible,
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Total Time ${e['prepTimeMinutes'] + e['cookTimeMinutes']}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "persons ${e['servings']}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Meal Type ${e['mealType']}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "This Recipe is ${e['difficulty']}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                      Spacer(),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {});
                                          },
                                          icon: const Icon(
                                            Icons.favorite_outline,
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
