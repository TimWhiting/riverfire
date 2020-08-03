import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:riverpod/riverpod.dart';

Provider<FirebaseApp> createRiverFireApp(FirebaseApp app) =>
    Provider<FirebaseApp>((_) => app);

Provider<RiverFireConfig> createRiverFireConfig(Provider<FirebaseApp> app,
        {bool persist = true}) =>
    Provider<RiverFireConfig>((ref) => RiverFireConfig(
          ref,
          ref.read(app),
          persist: persist,
        ));

class RiverFireConfig {
  RiverFireConfig(this.ref, this.app, {bool persist = true}) {
    firestore = FirebaseFirestore.instanceFor(app: app);
    firestore.settings = Settings(persistenceEnabled: persist);
  }
  final FirebaseApp app;
  FirebaseFirestore firestore;
  FirebaseApp get firebaseApp => app;
  final ProviderReference ref;
}
