import 'package:flutter/material.dart';
import '../config/app_colors.dart';
import '../config/app_theme.dart';

class NavigasiPage extends StatefulWidget {
  const NavigasiPage({super.key});

  @override
  State<NavigasiPage> createState() => _NavigasiPageState();
}

class _NavigasiPageState extends State<NavigasiPage> {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBg,
      appBar: AppBar(
        title: const Text('Navigation'),
        backgroundColor: AppColors.cardBg,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Info Card
              Card(
                color: AppColors.cardBg,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppTheme.borderRadiusMedium,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppTheme.paddingMedium),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.navigation,
                        color: AppColors.primary,
                        size: 40,
                      ),
                      const SizedBox(height: AppTheme.paddingSmall),
                      Text(
                        'Contoh Navigasi',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: AppTheme.paddingSmall),
                      Text(
                        'Tekan tombol di bawah untuk navigasi ke halaman lain',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppTheme.paddingMedium),

              // Page Display
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.cardBg,
                  borderRadius: BorderRadius.circular(
                    AppTheme.borderRadiusMedium,
                  ),
                  border: Border.all(
                    color: AppColors.primary.withOpacity(0.3),
                    width: 2,
                  ),
                ),
                padding: const EdgeInsets.all(AppTheme.paddingLarge),
                child: Column(
                  children: [
                    Text(
                      'Page $_pageIndex',
                      style: Theme.of(context).textTheme.displayMedium
                          ?.copyWith(color: AppColors.primary),
                    ),
                    const SizedBox(height: AppTheme.paddingMedium),
                    _buildPageContent(_pageIndex),
                    const SizedBox(height: AppTheme.paddingMedium),
                    Text(
                      'Current Page: $_pageIndex / 3',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppTheme.paddingMedium),

              // Navigation Buttons
              Text(
                'Push Navigation (Menambah halaman ke stack)',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.accentBright,
                ),
              ),
              const SizedBox(height: AppTheme.paddingSmall),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (_pageIndex < 3) {
                      setState(() => _pageIndex++);
                    }
                  },
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('Push Halaman Berikutnya'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(height: AppTheme.paddingMedium),

              Text(
                'Pop Navigation (Kembali ke halaman sebelumnya)',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: AppColors.accent),
              ),
              const SizedBox(height: AppTheme.paddingSmall),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (_pageIndex > 0) {
                      setState(() => _pageIndex--);
                    }
                  },
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Pop ke Halaman Sebelumnya'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                  ),
                ),
              ),
              const SizedBox(height: AppTheme.paddingMedium),

              Text(
                'Replace Navigation (Mengganti halaman)',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: AppColors.success),
              ),
              const SizedBox(height: AppTheme.paddingSmall),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() => _pageIndex = 0);
                  },
                  icon: const Icon(Icons.restore),
                  label: const Text('Replace ke Home (Page 0)'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.success,
                  ),
                ),
              ),
              const SizedBox(height: AppTheme.paddingMedium),

              // Info
              Card(
                color: AppColors.cardBgHover,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppTheme.borderRadiusMedium,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppTheme.paddingMedium),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jenis-Jenis Navigasi:',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(color: AppColors.info),
                      ),
                      const SizedBox(height: AppTheme.paddingSmall),
                      _buildNavInfo(
                        'Push',
                        'Menambah halaman baru ke stack navigasi',
                      ),
                      _buildNavInfo(
                        'Pop',
                        'Menghapus halaman dari stack (kembali)',
                      ),
                      _buildNavInfo('Replace', 'Mengganti halaman saat ini'),
                      _buildNavInfo(
                        'Named Route',
                        'Navigasi menggunakan nama route',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageContent(int page) {
    final contents = [
      'Selamat datang di Halaman Pertama!',
      'Anda sekarang di Halaman Kedua',
      'Ini adalah Halaman Ketiga',
      'Ini adalah Halaman Keempat',
    ];

    return Container(
      padding: const EdgeInsets.all(AppTheme.paddingMedium),
      decoration: BoxDecoration(
        color: AppColors.darkBg,
        borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
      ),
      child: Text(
        contents[page],
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }

  Widget _buildNavInfo(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppTheme.paddingSmall),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(AppTheme.paddingTiny),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(AppTheme.borderRadiusSmall),
            ),
            child: const Icon(Icons.check, size: 16, color: AppColors.primary),
          ),
          const SizedBox(width: AppTheme.paddingSmall),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
