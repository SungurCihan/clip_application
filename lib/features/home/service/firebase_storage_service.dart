import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

abstract class IStorageService {
  Future<firebase_storage.ListResult> listFiles();
  Future<String> downloadUrl(String imageName);
}

class FirebaseStorageService implements IStorageService {
  static final FirebaseStorageService _instance =
      FirebaseStorageService._init();
  static FirebaseStorageService get instance => _instance;

  FirebaseStorageService._init();

  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  @override
  Future<firebase_storage.ListResult> listFiles() async {
    firebase_storage.ListResult results = await storage.ref('images').listAll();

    return results;
  }

  @override
  Future<String> downloadUrl(String imageUrl) async {
    String downloadUrl = await storage.ref(imageUrl).getDownloadURL();

    return downloadUrl;
  }
}
