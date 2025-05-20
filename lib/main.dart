import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF075E54), // WhatsApp green
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF075E54),
          elevation: 0,
        ),
      ),
      home: const AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sohbetler'),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: const [
          SohbetSatiri(
            isim: "Ahmet",
            mesaj: "Merhaba, nasılsın?",
            saat: "14:30",
            okunmamis: 2,
          ),
          SohbetSatiri(
            isim: "Ayşe",
            mesaj: "Yarın görüşelim mi?",
            saat: "13:45",
            okunmamis: 0,
          ),
          SohbetSatiri(
            isim: "Mehmet",
            mesaj: "Projeyi tamamladım",
            saat: "12:20",
            okunmamis: 1,
          ),
          SohbetSatiri(
            isim: "Zeynep",
            mesaj: "Teşekkürler!",
            saat: "11:15",
            okunmamis: 0,
          ),
          SohbetSatiri(
            isim: "Can",
            mesaj: "Toplantı saat kaçta?",
            saat: "10:30",
            okunmamis: 3,
          ),
          SohbetSatiri(
            isim: "Elif",
            mesaj: "Dosyaları gönderdim",
            saat: "09:45",
            okunmamis: 0,
          ),
          SohbetSatiri(
            isim: "Burak",
            mesaj: "Yarın kahve içelim mi?",
            saat: "09:15",
            okunmamis: 2,
          ),
          SohbetSatiri(
            isim: "Deniz",
            mesaj: "Sunumu hazırladım",
            saat: "08:50",
            okunmamis: 1,
          ),
          SohbetSatiri(
            isim: "Gizem",
            mesaj: "Teşekkür ederim!",
            saat: "08:30",
            okunmamis: 0,
          ),
          SohbetSatiri(
            isim: "Kemal",
            mesaj: "Raporu inceledim",
            saat: "08:15",
            okunmamis: 4,
          ),
          SohbetSatiri(
            isim: "Leyla",
            mesaj: "Hafta sonu planı yapalım",
            saat: "08:00",
            okunmamis: 0,
          ),
          SohbetSatiri(
            isim: "Murat",
            mesaj: "Proje teslim tarihi ne zaman?",
            saat: "07:45",
            okunmamis: 2,
          ),
          SohbetSatiri(
            isim: "Naz",
            mesaj: "Toplantı notlarını gönderdim",
            saat: "07:30",
            okunmamis: 0,
          ),
          SohbetSatiri(
            isim: "Okan",
            mesaj: "Yeni görevleri aldım",
            saat: "07:15",
            okunmamis: 1,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF25D366), // WhatsApp light green
        child: const Icon(Icons.message),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF075E54),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Sohbetler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: 'Durum',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Aramalar',
          ),
        ],
      ),
    );
  }
}

class SohbetSatiri extends StatelessWidget {
  final String isim;
  final String mesaj;
  final String saat;
  final int okunmamis;

  const SohbetSatiri({
    super.key,
    required this.isim,
    required this.mesaj,
    required this.saat,
    this.okunmamis = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFF075E54),
            radius: 25,
            child: Text(
              isim[0].toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (okunmamis > 0)
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Color(0xFF25D366),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  okunmamis.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
      title: Text(
        isim,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        mesaj,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: okunmamis > 0 ? Colors.black : Colors.grey[600],
          fontWeight: okunmamis > 0 ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            saat,
            style: TextStyle(
              color: okunmamis > 0 ? const Color(0xFF075E54) : Colors.grey[600],
              fontSize: 12,
            ),
          ),
          if (okunmamis > 0)
            const Icon(
              Icons.done_all,
              color: Color(0xFF075E54),
              size: 16,
            ),
        ],
      ),
    );
  }
}
