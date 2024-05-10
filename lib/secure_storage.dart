import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage extends StatefulWidget {
  const SecureStorage({super.key});

  @override
  State<SecureStorage> createState() => _SecureStorageState();
}

class _SecureStorageState extends State<SecureStorage> {
  static TextEditingController controller = TextEditingController();

  ///Add Data to Secure Storage
  void addDataToStorage()async{
    FlutterSecureStorage storage = const FlutterSecureStorage();
    await storage.write(key: 'password', value: controller.text);
  }

  ///Read Data From Secure Storage
  void readDataFromStorage()async{
    FlutterSecureStorage storage = const FlutterSecureStorage();
    String value = await storage.read(key: 'password') ?? 'No Data Found here';
  }

  ///Delete Data
  Future deleteDataFromStorage()async{
    FlutterSecureStorage storage = const FlutterSecureStorage();
    await storage.delete(key: 'password');
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Please Enter Data'
              ),
            ),
            const SizedBox(height: 20),

            ///Button To Insert Data
            GestureDetector(
              onTap: () => addDataToStorage(),
              child: Container(
                height: 40,
                width: 80,
                color: Colors.green,
                child: const Center(child: Text('Add Data')),
              ),
            ),
            const SizedBox(height: 20),

            ///Read Data From Secure Storage
            GestureDetector(
              onTap: () => readDataFromStorage(),
              child: Container(
                height: 40,
                width: 80,
                color: Colors.green,
                child: const Center(child: Text('Read Data')),
              ),
            ),
            const SizedBox(height: 20),

            ///Delete Data
            GestureDetector(
              onTap: () => deleteDataFromStorage(),
              child: Container(
                height: 40,
                width: 80,
                color: Colors.green,
                child: const Center(child: Text('Delete Data')),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
