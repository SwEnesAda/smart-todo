# 📝 Smart Todo

Smart Todo, Flutter ile geliştirilmiş, temiz mimari prensiplerine uygun bir **Todo / Görev Yönetimi** uygulamasıdır. Proje; ölçeklenebilirlik, okunabilirlik ve profesyonel geliştirme pratiği hedeflenerek hazırlanmıştır.

---

## 🚀 Özellikler

* ✅ Görev ekleme / silme / güncelleme
* 🔁 Görev tamamlama durumu (toggle)
* 🎨 Tema yönetimi (Light / Dark)
* 🧠 MVVM mimari yaklaşımı
* 📁 Feature-based klasör yapısı
* 📱 Flutter ile cross-platform destek (Android, iOS, Web, Desktop)

---

## 🧱 Proje Mimarisi

Proje, **feature-based + MVVM** yaklaşımıyla yapılandırılmıştır:

```
lib/
├── core/
│   └── theme/
│       ├── app_theme.dart
│       └── theme_view_model.dart
├── features/
│   ├── settings/
│   │   └── view/
│   │       └── settings_page.dart
│   └── tasks/
│       ├── model/
│       │   └── task.dart
│       ├── view/
│       │   └── task_page.dart
│       └── viewmodel/
│           └── task_view_model.dart
└── main.dart
```

---

## 🛠 Kullanılan Teknolojiler

* **Flutter**
* **Dart**
* **ChangeNotifier** (State Management)
* **Material Design**

---

## 📦 Kurulum

Projeyi lokalinde çalıştırmak için:

```bash
git clone https://github.com/SwEnesAda/smart-todo.git
cd smart-todo
flutter pub get
flutter run
```

---

## 📌 Proje Durumu

Bu proje şu anda **frontend odaklıdır** ve görevler **lokal bellekte** tutulmaktadır.

> İleride backend entegrasyonu (REST API, Firebase veya n8n gibi) eklenmesi planlanabilir.

---

## 👤 Geliştirici

* **Enes Ada**
* GitHub: [SwEnesAda](https://github.com/SwEnesAda)

---

## 📄 Lisans

Bu proje MIT lisansı ile lisanslanmıştır.

---

> ✨ Bu proje, Flutter ile profesyonel mimari kurma pratiği amacıyla geliştirilmiştir.
