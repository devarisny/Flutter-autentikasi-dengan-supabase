import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    // Mengambil data pengguna yang sedang login
    final user = Supabase.instance.client.auth.currentUser;

    final nama =
        user?.userMetadata?['full_name'] ?? 'Pengguna';

    final email = user?.email ?? '-';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        automaticallyImplyLeading: false,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const CircleAvatar(
                radius: 50,
                child: Icon(
                  Icons.person,
                  size: 60,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'SELAMAT DATANG!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              Text(
                'Nama: $nama',
                style: const TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 10),

              Text(
                'Email: $email',
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () async {

                    // Mengeluarkan pengguna dari aplikasi
                    await Supabase.instance.client.auth.signOut();

                    // AuthGate otomatis kembali ke Login
                  },

                  icon: const Icon(Icons.logout),
                  label: const Text('LOGOUT'),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
