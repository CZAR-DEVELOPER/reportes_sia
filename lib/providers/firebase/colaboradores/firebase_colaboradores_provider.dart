import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:one_context/one_context.dart';
import 'package:reportes_sia_stable/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reportes_sia_stable/widgets/text/text_widget.dart';

class FirebaseColaboradoresNotifier extends StateNotifier<List<ColaboradoresModel>> {
  FirebaseColaboradoresNotifier(this.ref) : super([]);

  //VARIABLES
  final firestoreRef = FirebaseFirestore.instance.collection('colaboradores');
  final storageRef = FirebaseStorage.instance.ref();
  final Ref ref;

  subirfoto(FilePickerResult selectedImage) async {
    final fileReference = this.storageRef.child('colaboradores/${selectedImage.files.first.name}');
    try {
      await fileReference.putData(selectedImage.files.first.bytes!).whenComplete(() async {
        String url = await fileReference.getDownloadURL();
        print(url);
      });
    } on FirebaseException catch (e) {
      // ...
    }
  }

  createColaborador({FilePickerResult? selectedImage, required ColaboradoresModel colaboradoresModel}) async {
    OneContext().showProgressIndicator();

    try {
      if (selectedImage != null) {
        final fileReference = this.storageRef.child('colaboradores/${selectedImage.files.first.name}');
        await fileReference.putData(selectedImage.files.first.bytes!).whenComplete(() async {
          String url = await fileReference.getDownloadURL();
          colaboradoresModel = colaboradoresModel.copyWith(imageUrl: url);
        });
      }

      await firestoreRef.add(colaboradoresModel.toMap()).then((documentSnapshot) {
        OneContext().hideProgressIndicator();
        OneContext().popDialog();
        OneContext().showSnackBar(builder: (_) {
          return SnackBar(content: Text('Colaborador creado correctamente'));
        });
      });
    } on FirebaseException catch (error) {
      // Si ocurre un error, elimina el archivo del Cloud Storage (si se subió)
      if (selectedImage != null) {
        await storageRef.child('colaboradores/${selectedImage.files.first.name}').delete();
      }

      OneContext().hideProgressIndicator();
      OneContext().showDialog(builder: (_) {
        return AlertDialog(
          title: Text('Error'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [Text('No se pudo crear el colaborador correctamente'), TextSmall('Codigo: ${error.code}')],
          ),
        );
      });
    }
  }

  deleteColaborador(int firebaseId) {}
}

final firebaseColaboradoresProvider = StateNotifierProvider<FirebaseColaboradoresNotifier, dynamic>((ref) {
  return FirebaseColaboradoresNotifier(ref);
});
