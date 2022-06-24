import 'package:bloc/bloc.dart';
import 'package:clip_application/features/home/service/firebase_storage_service.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

part 'storage_image_state.dart';

class StorageImageCubit extends Cubit<StorageImageState> {
  StorageImageCubit() : super(const StorageImageState()) {
    initialComplete();
  }

  Future<void> initialComplete() async {
    await Future.wait([
      listFiles(),
    ]);
  }

  Future<void> listFiles() async {
    firebase_storage.ListResult list =
        await FirebaseStorageService.instance.listFiles();
    emit(state.copyWith(list: list));
  }

  Future<void> downloadUrl(String imageUrl) async {
    String downloadUrl =
        await FirebaseStorageService.instance.downloadUrl(imageUrl);
    emit(state.copyWith(downloadUrl: downloadUrl));
  }
}
