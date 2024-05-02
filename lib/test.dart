
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _quantity = 2;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (_quantity > 2) {
        _quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bacon Burger App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/products/6-wings.png'),
            SizedBox(height: 16),
            Text(
              'Bacon Burger:\n'
              'A Signature flame-grilled beef patty\n'
              'topped with smoked bacon.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _decrementQuantity,
                  child: Text('-'),
                ),
                SizedBox(width: 16),
                Text(
                  '$_quantity',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _incrementQuantity,
                  child: Text('+'),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add the Bacon Burger to the cart
                print('Bacon Burger added to cart ($_quantity patties)');
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}