import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  final List<Map<String, dynamic>> mahasiswaList = [
    {'nama': 'Ahmad Rizki', 'nim': '20231001', 'kelas': '01SIFP001'},
    {'nama': 'Budi Santoso', 'nim': '20231002', 'kelas': '01SIFP001'},
    {'nama': 'Citra Dewi', 'nim': '20231003', 'kelas': '01SIFP002'},
    {'nama': 'Dian Permata', 'nim': '20231004', 'kelas': '01SIFP002'},
    {'nama': 'Eka Fitria', 'nim': '20231005', 'kelas': '01SIFP003'},
    {'nama': 'Fajar Nugroho', 'nim': '20231006', 'kelas': '01SIFP003'},
    {'nama': 'Gita Sari', 'nim': '20231007', 'kelas': '01SIFP001'},
    {'nama': 'Hendra Wijaya', 'nim': '20231008', 'kelas': '01SIFP002'},
    {'nama': 'Indah Lestari', 'nim': '20231009', 'kelas': '01SIFP003'},
    {'nama': 'Joko Susilo', 'nim': '20231010', 'kelas': '01SIFP001'},
  ];

  ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Pertemuan 5 - ListView Mahasiswa',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: mahasiswaList.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final mahasiswa = mahasiswaList[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: CircleAvatar(
                backgroundColor: Colors.blue.shade100,
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    color: Colors.blue.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                mahasiswa['nama']!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text('NIM: ${mahasiswa['nim']}'),
                  Text('Kelas: ${mahasiswa['kelas']}'),
                ],
              ),
              trailing: Icon(Icons.chevron_right, color: Colors.blue.shade400),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    title: Text(mahasiswa['nama']!),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('NIM: ${mahasiswa['nim']}'),
                        const SizedBox(height: 8),
                        Text('Kelas: ${mahasiswa['kelas']}'),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Tutup'),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
