import 'package:flutter/material.dart';

class FAQPage extends StatefulWidget {
  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  String _searchQuery = '';
  
  final List<Map<String, dynamic>> faqCategories = [
    {
      'category': 'Tentang Aplikasi Naik Pete\'',
      'faqs': [
        {
          'question': 'Apa itu aplikasi Naik Pete\'?',
          'answer': 'Naik Pete\' adalah aplikasi yang mempermudah pemesanan pete-pete dan melihat rute terdekat.'
        },
        {
          'question': 'Bagaimana cara memesan pete-pete?',
          'answer': 'Anda dapat memilih lokasi penjemputan dan tujuan, kemudian melakukan pemesanan melalui aplikasi.'
        },
        {
          'question': 'Apakah aplikasi ini berbayar?',
          'answer': 'Aplikasi ini gratis untuk diunduh dan digunakan. Biaya perjalanan akan ditampilkan sebelum konfirmasi pemesanan.'
        },
      ]
    },
    {
      'category': 'Fitur Aplikasi',
      'faqs': [
        {
          'question': 'Bagaimana cara melihat rute terdekat?',
          'answer': 'Gunakan fitur pencarian rute pada menu utama untuk melihat rute terdekat dari lokasi Anda.'
        },
        {
          'question': 'Apakah saya bisa melihat kapasitas kursi?',
          'answer': 'Ya, Anda dapat melihat kapasitas kursi yang tersedia di setiap pete-pete sebelum memesan.'
        },
        {
          'question': 'Bagaimana cara melaporkan masalah?',
          'answer': 'Anda dapat melaporkan masalah melalui menu Bantuan, lalu pilih kategori keluhan yang sesuai.'
        },
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQs', style: TextStyle(color: Colors.black)),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255), // White background
        elevation: 1,
        leading: _buildCustomBackButton(context),
      ),
      body: Column(
        children: [
          _searchField(),
          const SizedBox(height: 20),
          FAQContent(
            faqCategories: faqCategories,
            searchQuery: _searchQuery,
            onSearchChanged: (query) {
              setState(() {
                _searchQuery = query;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCustomBackButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back, color: Color(0xFF42C8DC)), // Ikon biru
      onPressed: () {
        Navigator.pop(context); // Kembali ke layar sebelumnya
      },
    );
  }

  Widget _searchField() {
    return TextField(
      onChanged: (query) {
        setState(() {
          _searchQuery = query;
        });
      },
      decoration: InputDecoration(
        hintText: 'Cari berdasarkan kata kunci',
        prefixIcon: const Icon(Icons.search, color: Colors.black54),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}

class FAQContent extends StatelessWidget {
  final List<Map<String, dynamic>> faqCategories;
  final String searchQuery;

  const FAQContent({
    required this.faqCategories,
    required this.searchQuery, required Null Function(dynamic query) onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: faqCategories.map((category) {
          // Filter FAQ berdasarkan pencarian
          final filteredFaqs = category['faqs']
              .where((faq) => faq['question'].toLowerCase().contains(searchQuery.toLowerCase()))
              .toList();

          if (filteredFaqs.isEmpty) return Container(); // Tidak ada hasil, kosongkan widget

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _categoryTitle(category['category']),
              const SizedBox(height: 10),
              ...filteredFaqs.map<Widget>((faq) {
                return _faqCard(faq);
              }).toList(),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _categoryTitle(String category) {
    return Text(
      category,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFF42C8DC), // Main color
      ),
    );
  }

  Widget _faqCard(Map<String, dynamic> faq) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Card(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ExpansionTile(
          iconColor: const Color(0xFF42C8DC), // Main color
          collapsedIconColor: Colors.black54,
          title: Text(
            faq['question'],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                faq['answer'],
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
