import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:one_context/one_context.dart';
import 'package:reportes_sia_stable/widgets/text/text_widget.dart';

class FirebaseStorageNotifier extends StateNotifier<dynamic> {
  FirebaseStorageNotifier() : super(null);
  final storageRef = FirebaseStorage.instance.ref();

  Future<String?> uploadFile(FilePickerResult selectedImage, String route) async {
    String? downloadUrl = null;

    final fileUploadRef = storageRef.child(route).child('/+${selectedImage.files.first.name}');
    await fileUploadRef.putData(selectedImage.files.first.bytes!).snapshotEvents.listen((TaskSnapshot taskSnapshot) async {
      switch (taskSnapshot.state) {
        case TaskState.running:
          final progress = 100.0 * (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
          print("Upload is $progress% complete.");

          break;
        case TaskState.paused:
          OneContext().showDialog(builder: (_) {
            return AlertDialog(
              title: Text('Pausado'),
              actions: [FilledButton.tonal(onPressed: () => OneContext().popDialog(), child: Text('De acuerdo'))],
            );
          });
          break;
        case TaskState.canceled:
          OneContext().showDialog(builder: (_) {
            return AlertDialog(
              title: Text('Cancelado'),
              actions: [FilledButton.tonal(onPressed: () => OneContext().popDialog(), child: Text('De acuerdo'))],
            );
          });
          break;
        case TaskState.error:
          OneContext().showDialog(builder: (_) {
            return AlertDialog(
              title: Text('Error al subir archivo'),
              actions: [FilledButton.tonal(onPressed: () => OneContext().popDialog(), child: Text('De acuerdo'))],
            );
          });
          break;
        case TaskState.success:
          print('Objeto terminado de subir');
          downloadUrl = await taskSnapshot.ref.getDownloadURL();
          break;
      }
    });
  }
}

final firebaseStorageProvider = StateNotifierProvider<FirebaseStorageNotifier, dynamic>((ref) {
  return FirebaseStorageNotifier();
});
