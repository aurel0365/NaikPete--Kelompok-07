import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('FAQs', style: TextStyle(color: Colors.white)),
          backgroundColor: const Color(0xFF42C8DC), // Warna utama biru
          elevation: 1,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black54,
            indicatorColor: Colors.white,
            tabs: const [
              Tab(text: 'Feedback'),
              Tab(text: 'FAQs'),
              Tab(text: 'What\'s New'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const Center(child: Text('Feedback Page')),
            FAQContent(faqCategories: faqCategories),
            const Center(child: Text('What\'s New Page')),
          ],
        ),
      ),
    );
  }
}

class FAQContent extends StatelessWidget {
  final List<Map<String, dynamic>> faqCategories;

  const FAQContent({required this.faqCategories});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
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
            ),
            const SizedBox(height: 20),
            ...faqCategories.map((category) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category['category'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF42C8DC), // Warna utama
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...List<Widget>.from(category['faqs'].map((faq) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Card(
                        color: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ExpansionTile(
                          iconColor: const Color(0xFF42C8DC), // Warna utama
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
                  })),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}