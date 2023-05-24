import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:reportes_sia_stable/models/models.dart';

class FirebaseColaboradoresNotifier
    extends StateNotifier<List<ColaboradoresModel>> {
  FirebaseColaboradoresNotifier() : super([]);

  createColaborador() {}

  deleteColaborador(int firebaseId) {}
}
