import 'package:flutter/material.dart';
import 'package:whatsapp_karo/consts.dart';
import 'package:whatsapp_karo/src/countries.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Map<String, String>> allCountries = Countries.allCountries;
  List<Map<String, String>> filteredCountries = [];
  @override
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
        title: const Text(
          "Select a Country",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          CountrySearchBar(
            allCountries: allCountries,
            onSearch: updateFilteredCountries,
          ),
          Flexible(
            child: ListView.builder(
              itemCount: filteredCountries.length,
              itemBuilder: (context, index) {
                final country = filteredCountries[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pop(context, country);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 25),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Flexible(
                                    flex: 0,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Text(
                                        Countries.getFlagEmoji(
                                            country['code']!),
                                        style: const TextStyle(fontSize: 24),
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Text(
                                      '${country['name']}',
                                      style: const TextStyle(fontSize: 16),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 0,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 3.0),
                                child: Text(
                                  country['dial_code']!,
                                  style: const TextStyle(fontSize: 16),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.grey,
                        )
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

  const CountrySearchBar({
    super.key,
    required this.allCountries,
    required this.onSearch,
  });

  @override
  CountrySearchBarState createState() => CountrySearchBarState();
}

class CountrySearchBarState extends State<CountrySearchBar> {
  final TextEditingController _searchController = TextEditingController();

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
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _searchController,
        decoration: const InputDecoration(
          hintText: 'Search by country name',
          prefixIcon: Icon(Icons.search),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
            borderRadius:
                BorderRadius.all(Radius.circular(Constants.borderRadius)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
            borderRadius:
                BorderRadius.all(Radius.circular(Constants.borderRadius)),
          ),
        ),
      ),
    );
  }
}
