import 'dart:js_interop';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:one_context/one_context.dart';
import 'package:reportes_sia_stable/models/colaboradores/colaboradores_model.dart';
import 'package:reportes_sia_stable/providers/firebase/cloud_storage/firebase_storage_provider.dart';
import 'package:reportes_sia_stable/providers/firebase/colaboradores/firebase_colaboradores_provider.dart';
import 'package:reportes_sia_stable/widgets/space/space_widgets.dart';
import 'package:reportes_sia_stable/widgets/text/text_widget.dart';

class AdminColaboradoresEditorView extends HookConsumerWidget {
  const AdminColaboradoresEditorView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //PROVIDERS
    final _firebaseColaboradoresProvider = ref.read(firebaseColaboradoresProvider.notifier);

    //KEYS
    final formValidatorKey = GlobalKey<FormState>();

    //HOOKS
    final selectedImage = useState<FilePickerResult?>(null);
    final nombreController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    //FUNCTIONS
    validateForm() {
      bool isValidated = formValidatorKey.currentState!.validate();

      if (isValidated == true) {
        final nuevoColaborador = ColaboradoresModel(nombre: nombreController.text, email: emailController.text, password: passwordController.text);

        _firebaseColaboradoresProvider.createColaborador(nuevoColaborador: nuevoColaborador, selectedImage: selectedImage.value);
      }
    }

    return AlertDialog(
      scrollable: true,
      title: Text('Crear colaborador'),
      content: Container(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (selectedImage.value != null) ...[
              Image.memory(
                selectedImage.value!.files.first.bytes!,
                height: 150,
              ),
              SpaceY()
            ],
            Align(
                alignment: Alignment.center,
                child: FilledButton.tonalIcon(
                    onPressed: () async {
                      OneContext().showProgressIndicator();

                      FilePickerResult? archivoSeleccionado = await FilePicker.platform.pickFiles(
                          allowMultiple: false,
                          type: FileType.custom,
                          allowedExtensions: ['jpg', 'png', 'jpeg'],
                          onFileLoading: (FilePickerStatus status) {
                            if (status == FilePickerStatus.done) {
                              OneContext().hideProgressIndicator();
                            }
                          });

                      if (archivoSeleccionado != null) {
                        if (archivoSeleccionado.files.first.size <= 2097152) {
                          print(archivoSeleccionado.files.first.name);
                          selectedImage.value = archivoSeleccionado;
                        } else {
                          OneContext().showDialog(builder: (_) {
                            return AlertDialog(
                              title: Text('Atencion'),
                              content: Text('Archivo demasiado grande, elige uno menor a 2MB'),
                              actions: [FilledButton.tonal(onPressed: () => OneContext().popDialog(), child: Text('De acuerdo'))],
                            );
                          });
                        }
                      }
                    },
                    label: Text('Seleccionar imagen (2 MB maximo)'),
                    icon: Icon(CupertinoIcons.camera))),
            if (selectedImage.value != null)
              Align(
                  alignment: Alignment.center,
                  child: TextButton.icon(
                      onPressed: () {
                        selectedImage.value = null;
                      },
                      icon: Icon(CupertinoIcons.delete),
                      label: Text('Eliminar foto'))),
            SpaceY(),
            Form(
                key: formValidatorKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Datos basicos'),
                    SpaceY(),
                    TextFormField(
                      controller: nombreController,
                      decoration: InputDecoration(prefixIcon: Icon(CupertinoIcons.building_2_fill), hintText: 'Nombre del colaborador'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Campo obligatorio';
                        }
                      },
                    ),
                    SpaceY(),
                    Text('Credenciales'),
                    SpaceY(),
                    TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(prefixIcon: Icon(CupertinoIcons.mail), hintText: 'Correo electronico'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo obligatorio';
                          }
                        }),
                    SpaceY(),
                    TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(prefixIcon: Icon(CupertinoIcons.lock), hintText: 'Contraseña'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Campo obligatorio';
                          }
                        }),
                  ],
                ))
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => OneContext().popDialog(), child: Text('Cancelar')),
        FilledButton(onPressed: () => validateForm(), child: Text('Crear colaborador')),
      ],
    );
  }
}
