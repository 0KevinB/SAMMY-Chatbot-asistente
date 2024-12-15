import 'package:flutter/material.dart';
import 'package:sami/services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _userName = 'Usuario';

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final userName = await AuthService.getUserName();
    setState(() {
      _userName = userName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.grid_view, color: Colors.blue),
                  Row(
                    children: const [
                      Icon(Icons.cloud_outlined, color: Colors.blue),
                      SizedBox(width: 16),
                      Icon(Icons.notifications_outlined, color: Colors.blue),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Greeting
              Text(
                'Hola, $_userName',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const Text(
                'Dime, ¿Cómo puedo ayudarte el día de hoy?',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 24),
              // Robot Image
              Center(
                child: Image.asset(
                  'assets/img/sami_logo.png',
                  height: 150,
                ),
              ),
              // Medication Reminder
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Recuerda tomar tu medicina en 5 minutos',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              // Grid Menu
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    _buildMenuCard(
                      icon: Icons.calendar_month,
                      title: 'Citas médicas',
                    ),
                    _buildMenuCard(
                      icon: Icons.chat_bubble_outline,
                      title: 'Nuevo chat',
                    ),
                    _buildMenuCard(
                      icon: Icons.description_outlined,
                      title: 'Mis recetas',
                    ),
                    _buildMenuCard(
                      icon: Icons.science_outlined,
                      title: 'Mis exámenes',
                    ),
                  ],
                ),
              ),
              // Emergency Button
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(24),
                    ),
                    child: const Text(
                      'BOTÓN DE\nEMERGENCIA',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard({
    required IconData icon,
    required String title,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32, color: Colors.blue),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
