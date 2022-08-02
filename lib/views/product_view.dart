import 'package:education_app/model/product_model.dart';
import 'package:education_app/services/product_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Cart>? cart;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    cart = (await getCart());
    if (cart != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Visibility(
          visible: isLoaded,
          // ignore: sort_child_properties_last
          child: GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            itemCount: cart?.length,
            itemBuilder: (context, index) {
              var cartItems = cart![index].carts;
              // var products = cartItems![index].products!.length;

              return InkWell(
                onTap: () {},
                child: Card(
                  elevation: 10,
                  shadowColor: Colors.black,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    margin: const EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              cart![index].total.toString(),
                              //products![index].title!,

                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            // Text(
                            //   products![index].price.toString(),
                            //   style: TextStyle(
                            //     fontSize: 15,
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1 / 1.4,
              crossAxisSpacing: 5,
              mainAxisSpacing: 8,
            ),
          ),
          replacement: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
