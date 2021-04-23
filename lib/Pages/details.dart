import 'package:api/Controllers/Products.dart';
import 'package:api/Models/Route.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class Details extends StatefulWidget {
  RouteArgument routeArgument;
  Details({Key key, this.routeArgument}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends StateMVC<Details> {
  ProductsController _controller;
  _DetailsState() : super(ProductsController()) {
    _controller = controller;
  }

  @override
  void initState() {
    _controller.listendetails(productid: widget.routeArgument.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.details == null
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            appBar: AppBar(
              leading: new IconButton(
                icon: new Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).popAndPushNamed('/Home'),
              ),
              title: Text(_controller.details.productName),
            ),
            body: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(
                      _controller.details.productImage,
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _controller.details.productName,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          _controller.details.productCost.toString() + '₹',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Text("Product Brand: ${_controller.details.productBrand}"),
                    Text(
                        "Product Will Available in ${_controller.details.productAvailability}"),
                  ],
                ),
              ],
            ),
          );
  }
}
