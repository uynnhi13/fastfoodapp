import 'package:fastfoodapp/model/product.dart';
import 'package:fastfoodapp/pagescustom/Product1.dart';
import 'package:flutter/material.dart';
import 'package:fastfoodapp/const.dart';

class ItemsWidget extends StatefulWidget {
  const ItemsWidget({super.key});

  @override
  State<ItemsWidget> createState() => _itemsWidgetState();
}

class _itemsWidgetState extends State<ItemsWidget> {
  List<Product> lstProduct = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 7; i++) {
      Product product = Product();
      product.setProductID('ID${i + 1}');
      product.setProductName('Product ${i + 1}');
      product.setProductPrice((i + 1) * 100);
      product.setProductDescription('Description for product ${i + 1}');
      product.setProductCategory(i % 3 + 1); // 3 categories in total
      product.setProductStatus('Available');
      // Ví dụ: Sử dụng ByteData.view để tạo ByteData từ một mảng dữ liệu
      // final Uint8List bytes = Uint8List.fromList([0, 1, 2, 3]);
      // product.setProductImage(ByteData.view(bytes.buffer));

      lstProduct.add(product);
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Container(
      height: 620,
      padding: const EdgeInsets.all(16),
      alignment: Alignment.center,
      child: GridView.builder(
        itemCount: lstProduct.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: mediaQueryData.size.width / (mediaQueryData.size.height/1.55),
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemBuilder: (BuildContext context, int index) {
          return ItemProduct(context,lstProduct[index]);
        },
        //     itemBuilder: (context, index) {
        //       return ItemProduct(lstProduct[index]);
        //     }
      ),
    );
  }
}

Widget ItemProduct(BuildContext context,Product model) {
  return Container(
    padding: const EdgeInsets.only(
      left: 15,
      right: 15,
      top: 10,
      bottom: 0,
    ),
    margin: const EdgeInsets.symmetric(
      vertical: 5,
      horizontal: 10,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.favorite_border,
              color: Colors.red,
            ),
          ],
        ),
        //images product
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Product1()));
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "images/my_y.jpg",
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        Container(
          padding: const EdgeInsets.only(bottom: 8),
          alignment: Alignment.centerLeft,
          child: Text(
            model.productName ?? '',
            style:const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        // Container(
        //   alignment: Alignment.centerLeft,
        //   child:const Text('write descripton 123123123', style: TextStyle(fontSize: 14,color: Color(0xFF4C53A5), fontWeight: FontWeight.bold),),
        // ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$55',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.shopping_cart_checkout,
                color: color_background,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
