import 'package:flutter/material.dart';
import 'package:petshop_mobile/widgets/left_drawer.dart';
import 'package:petshop_mobile/screens/menu.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data'; // For handling file data
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

class ProductEntryFormPage extends StatefulWidget {
  const ProductEntryFormPage({super.key});

  @override
  State<ProductEntryFormPage> createState() => _ProductEntryFormPageState();
}

class _ProductEntryFormPageState extends State<ProductEntryFormPage> {
  final _formKey = GlobalKey<FormState>();
  Uint8List? _webImage;
  String? _fileName;

  final String _productImage = "";
  String _name = "";
  String _flavour = "";
  String _description = "";
  int _price = 0;
  int _stock = 0;
  double _netto = 0.0;
  String _category = "";
  DateTime? _expDate;

  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null) {
      setState(() {
        _webImage = result.files.first.bytes;
        _fileName = result.files.first.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Produk',
          ),
        ),
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    _webImage != null
                      ? Image.memory(_webImage!, height: 150)
                      
                      : const Text('No image selected'),
                    ElevatedButton(
                      onPressed: _pickImage,
                      child: const Text('Upload Image'),
                    ),
                    ],
                ),
              ),
              // Name Field
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Please input name of the product!",
                    labelText: "Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Nama produk tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              // Flavour Field
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Please input flavour of the product!",
                    labelText: "Flavour",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _flavour = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Flavour tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              // Description Field
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Please input description of the product!",
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Description tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              // Netto Field
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Please input netto (in grams) of the product",
                    labelText: "Netto",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (String? value) {
                    setState(() {
                      _netto = double.tryParse(value!) ?? 0.0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Netto tidak boleh kosong!";
                    }
                    final nettoValue = double.tryParse(value);
                    if (nettoValue == null) {
                      return "Netto harus berupa angka!";
                    }
                    if (nettoValue < 0) {
                      return "Netto tidak boleh negatif!";
                    }
                    return null;
                  },
                ),
              ),
              // Price Field
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Please input price of the product",
                    labelText: "Price",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (String? value) {
                    setState(() {
                      _price = int.tryParse(value!) ?? 0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Harga tidak boleh kosong!";
                    }
                    final priceValue = int.tryParse(value);
                    if (priceValue == null) {
                      return "Harga harus berupa angka!";
                    }
                    if (priceValue < 0) {
                      return "Harga tidak boleh negatif!";
                    }
                    return null;
                  },
                ),
              ),
              // Amount Field
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Please input amount of product",
                    labelText: "Amount",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (String? value) {
                    setState(() {
                      _stock = int.tryParse(value!) ?? 0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Amount tidak boleh kosong!";
                    }
                    final amountValue = int.tryParse(value);
                    if (amountValue == null) {
                      return "Amount harus berupa angka!";
                    }
                    if (amountValue < 0) {
                      return "Amount tidak boleh negatif!";
                    }
                    return null;
                  },
                ),
              ),
              // Category Field
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Please input category of the product",
                    labelText: "Category",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _category = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Category tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000), // Start date
                          lastDate: DateTime(2101), // End date
                        );
                        if (pickedDate != null && pickedDate != _expDate) {
                          setState(() {
                            _expDate = pickedDate;
                          });
                        }
                      },
                      child: const Text('Pick Expiration Date'),
                    ),
                    const SizedBox(width: 10),
                    _expDate != null
                        ? Text('Selected Date: ${_expDate!.toLocal()}'.split(' ')[0])
                        : const Text('No date selected'),
                  ],
                ),
              ),
              // Save Button
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.blue[900]),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Convert the image to base64 if it's selected
                       String base64Image = _webImage != null ? 'data:image/png;base64,${base64Encode(_webImage!)}' : '';

                        // Prepare the payload to send to Django
                        final response = await request.postJson(
                          "http://127.0.0.1:8000/create-flutter/",
                          jsonEncode(<String, dynamic>{
                            'product_image': base64Image,
                            'name': _name,
                            'flavour': _flavour,
                            'price': _price.toString(),
                            'description': _description,
                            'netto': _netto.toString(),
                            'category': _category,
                            'stock': _stock.toString(),
                            'exp_date': _expDate != null
                                ? "${_expDate!.year.toString().padLeft(4, '0')}-${_expDate!.month.toString().padLeft(2, '0')}-${_expDate!.day.toString().padLeft(2, '0')}"
                                : '', // Ensure you send a string date in the correct format
                          }),
                        );

                        if (context.mounted) {
                          if (response['status'] == 'success') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Product baru berhasil disimpan!")),
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => MyHomePage()),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Terdapat kesalahan, silakan coba lagi.")),
                            );
                          }
                        }
                      }
                    },       
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.amber[50],
    );
  }
}
