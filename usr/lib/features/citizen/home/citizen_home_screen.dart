import 'package:flutter/material.dart';
import 'package:lgu_citizen_connect/core/theme/app_theme.dart';

class CitizenHomeScreen extends StatelessWidget {
  const CitizenHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Citizen Portal'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildWelcomeSection(),
            const SizedBox(height: 24),
            const Text(
              'Services',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildGridMenu(context),
            const SizedBox(height: 24),
            const Text(
              'Recent Updates',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildRecentUpdates(),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppTheme.accentBlue, Color(0xFF0077CC)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Welcome, Citizen!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'How can we help you today?',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
          const Icon(Icons.location_city, color: Colors.white, size: 48),
        ],
      ),
    );
  }

  Widget _buildGridMenu(BuildContext context) {
    final menuItems = [
      {
        'label': 'Report Issue',
        'color': Colors.redAccent,
        'icon': Icons.camera_alt,
        'route': '/report_issue'
      },
      {
        'label': 'Follow-up',
        'color': Colors.orangeAccent,
        'icon': Icons.track_changes,
        'route': '/follow_up'
      },
      {
        'label': 'Accomplished',
        'color': Colors.green,
        'icon': Icons.check_circle,
        'route': '/accomplished'
      },
      {
        'label': 'LGU Services',
        'color': Colors.blue,
        'icon': Icons.business,
        'route': '/services'
      },
      {
        'label': 'Senior & PWD',
        'color': Colors.purpleAccent,
        'icon': Icons.accessibility_new,
        'route': '/senior_pwd'
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.1,
      ),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final item = menuItems[index];
        return _buildMenuCard(
          label: item['label'] as String,
          color: item['color'] as Color,
          icon: item['icon'] as IconData,
          onTap: () {
            // Navigation placeholder
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Navigating to ${item['label']}')),
            );
          },
        );
      },
    );
  }

  Widget _buildMenuCard({
    required String label,
    required Color color,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.08),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withOpacity(0.1)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 32),
              ),
              const SizedBox(height: 12),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentUpdates() {
    return Column(
      children: [
        _buildUpdateCard(
          title: 'Vaccination Drive',
          date: 'Today, 9:00 AM',
          description: 'Free flu shots available at the City Health Office.',
        ),
        const SizedBox(height: 12),
        _buildUpdateCard(
          title: 'Road Maintenance',
          date: 'Yesterday',
          description: 'Main street will be closed for repairs from 10 PM to 4 AM.',
        ),
      ],
    );
  }

  Widget _buildUpdateCard({
    required String title,
    required String date,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppTheme.accentGreen,
                ),
              ),
              Text(
                date,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(description),
        ],
      ),
    );
  }
}
