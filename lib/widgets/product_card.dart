import 'package:flutter/material.dart';
import 'package:petshop_mobile/screens/list_productentry.dart';
import 'package:petshop_mobile/screens/productentry_form.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:petshop_mobile/screens/login.dart';
import 'package:provider/provider.dart';

class ItemHomepage {
  final String name;
  final Color color; // Color of the item
  final IconData icon;

  ItemHomepage(this.name, this.color, this.icon);
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key}); // Ensure const is correctly used

  @override
  Widget build(BuildContext context) {
     final request = context.watch<CookieRequest>();
    return Material(
      color: item.color, // Use the color from the item
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () async {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!")),
            );
            if (item.name == "Tambah Produk") {
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductEntryFormPage(),
                    ));
  }
            else if (item.name == "Lihat Daftar Produk") {
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => const ProductEntryPage()
                  ),
              );
          }
          else if (item.name == "Logout") {
    final response = await request.logout(
        // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
        "http://127.0.0.1:8000/auth/logout/");
        String message = response["message"];
        if (context.mounted) {
            if (response['status']) {
                String uname = response["username"];
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("$message Sampai jumpa, $uname."),
                ));
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                );
            } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(message),
                    ),
                );
            }
        }
    }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white, // Set icon color to white for visibility
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white), // Set text color to white for contrast
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Ensure that the InfoCard is also properly defined and used if you want to include it somewhere in your layout.
class InfoCard extends StatelessWidget {
  final String title;  // Judul kartu.
  final String content;  // Isi kartu.

  const InfoCard({super.key, required this.title, required this.content}); // Ensure the constructor is correctly defined.

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}