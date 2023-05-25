import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:one_context/one_context.dart';
import 'package:reportes_sia_stable/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reportes_sia_stable/providers/firebase/cloud_storage/firebase_storage_provider.dart';
import 'package:reportes_sia_stable/widgets/text/text_widget.dart';

class FirebaseColaboradoresNotifier extends StateNotifier<List<ColaboradoresModel>> {
  FirebaseColaboradoresNotifier(this.ref) : super([]);

  //VARIABLES
  final db = FirebaseFirestore.instance;
  final Ref ref;

  createColaborador({required ColaboradoresModel nuevoColaborador, FilePickerResult? selectedImage}) async {
    //PROVIDERS
    final _firebaseStorageProvider = ref.read(firebaseStorageProvider.notifier);

    //VARIABLES
    String? downloadUrl = null;
    bool imageUploadingError = false;

    OneContext().showProgressIndicator();

    if (selectedImage != null) {
      String? downloadUrl = await _firebaseStorageProvider.uploadFile(selectedImage, 'colaboradores');

      print(downloadUrl);

      if (downloadUrl == null) {
        imageUploadingError = true;
      }
    }

    if (imageUploadingError == false) {
      final colaborador = nuevoColaborador.copyWith(imageUrl: downloadUrl).toMap();

      try {
        db.collection("colaboradores").add(colaborador).then((DocumentReference doc) {
          OneContext().popDialog();
          OneContext().hideProgressIndicator();
          OneContext().showSnackBar(builder: (_) => SnackBar(content: Text('Colaborador creado correctamente')));
        });
      } on FirebaseException catch (e) {
        OneContext().showSnackBar(builder: (_) => SnackBar(content: Text('Se ha producido un error al crear el colaborador (${e.code})')));
      }
    }
  }

  crearColaborador(FilePickerResult selectedImage) async {}

  deleteColaborador(int firebaseId) {}
}

final firebaseColaboradoresProvider = StateNotifierProvider<FirebaseColaboradoresNotifier, dynamic>((ref) {
  return FirebaseColaboradoresNotifier(ref);
});
