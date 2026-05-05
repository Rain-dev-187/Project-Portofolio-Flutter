import 'package:flutter/material.dart';
import '../config/app_colors.dart';
import '../config/app_theme.dart';

class UserInputPage extends StatefulWidget {
  const UserInputPage({super.key});

  @override
  State<UserInputPage> createState() => _UserInputPageState();
}

class _UserInputPageState extends State<UserInputPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  String? _selectedOption;
  bool _agreedToTerms = false;
  String _displayName = '';
  String _displayEmail = '';
  String _displayMessage = '';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_nameController.text.isEmpty || _emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Harap isi semua field!'),
          backgroundColor: AppColors.error,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
          ),
        ),
      );
      return;
    }

    setState(() {
      _displayName = _nameController.text;
      _displayEmail = _emailController.text;
      _displayMessage = _messageController.text;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Form berhasil disubmit!'),
        backgroundColor: AppColors.success,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.borderRadiusMedium),
        ),
      ),
    );
  }

  void _clearForm() {
    _nameController.clear();
    _emailController.clear();
    _messageController.clear();
    setState(() {
      _displayName = '';
      _displayEmail = '';
      _displayMessage = '';
      _selectedOption = null;
      _agreedToTerms = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBg,
      appBar: AppBar(
        title: const Text('Form Input'),
        backgroundColor: AppColors.cardBg,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Form Card
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
                        'Formulir Input',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: AppTheme.paddingMedium),

                      // Name TextField
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: 'Masukkan Nama',
                          prefixIcon: const Icon(Icons.person_outline),
                          prefixIconColor: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: AppTheme.paddingMedium),

                      // Email TextField
                      TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Masukkan Email',
                          prefixIcon: const Icon(Icons.email_outlined),
                          prefixIconColor: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: AppTheme.paddingMedium),

                      // Dropdown
                      DropdownButtonFormField<String>(
                        initialValue: _selectedOption,
                        decoration: InputDecoration(
                          hintText: 'Pilih Opsi',
                          prefixIcon: const Icon(Icons.category_outlined),
                          prefixIconColor: AppColors.primary,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              AppTheme.borderRadiusMedium,
                            ),
                            borderSide: const BorderSide(
                              color: AppColors.cardBgHover,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              AppTheme.borderRadiusMedium,
                            ),
                            borderSide: const BorderSide(
                              color: AppColors.cardBgHover,
                            ),
                          ),
                          filled: true,
                          fillColor: AppColors.cardBg,
                        ),
                        items: ['Option 1', 'Option 2', 'Option 3'].map((
                          option,
                        ) {
                          return DropdownMenuItem(
                            value: option,
                            child: Text(option),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedOption = value;
                          });
                        },
                      ),
                      const SizedBox(height: AppTheme.paddingMedium),

                      // Message TextField
                      TextField(
                        controller: _messageController,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: 'Masukkan Pesan (opsional)',
                          prefixIcon: const Icon(Icons.message_outlined),
                          prefixIconColor: AppColors.primary,
                          alignLabelWithHint: true,
                        ),
                      ),
                      const SizedBox(height: AppTheme.paddingMedium),

                      // Checkbox
                      Row(
                        children: [
                          Checkbox(
                            value: _agreedToTerms,
                            onChanged: (value) {
                              setState(() {
                                _agreedToTerms = value ?? false;
                              });
                            },
                            activeColor: AppColors.primary,
                          ),
                          const Expanded(
                            child: Text(
                              'Saya setuju dengan syarat dan ketentuan',
                              style: TextStyle(color: AppColors.textSecondary),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppTheme.paddingMedium),

                      // Buttons
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: _submitForm,
                              icon: const Icon(Icons.send),
                              label: const Text('Kirim'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                              ),
                            ),
                          ),
                          const SizedBox(width: AppTheme.paddingSmall),
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: _clearForm,
                              icon: const Icon(Icons.refresh),
                              label: const Text('Reset'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppTheme.paddingMedium),

              // Display Results
              if (_displayName.isNotEmpty)
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
                          'Hasil Input:',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(color: AppColors.primary),
                        ),
                        const SizedBox(height: AppTheme.paddingSmall),
                        _buildResultRow('Nama', _displayName),
                        _buildResultRow('Email', _displayEmail),
                        if (_selectedOption != null)
                          _buildResultRow('Opsi', _selectedOption!),
                        if (_displayMessage.isNotEmpty)
                          _buildResultRow('Pesan', _displayMessage),
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

  Widget _buildResultRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppTheme.paddingSmall),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
