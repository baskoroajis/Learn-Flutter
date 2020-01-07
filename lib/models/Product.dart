class Product {
  final String name;
  final String description;
  final int price;
  final String image;
  final int id;

  static final columns = ["id", "name", "description", "price", "image"];

  Product(this.id, this.name,this.description,this.price,this.image);
  factory Product.fromMap(Map<String, dynamic> json){
    return Product(
      json['id'],
      json['name'],
      json['description'],
      json['price'],
      json['image'],
    );
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "description": description,
    "price": price,
    "image": image
  };

//
//  static List<Product>getProducts(){
//    List<Product> items = <Product>[];
//    Product item1 = Product("Handphone", "ini Handphone", 4500000, 'iphone.png');
//    items.add(item1);
//    Product item2 = Product("Laptop", "ini Laptop", 9500000, 'laptop.png');
//    items.add(item2);
//    Product item3 = Product("floppy", "ini Floppy disk", 50000, 'floppy.png');
//    items.add(item3);
//    Product item4 = Product("Laptop", "ini Laptop", 9500000, 'laptop.png');
//    items.add(item2);
//    return items;
//  }
}


