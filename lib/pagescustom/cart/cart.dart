import 'package:fastfoodapp/const.dart';
import 'package:fastfoodapp/data/api.dart';
import 'package:fastfoodapp/data/sqlite.dart';
import 'package:fastfoodapp/model/cart.dart';
import 'package:fastfoodapp/pagescustom/cart/cartwidget/success_payment.dart';
import 'package:fastfoodapp/pagescustom/cart/order_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<List<Cart>> _getProducts() async {
    return await _databaseHelper.products();
  }

  double _calculateTotal(List<Cart> products) {
    double total = 0;
    for (var product in products) {
      total += product.price * product.count;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color_background_2,
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Cart>>(
              future: _getProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('Your cart is empty.'),
                  );
                }
                return Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final itemProduct = snapshot.data![index];
                            return Dismissible(
                              key: UniqueKey(),
                              direction: DismissDirection.endToStart,
                              onDismissed: (direction) {
                                setState(() {
                                  DatabaseHelper()
                                      .deleteProduct(itemProduct.productID);
                                });
                              },
                              background: Container(
                                color: Colors.red[400],
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                alignment: Alignment.centerRight,
                                child: const Icon(Icons.delete,
                                    color: Colors.white),
                              ),
                              child: _buildProduct(itemProduct, context),
                            );
                          },
                        ),
                      ),
                    ),
                    // Tổng thanh toán
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: color_background,
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.all(24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  'Tổng thanh toán:',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  NumberFormat('#,##0')
                                      .format(_calculateTotal(snapshot.data!)),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                Navigator.push(context, MaterialPageRoute(builder:(context) => const Orders(),));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    color_background, // Đặt màu nền là màu xanh
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      8), // Đặt bán kính bo tròn
                                  side: const BorderSide(
                                      color: Colors
                                          .white), // Đặt đường viền màu trắng
                                ),
                              ),
                              child: const InkWell(
                                child: Text(
                                  "Thanh toán",
                                  style: TextStyle(color: Colors.white,
                                  fontSize: 19),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProduct(Cart pro, BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              pro.name,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                color: color_background
              ),
            ),
            const SizedBox(height: 4.0),
            Row(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(10), // Độ cong của các góc
                  child: Image.network(
                    pro.img,
                    fit: BoxFit.cover,
                    height: 80,
                    width: 80,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        NumberFormat('#,##0').format(pro.price * pro.count),
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        'Description: ' + pro.des,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    //minus button
                    Container(
                      padding: EdgeInsets.only(bottom: 6),
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              DatabaseHelper().minus(pro);
                            });
                          },
                          icon: Icon(
                            Icons.minimize,
                            color: color_background,
                            size: 18,
                          )),
                    ),
                    //quantity count
                    SizedBox(
                      width: 40,
                      child: Center(
                        child: Text(
                          pro.count.toString(),
                          style: const TextStyle(
                            color: color_background,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    //plus button
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                          onPressed: () {
                            setState(() {
                              DatabaseHelper().add(pro);
                            });
                          },
                          icon: Icon(Icons.add,
                              color: color_background, size: 18)),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
