import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sawargi/app/views/dashboard/components/bottomnav_item.dart';
import 'package:sawargi/app/views/dashboard/widgets/dashboard_bottomnav.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  static const String routeName = '/dashboard';

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentPage = 0;
  final bottomNavItems = const [
    BottomNavItem(icon: MingCute.home_2_fill, label: 'Beranda'),
    BottomNavItem(icon: MingCute.frame_fill, label: 'Konten'),
    BottomNavItem(icon: MingCute.bill_fill, label: 'Transaksi'),
    BottomNavItem(icon: MingCute.user_5_fill, label: 'Akun'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentPage,
        children: List.generate(4, (index) {
          return Center(
            child: Text(
              index == 0
                  ? 'Beranda'
                  : index == 1
                  ? 'Konten'
                  : index == 2
                  ? 'Transaksi'
                  : 'Akun',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
            ),
          );
        }),
      ),
      bottomNavigationBar: DashboardBottomNav(
        items: bottomNavItems,
        activeIndex: _currentPage,
        onTap: (index) {
          setState(() {
            _currentPage = index;
          });
        },
      ),
    );
  }
}
