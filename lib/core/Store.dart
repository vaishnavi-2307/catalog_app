import 'package:catalog_app/models/Cart.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  Catalogmodels catalog;
  CartModel cart;
  MyStore() {
    catalog = Catalogmodels();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
