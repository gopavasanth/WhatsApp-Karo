import 'package:flutter/material.dart';

import '../consts.dart';
import 'countries.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Map<String, String>> allCountries = Countries.allCountries;
  List<Map<String, String>> filteredCountries = [];
  void initState() {
    super.initState();
    filteredCountries = allCountries; // Initialize with all countries
  }

  void updateFilteredCountries(List<Map<String, String>> countries) {
    setState(() {
      filteredCountries = countries;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select a Country"),
      ),
      body: Column(
        children: [
          CountrySearchBar(
            allCountries: allCountries,
            onSearch: updateFilteredCountries,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCountries.length,
              itemBuilder: (context, index) {
                final country = filteredCountries[index];
                return GestureDetector(
                  onTap: () {
                    // Pass the selected country back to the previous page
                    Navigator.pop(context, country);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${Countries.getFlagEmoji(country['code']!)}',
                              style: TextStyle(fontSize: 24),
                            ),
                            SizedBox(width: 8), // Add some spacing between flag and dial_code
                            Text(
                              '${country['name']}',
                              style: TextStyle(fontSize: 16),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Text(
                          country['dial_code']!,
                          style: TextStyle(fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );

              },
            ),
          ),
        ],
      ),
    );

  }
}

class CountrySearchBar extends StatefulWidget {
  final List<Map<String, String>> allCountries;
  final Function(List<Map<String, String>>) onSearch;

  CountrySearchBar({required this.allCountries, required this.onSearch});

  @override
  _CountrySearchBarState createState() => _CountrySearchBarState();
}

class _CountrySearchBarState extends State<CountrySearchBar> {
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchTextChanged);
  }

  void _onSearchTextChanged() {
    final searchTerm = _searchController.text.toLowerCase();
    final filteredCountries = widget.allCountries.where((country) {
      final countryName = country['name']?.toLowerCase() ?? '';
      final dialCode = country['dial_code']?.toLowerCase() ?? '';
      return countryName.contains(searchTerm) || dialCode.contains(searchTerm);
    }).toList();

    widget.onSearch(filteredCountries);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search for a country',
          prefixIcon: Icon(Icons.search),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.all(
                Radius.circular(Constants.borderRadius)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.all(
                Radius.circular(Constants.borderRadius)),
          ),
        ),
      ),
    );
  }
}

