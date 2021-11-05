import 'package:catalog_app/core/Store.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  Catalogmodels _catalog;
  final List<int> _itemsIds = [];
  Catalogmodels get catalog => _catalog;
  set catalog(Catalogmodels newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  List<Item> get items => _itemsIds.map((id) => _catalog.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
 
  void add(Item item) {
    _itemsIds.add(item.id);
  }

  void remove(Item item) {
    _itemsIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store.cart._itemsIds.add(item.id);
  }
}
