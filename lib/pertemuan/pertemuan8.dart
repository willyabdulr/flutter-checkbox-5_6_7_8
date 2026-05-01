import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AutocompleteSpinPage extends StatefulWidget {
  const AutocompleteSpinPage({super.key});

  @override
  State<AutocompleteSpinPage> createState() => _AutocompleteSpinPageState();
}

class _AutocompleteSpinPageState extends State<AutocompleteSpinPage> {
  final TextEditingController _searchController = TextEditingController();
  String? selectedCategory;
  String? selectedItem;

  final List<Map<String, dynamic>> items = [
    {'name': 'Flutter', 'category': 'Framework', 'icon': Icons.mobile_friendly},
    {
      'name': 'React Native',
      'category': 'Framework',
      'icon': Icons.code,
    }, // ← GANTI
    {'name': 'Vue.js', 'category': 'Framework', 'icon': Icons.web},
    {'name': 'Angular', 'category': 'Framework', 'icon': Icons.code},
    {
      'name': 'Python',
      'category': 'Bahasa Pemrograman',
      'icon': Icons.terminal,
    },
    {
      'name': 'JavaScript',
      'category': 'Bahasa Pemrograman',
      'icon': Icons.javascript,
    },
    {'name': 'Java', 'category': 'Bahasa Pemrograman', 'icon': Icons.coffee},
    {
      'name': 'Dart',
      'category': 'Bahasa Pemrograman',
      'icon': Icons.storage,
    }, // ← GANTI
    {'name': 'Firebase', 'category': 'Backend', 'icon': Icons.storage},
    {'name': 'MySQL', 'category': 'Database', 'icon': Icons.storage},
    {'name': 'MongoDB', 'category': 'Database', 'icon': Icons.storage},
  ];

  final List<String> categories = [
    'Semua',
    'Framework',
    'Bahasa Pemrograman',
    'Backend',
    'Database',
  ];

  List<Map<String, dynamic>> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = items;
    selectedCategory = 'Semua';
  }

  void filterItems(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredItems = items;
      } else {
        filteredItems = items.where((item) {
          return item['name'].toString().toLowerCase().contains(
            query.toLowerCase(),
          );
        }).toList();
      }
    });
  }

  void filterByCategory(String category) {
    setState(() {
      selectedCategory = category;
      if (category == 'Semua') {
        filteredItems = items;
      } else {
        filteredItems = items.where((item) {
          return item['category'] == category;
        }).toList();
      }
      _searchController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'Pertemuan 8 - Autocomplete & Search',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search Bar
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: TextField(
              controller: _searchController,
              onChanged: filterItems,
              decoration: InputDecoration(
                hintText: 'Cari teknologi...',
                prefixIcon: const Icon(Icons.search, color: Colors.purple),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: Colors.grey),
                        onPressed: () {
                          _searchController.clear();
                          filterItems('');
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
            ),
          ),

          // Category Filter
          Container(
            height: 50,
            color: Colors.white,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = selectedCategory == category;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: FilterChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (_) => filterByCategory(category),
                    backgroundColor: Colors.grey.shade200,
                    selectedColor: Colors.purple.shade100,
                    checkmarkColor: Colors.purple,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.purple : Colors.grey.shade700,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 8),

          // Result Count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  '${filteredItems.length} item ditemukan',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // List Items
          Expanded(
            child: filteredItems.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 64,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Tidak ada hasil ditemukan',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      return Card(
                        elevation: 2,
                        margin: const EdgeInsets.only(bottom: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(16),
                          leading: CircleAvatar(
                            backgroundColor: Colors.purple.shade100,
                            child: Icon(
                              item['icon'],
                              color: Colors.purple.shade700,
                            ),
                          ),
                          title: Text(
                            item['name'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            'Kategori: ${item['category']}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.grey.shade400,
                          ),
                          onTap: () {
                            setState(() {
                              selectedItem = item['name'];
                            });
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                title: Text(item['name']),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Kategori: ${item['category']}'),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Teknologi ini banyak digunakan dalam pengembangan aplikasi modern.',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('Tutup'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Fluttertoast.showToast(
                                        msg: 'Anda memilih ${item['name']}',
                                        gravity: ToastGravity.TOP,
                                      );
                                    },
                                    child: const Text('Pilih'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.purple,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
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
