import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Toko Sepatu Riky';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
            actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // Tambahkan logika pencarian di sini
              },
            ),
          ],
        ),
        
        body: const SingleChildScrollView(
          child: Column(
            children: [
              ImageSection(
                image: 'img/sepatu.png',
              ),
              TitleSection(
                name: 'Toko Sepatu',
                location: 'Desa Surodinanggan Banguntapan Bantul',
              ),
              ButtonSection(),
              EditTextSection(),
            ],
          ),
        ),
        backgroundColor: Color.fromARGB(255, 225, 129, 129), // Background color
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.location,
  });

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  location,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 3, 2, 2),
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.star,
            color: Color.fromARGB(255, 137, 47, 211),
          ),
          const Text('100'),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(
            color: color,
            icon: Icons.call,
            label: 'CALL',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.near_me,
            label: 'ROUTE',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.share,
            label: 'SHARE',
          ),
        ],
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        description,
        softWrap: true,
      ),
    );
  }
}

class EditTextSection extends StatefulWidget {
  const EditTextSection({super.key});

  @override
  State<EditTextSection> createState() => _EditTextSectionState();
}

class _EditTextSectionState extends State<EditTextSection> {
  late TextEditingController _controller;
  late String _description;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _description =
        'Selamat datang di toko sepatu kami, tempat terbaik untuk menemukan berbagai jenis sepatu berkualitas tinggi!';
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _saveText() {
    setState(() {
      _description = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'Edit Description',
              border: OutlineInputBorder(),
            ),
          ),
          ElevatedButton(
            onPressed: _saveText,
            child: const Text('Save Description'),
          ),
          const SizedBox(height: 20),
          Text(
            'Description: $_description',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );
  }
}
