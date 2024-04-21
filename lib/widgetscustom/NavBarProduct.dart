import 'package:fastfoodapp/const.dart';
import 'package:flutter/material.dart';

class ItemBottomNavBarProduct extends StatefulWidget {
  const ItemBottomNavBarProduct({Key? key}) : super(key: key);

  @override
  _ItemBottomNavBarProductState createState() =>
      _ItemBottomNavBarProductState();
}

class _ItemBottomNavBarProductState extends State<ItemBottomNavBarProduct> {
  //quantity
  int quantiCount = 0;

  //decrement quantity
  void decrementQuantity() {
    setState(() {
      if(quantiCount>0){
        quantiCount--;
      }
      
    });
  }

  //increment quantity
  void incrementQuantity() {
    setState(() {
      quantiCount++;
    });
  }

  //add to cart
  void addToCart(){
    
    if(quantiCount>0){
      //thông báo giỏ hàng thành công
    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context)=>AlertDialog(
        backgroundColor: color_background,
        content: Text("Thêm vào giỏ hàng thành công",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        actions: [
          //okay button
          IconButton(
            onPressed: (){
              //pop once to remove dialog box
              Navigator.pop(context);
              //pop again to go previous screen
              Navigator.pop(context);
            }, 
            icon: Icon(Icons.done, color: Colors.white,),
            )
        ],
      ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: color_background,
      height: 180,
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          //price+quantity
          Row(
            //chỉnh vị trí các phần tử
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //price
              Text(
                "90.000đ",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              //quantity
              Row(
                children: [
                  //minus button
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(242, 213, 211, 0.5),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.remove,
                        size: 18,
                      ),
                      onPressed: decrementQuantity,
                    ),
                  ),
                  //quantity count
                  SizedBox(
                    width: 40,
                    child: Center(
                      child: Text(
                        quantiCount.toString(),
                        style: TextStyle(
                          color: Colors.white,
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
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(242, 213, 211, 0.5),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.add,
                        size: 18,
                      ),
                      onPressed: incrementQuantity,
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 25,),
        
          //add cart bottom
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: addToCart, 
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15), backgroundColor: Color.fromRGBO(242, 213, 211, 0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              child: const Text('Thêm vào giỏ hàng', style: TextStyle(color: Colors.white),)
            ),
          ),
        ],
      ),
    );
  }
}
