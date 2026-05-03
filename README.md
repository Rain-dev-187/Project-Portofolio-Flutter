# Project Portofolio Flutter

Portofolio Flutter modern yang menampilkan skill, desain UI/UX dark theme, dan beberapa halaman fungsional untuk menunjukkan kemampuan pengembangan aplikasi.

---

##  Ringkasan

Aplikasi ini dirancang untuk memperlihatkan portofolio developer dengan:
- Tampilan dark theme yang konsisten
- Dashboard interaktif dengan menu grid
- Kontrol state menggunakan StatefulWidget
- Informasi personal dan daftar keahlian
- Animasi, feedback tap, dan progress bar
- Struktur kode modular yang mudah dikembangkan

---

##  Fitur Utama

- **Dashboard interaktif** dengan GridView dan menu cards
- **Counter App** untuk demo increment / decrement / reset
- **Nested Widgets** untuk demo layout kompleks
- **Form Input** dengan validasi dan hasil input user
- **Dynamic Lists** menggunakan `ListView.builder`
- **Navigation** dengan push, pop, dan replace routes
- **Grid Layout** untuk menampilkan teknologi dan fitur aplikasi
- **About Me** dengan profil, skills, dan kontak

---

##  Halaman yang Tersedia

### Dashboard
Menampilkan menu interaktif untuk berpindah ke setiap halaman.

### Counter App
Demo counter dengan animasi pada nilai dan tiga opsi kontrol.

### Nested Widgets
Contoh penggunaan Row, Column, dan Container bersarang untuk layout kompleks.

### Form Input
Form user dengan input text, dropdown, dan checkbox validasi.

### Dynamic Lists
List dinamis yang dibuat dengan `ListView.builder` dan item yang dapat ditekan.

### Navigation
Demonstrasi navigasi halaman: push, pop, dan replace.

### Grid Layout
Contoh grid responsif untuk menampilkan teknologi dan fitur.

### About Me
Halaman profil dengan foto, data diri, deskripsi, skill bar, dan kontak.

---

##  Tentang Developer

**Ahmad Sahrul Fadhilah**
- Program Studi: Sistem Informasi
- Universitas Kebangsaan Republik Indonesia
- GitHub: https://github.com/Rain-dev-187
- Email: ahmadsahrul1887@gmail.com

---

##  Teknologi

- Flutter
- Dart
- Material Design 3
- `font_awesome_flutter` untuk ikon sosial media

---

##  Struktur Proyek

```
lib/
├── config/
│   ├── app_colors.dart
│   └── app_theme.dart
├── screens/
│   ├── about_me_page.dart
│   ├── counter_page.dart
│   ├── dashboard_page.dart
│   ├── dynamic_list_page.dart
│   ├── grid_view_page.dart
│   ├── navigasi_page.dart
│   ├── user_input_page.dart
│   └── widget_bertingkat_page.dart
├── widgets/
│   └── menu_card.dart
└── main.dart
```

---

##  Cara Menjalankan

```bash
cd f:\Projects\project_portofolio_v2
git init
flutter pub get
flutter run
```

Untuk menjalankan di Web:

```bash
flutter run
```

---

##  Catatan

- Aplikasi ini menggunakan desain dark theme modern dan komponen Material 3.
- Kontak di halaman About Me dapat disalin langsung ke clipboard dengan sekali klik.
