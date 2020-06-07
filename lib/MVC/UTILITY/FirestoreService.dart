import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:face_tag/MVC/MODELS/User.dart';


class FirestoreService {
  
  Future createUser(User user) async {
    final CollectionReference _usersCollectionReference =
      Firestore.instance.collection("users");
    try {
      await _usersCollectionReference.document(user.id).setData(user.toJson());
    } catch (e) {
      return e.message;
    }
  }
// locator.registerLazySingleton(() => FirestoreService());
//   Future signUpWithEmail({
//   }) async {
//     try {
//       await _firestoreService.createUser(User(
//           id: authResult.user.uid,
//           email: email,
//           fullName: fullName,
//           userRole: role));
//       return authResult.user != null;
//     } catch (e) {
//       return e.message;
//     }
//   }
 }