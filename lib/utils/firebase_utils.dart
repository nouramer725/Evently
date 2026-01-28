import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/event_model.dart';

class FirebaseUtils {
  static CollectionReference<Event> getEventsCollections() {
    return FirebaseFirestore.instance
        .collection(Event.eventsCollection)
        .withConverter<Event>(
          fromFirestore: (snapshot, _) => Event.fromFireStore(snapshot.data()!),
          toFirestore: (event, options) => event.toFireStore(),
        );
  }

  static Future<void> addEventToFirestore(Event event) {
    CollectionReference<Event> collectionReference = getEventsCollections();
    DocumentReference<Event> documentReference = collectionReference.doc();
    event.id = documentReference.id;
    return documentReference.set(event);
  }
}
