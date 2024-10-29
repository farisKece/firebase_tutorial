# Tutorial Firebase

Foobar is a Python library for dealing with word pluralization.

## Installation Firebase cli

Sebelum install Firebase cli download dulu [Node.js](https://nodejs.org/en/download/package-manager)

```bash
# Cek versi nodejs nya
nodejs -v
```
```bash
# Cek versi nodejs nya
npm -v
```

## Step install firebase cli
```bash
# install firebase tools
npm install -g firebase-tools
```
```bash
# login ke firebase
firebase login
```
```bash
# cek apakah berfungsi firebase nya
firebase projects:list
```
```bash
# buat project flutter awal
flutter create project Nama_project_kalian
```
```bash
# masuk proejct kalian
cd project_kalian
```
```bash
# aktifasi firebase secara global
dart pub global activate flutterfire_cli
```
```bash
# kita configure flutterfire di project kita
flutterfire configure
# ketika mau buat project yang beda lagi dan kita mau pake firebase nya, kita wajib untuk ngerun perintah di atas
```
* Untuk Android, pastikan telah mendaftarkan namespace di `android/app/build.gradle`.
```bash
# tambahkan package firebase_core dan cloud_firestore
flutter pub add firebase_core cloudfirestore
```

```dart 
# inisialisasi WidgetsFlutterBinding dan Firebase.initializeApp
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}
```
## Pesan dari author

Wes tak gawe dokumentasi e, lek semisal onk sing leren takon kebangeten yoaopo coro install e hancok

Repo iki pokok e dek update sampe mben dadi gurung final.

## License

[MIT](https://choosealicense.com/licenses/mit/)