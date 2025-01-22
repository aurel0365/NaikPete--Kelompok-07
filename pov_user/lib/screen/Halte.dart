import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HalteScreen(),
    );
  }
}

class HalteScreen extends StatefulWidget {
  @override
  _HalteScreenState createState() => _HalteScreenState();
}

class _HalteScreenState extends State<HalteScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> halteList = [
    'Halte A',
    'Halte B',
    'Halte C',
    'Halte D',
    'Halte E',
  ];

  List<String> filteredHalteList = [];

  @override
  void initState() {
    super.initState();
    filteredHalteList = halteList;
  }

  void _searchHalte(String query) {
    final results = halteList.where((halte) {
      return halte.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredHalteList = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cari Halte Terdekat'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(_searchHalte),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredHalteList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filteredHalteList[index]),
          );
        },
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  final Function(String) searchCallback;

  CustomSearchDelegate(this.searchCallback);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          searchCallback(query);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchCallback(query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    searchCallback(query);
    return ListView.builder(
      itemCount: query.isEmpty ? 0 : 5, // Mock suggestion count
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Suggested ${index + 1}'),
        );
      },
    );
  }
}
