class Item {
  String?  name, id;
  var icon;

  Item({this.id, this.name, this.icon});
}

class Users {
  var lists = [
    Item(
      id    : 'qr_code',
      name  : 'QR Code Scanner',
      icon  : 'assets/qrcode.png',
    ),
    Item(
      id    : 'geo_punch',
      name  : 'Geo Punch',
      icon  : 'assets/geopunch.png',
    ),
    Item(
      id    : 'order',
      name  : 'Submit Order',
      icon  : 'assets/order.png',
    ),
  ];
}