import 'package:flutter/material.dart';
import 'package:petshop_mobile/models/product_entry.dart';
import 'package:petshop_mobile/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProductEntryPage extends StatefulWidget {
  const ProductEntryPage({super.key});

  @override
  State<ProductEntryPage> createState() => _ProductEntryPageState();
}

class _ProductEntryPageState extends State<ProductEntryPage> {
  Future<List<ProductEntry>> fetchProducts(CookieRequest request) async {
    final response = await request.get('http://127.0.0.1:8000/json/');
    var data = response;
    List<ProductEntry> productList = [];
    for (var d in data) {
      if (d != null) {
        productList.add(ProductEntry.fromJson(d));
      }
    }
    return productList;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProducts(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'No product data available.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Display the image on the left
                      snapshot.data![index].fields.productImage != null
                          ? Image.network(
                              'http://127.0.0.1:8000/media/${snapshot.data![index].fields.productImage}',
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                              loadingBuilder: (BuildContext context, Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress.expectedTotalBytes != null
                                          ? loadingProgress.cumulativeBytesLoaded /
                                              (loadingProgress.expectedTotalBytes ?? 1)
                                          : null,
                                    ),
                                  );
                                }
                              },
                              errorBuilder: (BuildContext context, Object error,
                                  StackTrace? stackTrace) {
                                return const Text('No image');
                              },
                            )
                          : const Text('No image'),

                      const SizedBox(width: 16),

                      // Display product information on the right
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name: ${snapshot.data![index].fields.name}",
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text("Price: \$${snapshot.data![index].fields.price}"),
                            Text("Description: ${snapshot.data![index].fields.description}"),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                // Navigate to detail page with additional information
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailPage(
                                      product: snapshot.data![index],
                                    ),
                                  ),
                                );
                              },
                              child: const Text('See Details'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}

// Placeholder for the ProductDetailPage, modify as needed
class ProductDetailPage extends StatelessWidget {
  final ProductEntry product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.fields.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${product.fields.name}"),
            Text("Flavour: ${product.fields.flavour}"),
            Text("Description: ${product.fields.description}"),
            Text("Price: \$${product.fields.price}"),
            Text("Stock: ${product.fields.stock}"),
            Text("Netto: ${product.fields.netto} grams"),
            Text("Category: ${product.fields.category}"),
            Text("Expiration Date: ${product.fields.expDate}"),
            product.fields.productImage != null
                ? Image.network(
                    'http://127.0.0.1:8000/media/${product.fields.productImage}',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : const Text('No image available'),
          ],
        ),
      ),
    );
  }
}
