import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../config/app_colors.dart';
import '../config/app_theme.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBg,
      appBar: AppBar(
        title: const Text('Tentang Saya'),
        backgroundColor: AppColors.cardBg,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: AppTheme.paddingLarge),

              // Profile Photo
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.primary.withOpacity(0.3),
                      AppColors.accent.withOpacity(0.3),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: AppColors.primary, width: 3),
                ),
                padding: const EdgeInsets.all(4),
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: AppColors.cardBgHover,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/profile.jpg',
                      width: 112,
                      height: 112,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.person,
                          size: 80,
                          color: AppColors.primary,
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppTheme.paddingLarge),

              // Name
              Text(
                'Ahmad Sahrul Fadhilah',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: AppTheme.paddingSmall),
              Text(
                'NPM: 20241320031',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: AppTheme.paddingLarge),

              // University & Title
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.paddingMedium,
                  vertical: AppTheme.paddingSmall,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(
                    AppTheme.borderRadiusMedium,
                  ),
                  border: Border.all(color: AppColors.primary.withOpacity(0.3)),
                ),
                child: Column(
                  children: [
                    Text(
                      'Universitas Kebangsaan Republik Indonesia',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: AppTheme.paddingTiny),
                    Text(
                      'Sistem Informasi',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppTheme.paddingLarge),

              // Description
              Card(
                color: AppColors.cardBg,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppTheme.borderRadiusMedium,
                  ),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(AppTheme.paddingMedium),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Deskripsi Singkat',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(color: AppColors.primary),
                      ),
                      const SizedBox(height: AppTheme.paddingSmall),
                      Text(
                        'Seorang mahasiswa Sistem Informasi yang antusias dengan dunia teknologi dan pengembangan perangkat lunak. Memiliki pengalaman praktis di bidang IT Support dengan keahlian dalam instalasi sistem operasi, pemeliharaan perangkat keras, dan manajemen jaringan.',
                        textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.textSecondary,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppTheme.paddingMedium),

              // Skills Section
              Card(
                color: AppColors.cardBg,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppTheme.borderRadiusMedium,
                  ),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(AppTheme.paddingMedium),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Keahlian',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(color: AppColors.accentBright),
                      ),
                      const SizedBox(height: AppTheme.paddingMedium),

                      // Expert Level
                      _buildSkillCategory('Expert', AppColors.accent),
                      _buildSkillItem('Laravel', 0.95),
                      _buildSkillItem('PHP', 0.95),
                      _buildSkillItem('MySQL', 0.95),
                      _buildSkillItem('C++', 0.95),
                      const SizedBox(height: AppTheme.paddingMedium),

                      // Intermediate Level
                      _buildSkillCategory('Intermediate', AppColors.primary),
                      _buildSkillItem('HTML5', 0.75),
                      _buildSkillItem('Bootstrap 5', 0.75),
                      _buildSkillItem('JavaScript', 0.75),
                      _buildSkillItem('REST API', 0.75),
                      _buildSkillItem('Flutter', 0.75),
                      const SizedBox(height: AppTheme.paddingMedium),

                      // Beginner Level
                      _buildSkillCategory('Beginner', AppColors.success),
                      _buildSkillItem('Java', 0.55),
                      _buildSkillItem('Python', 0.55),
                      _buildSkillItem('Git & Version Control', 0.55),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppTheme.paddingMedium),

              // Contact Section
              Card(
                color: AppColors.cardBg,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppTheme.borderRadiusMedium,
                  ),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(AppTheme.paddingMedium),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.contact_mail_outlined,
                            color: AppColors.primary,
                            size: 24,
                          ),
                          const SizedBox(width: AppTheme.paddingSmall),
                          Text(
                            'Kontak & Sosial Media',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(color: AppColors.primary),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppTheme.paddingMedium),
                      _buildContactItem(
                        context,
                        Icons.email_outlined,
                        'Email',
                        'ahmadsahrul1887@gmail.com',
                      ),
                      const SizedBox(height: AppTheme.paddingSmall),
                      _buildContactItem(
                        context,
                        Icons.link_outlined,
                        'GitHub',
                        'github.com/Rain-dev-187',
                      ),
                      const SizedBox(height: AppTheme.paddingSmall),
                      _buildContactItem(
                        context,
                        FontAwesomeIcons.whatsapp,
                        'WhatsApp',
                        '+62 882-2058-8345',
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: AppTheme.paddingLarge),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillCategory(String category, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppTheme.paddingSmall),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.paddingSmall,
              vertical: AppTheme.paddingTiny,
            ),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(AppTheme.borderRadiusSmall),
              border: Border.all(color: color.withOpacity(0.5)),
            ),
            child: Text(
              category,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillItem(String skill, double progress) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppTheme.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                skill,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${(progress * 100).toInt()}%',
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.paddingSmall),
          ClipRRect(
            borderRadius: BorderRadius.circular(AppTheme.borderRadiusSmall),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: AppColors.cardBgHover,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    return InkWell(
      onTap: () {
        Clipboard.setData(ClipboardData(text: value));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$label disalin ke clipboard'),
            backgroundColor: AppColors.primary,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(AppTheme.borderRadiusSmall),
      child: Container(
        padding: const EdgeInsets.all(AppTheme.paddingSmall),
        decoration: BoxDecoration(
          color: AppColors.cardBgHover.withOpacity(0.5),
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusSmall),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primary, size: 20),
            const SizedBox(width: AppTheme.paddingSmall),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    value,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.open_in_new_outlined,
              color: AppColors.primary,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
