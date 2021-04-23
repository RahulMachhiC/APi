import 'package:api/Models/Details.dart';
import 'package:api/Repository/productrepo.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:api/Models/Products.dart';

class ProductsController extends ControllerMVC {
  List<products> productss = <products>[];
  products pro;
  List<Details> detailss = <Details>[];
  Details details;

  ProductsController() {
    listenproducts();
    listendetails();
  }

  Future<void> listenproducts() async {
    final Stream<products> stream = (await getproducts());
    stream.listen((products _product) {
      setState(() => productss.add(_product));
    });
  }

  void listendetails({String productid}) async {
    final Stream<Details> stream = (await getDetails(productid));
    stream.listen((Details _details) {
      setState(() => details = _details);
    });
  }
}
