import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF171A3A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5F5CE6),
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.white),
        title: const Text(
          "Dashboard",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hello, Chea! 👋",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "Here's your overview",
              style: TextStyle(color: Color(0xFFAAB0D5), fontSize: 13),
            ),
            const SizedBox(height: 16),
            Row(
              children: const [
                Expanded(
                  child: StatDashboardCard(
                    bgColor: Color(0xFFD7E6FA),
                    number: "12",
                    label: "COURSES",
                    sublabel: "3 in progress",
                    icon: Icons.insert_chart_outlined,
                    numberColor: Color(0xFF2343B5),
                    iconBg: Color(0xFFC4D6F7),
                    iconColor: Color(0xFF5F5CE6),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: StatDashboardCard(
                    bgColor: Color(0xFFF0D2E4),
                    number: "3.8",
                    label: "GPA",
                    sublabel: "Top 15%",
                    icon: Icons.emoji_events_outlined,
                    numberColor: Color(0xFFC02F72),
                    iconBg: Color(0xFFF6E1EC),
                    iconColor: Color(0xFFD98A2B),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const DashboardListItem(
              icon: Icons.access_time_filled_rounded,
              iconBg: Color(0xFFE8EBF8),
              iconColor: Color(0xFF6B7280),
              title: "Recent Activity",
              subtitle: "2 new updates",
            ),
            const Divider(color: Color(0xFF31355F), height: 1),
            const DashboardListItem(
              icon: Icons.assignment_rounded,
              iconBg: Color(0xFFF8E8B8),
              iconColor: Color(0xFFD98A2B),
              title: "Assignments",
              subtitle: "3 pending",
            ),
            const Divider(color: Color(0xFF31355F), height: 1),
            const DashboardListItem(
              icon: Icons.settings,
              iconBg: Color(0xFFE8EBF8),
              iconColor: Color(0xFF9CA3AF),
              title: "Settings",
              subtitle: "Profile & prefs",
            ),
          ],
        ),
      ),
    );
  }
}

class StatDashboardCard extends StatelessWidget {
  final Color bgColor;
  final String number;
  final String label;
  final String sublabel;
  final IconData icon;
  final Color numberColor;
  final Color iconBg;
  final Color iconColor;

  const StatDashboardCard({
    super.key,
    required this.bgColor,
    required this.number,
    required this.label,
    required this.sublabel,
    required this.icon,
    required this.numberColor,
    required this.iconBg,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Icon(icon, size: 13, color: iconColor),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              number,
              style: TextStyle(
                color: numberColor,
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                color: numberColor.withOpacity(0.85),
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              sublabel,
              style: TextStyle(
                color: numberColor.withOpacity(0.65),
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardListItem extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String title;
  final String subtitle;

  const DashboardListItem({
    super.key,
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      leading: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          color: iconBg,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 18, color: iconColor),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: Color(0xFFAAB0D5), fontSize: 11),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: Colors.white70,
        size: 18,
      ),
    );
  }
}
