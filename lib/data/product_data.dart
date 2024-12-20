import '../models/product.dart';

final Map<String, List<Product>> productsByCategory = {
  'Moisturizer': [
    Product(name: 'Hydrating Cream', rating: '4.5', reviews: '120'),
    Product(name: 'Night Moisturizer', rating: '4.2', reviews: '85'),
  ],
  'Toner': [
    Product(name: 'Soothing Toner', rating: '4.7', reviews: '210'),
    Product(name: 'Brightening Toner', rating: '4.3', reviews: '130'),
  ],
  'Serum': [
    Product(name: 'Vitamin C Serum', rating: '4.6', reviews: '150'),
    Product(name: 'Hyaluronic Acid Serum', rating: '4.8', reviews: '200'),
  ],
  'Sunscreen': [
    Product(name: 'SPF 50 Sunscreen', rating: '4.5', reviews: '190'),
    Product(name: 'Mineral Sunscreen', rating: '4.3', reviews: '110'),
  ],
  'Face Mask': [
    Product(name: 'Clay Mask', rating: '4.5', reviews: '95'),
    Product(name: 'Hydrating Mask', rating: '4.7', reviews: '120'),
  ],
  'Lips Care': [
    Product(name: 'Lip Balm', rating: '4.8', reviews: '220'),
    Product(name: 'Lip Scrub', rating: '4.4', reviews: '150'),
  ],
  'Cleanser': [
    Product(name: 'Foaming Cleanser', rating: '4.6', reviews: '170'),
    Product(name: 'Micellar Water', rating: '4.2', reviews: '140'),
  ],
};
