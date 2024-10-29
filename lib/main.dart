import 'package:faris_firebase/controller_faris.dart';
import 'package:faris_firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final bukuC = Get.put(FarisController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('firebase_faris'),
      ),
      body:
          Obx(
        () {
          if (bukuC.bukuJson.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: bukuC.bukuJson.length,
            itemBuilder: (context, index) {
              final buku = bukuC.bukuJson[index];
              return ListTile(
                title: Text(buku['penulis']),
                subtitle: Text(buku['publish_date'].toString()),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        String jsonData = bukuC.convertToJson();
        print(jsonData);
      }),
    );
  }
}
