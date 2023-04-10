// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:image_picker/image_picker.dart';

// class EditProfile extends StatefulWidget {
//   const EditProfile({Key? key}) : super(key: key);

//   @override
//   EditProfileState createState() => EditProfileState();
// }

// class EditProfileState extends State<EditProfile> {
//   late File imageFile;

//   Future<void> _pickImage(ImageSource source) async {
//     final pickedFile = await ImagePicker().pickImage(source: source);
//     if (pickedFile != null) {
//       setState(() {
//         imageFile = File(pickedFile.path);
//       });
//     } else {
//       debugPrint('No image selected.');
//     }
//   }

//   Future<void> _getImage() async {
//     showModalBottomSheet<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return SafeArea(
//           child: Wrap(
//             children: [
//               ListTile(
//                 leading: const Icon(Icons.photo_library),
//                 title: const Text('Choose from Gallery'),
//                 onTap: () {
//                   _pickImage(ImageSource.gallery);
//                   Navigator.of(context).pop();
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.camera_alt),
//                 title: const Text('Take a Photo'),
//                 onTap: () {
//                   _pickImage(ImageSource.camera);
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final user = FirebaseAuth.instance.currentUser;
//     final photoUrl = user?.photoURL;

//     return Center(
//       child: Column(
//         children: [
//           InkWell(
//             onTap: _getImage,
//             child: Center(
//               child: StatefulBuilder(
//                 builder: (BuildContext context, StateSetter setState) {
//                   return ClipOval(
//                     clipBehavior: Clip.antiAliasWithSaveLayer,
//                     child: CircleAvatar(
//                       radius: 50,
//                       backgroundColor: Colors.grey[200],
//                       child: _imageFile != null
//                           ? FileImage(_imageFile)
//                           : photoUrl != null
//                               ? NetworkImage(photoUrl)
//                               : const AssetImage('assets/images/avatar.png'),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//           const SizedBox(height: 16),
//           TextButton(
//             onPressed: () async {
//               if (_imageFile != null) {
//                 // Upload the new image to Firebase Storage and update the user's photoURL
//                 final url = await uploadImageToFirebaseStorage(_imageFile);
//                 user?.updateProfile(photoURL: url);
//               }
//             },
//             child: const Text('Save'),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<String> uploadImageToFirebaseStorage(File file) async {
//     // Implement your code here to upload the file to Firebase Storage and get the download URL for the image
//     return 'https://example.com/photo.png';
//   }
// }
