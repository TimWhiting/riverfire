import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:riverpod/riverpod.dart';

FutureProvider<FirebaseApp> createRiverFireApp(Future<FirebaseApp> app) =>
    FutureProvider<FirebaseApp>((_) => app);

FutureProvider<RiverFireConfig> createRiverFireConfig(
        FutureProvider<FirebaseApp> app,
        {bool persist = true}) =>
    FutureProvider<RiverFireConfig>((ref) async => RiverFireConfig(
          ref,
          await ref.read(app.future),
          persist: persist,
        ));

class RiverFireConfig {
  RiverFireConfig(this.ref, this.app, {bool persist = true}) {
    firestore = FirebaseFirestore.instanceFor(app: app);
    firestore.settings = Settings(persistenceEnabled: persist);
    if (persist) {
      firestore.enablePersistence();
    }
  }
  final FirebaseApp app;
  FirebaseFirestore firestore;
  FirebaseApp get firebaseApp => app;
  final ProviderReference ref;
}

extension RiverFireAppConfigX on FutureProvider<FirebaseApp> {
  FutureProvider<RiverFireConfig> riverFireConfig({bool persist = true}) =>
      createRiverFireConfig(this, persist: persist);
}
