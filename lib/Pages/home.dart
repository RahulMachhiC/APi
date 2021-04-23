import 'package:api/Controllers/Products.dart';
import 'package:api/Models/Route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends StateMVC<Homescreen> {
  ProductsController _controller;
  _HomescreenState() : super(ProductsController()) {
    _controller = controller;
  }
  @override
  void initState() {
    _controller.listenproducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: _controller.productss.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).popAndPushNamed('/Details',
                        arguments: RouteArgument(
                            id: _controller.productss
                                .elementAt(index)
                                .productId));
                  },
                  splashColor: Theme.of(context).accentColor.withOpacity(0.08),
                  highlightColor: Colors.transparent,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).focusColor.withOpacity(0.1),
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          child: CachedNetworkImage(
                            height: 60,
                            width: 60,
                            fit: BoxFit.cover,
                            imageUrl: _controller.productss
                                .elementAt(index)
                                .productImage,
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        SizedBox(width: 15),
                        Flexible(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _controller.productss
                                          .elementAt(index)
                                          .productName,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          .merge(
                                              TextStyle(color: Colors.black)),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(_controller.productss
                                      .elementAt(index)
                                      .productCost
                                      .toString())
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: _controller.productss.length),
    );
  }
}
