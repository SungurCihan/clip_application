part of 'storage_image_cubit.dart';

class StorageImageState extends Equatable {
  final firebase_storage.ListResult? list;
  final String? downloadUrl;

  const StorageImageState({
    this.list,
    this.downloadUrl,
  });

  @override
  List<Object?> get props => [
        list,
        downloadUrl,
      ];

  StorageImageState copyWith({
    firebase_storage.ListResult? list,
    String? downloadUrl,
  }) {
    return StorageImageState(
      list: list ?? this.list,
      downloadUrl: downloadUrl ?? this.downloadUrl,
    );
  }
}
