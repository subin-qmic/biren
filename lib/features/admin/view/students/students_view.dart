import 'package:biren_kocluk/features/admin/view/students/student_edit_view.dart';
import 'package:biren_kocluk/product/enum/firebase_collection_enum.dart';
import 'package:biren_kocluk/product/init/theme/light_theme_colors.dart';
import 'package:biren_kocluk/product/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentsView extends StatelessWidget {
  const StudentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kayıtlı Öğrenciler"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseCollections.students.reference
            .where("isVerified", isEqualTo: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: _userName(snapshot, index),
                  leading: _avatar(snapshot, index),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => StudentEditView(
                            userModel: UserModel(
                              grade: snapshot.data!.docs[index]["grade"],
                              classText: snapshot.data!.docs[index]["class"],
                              name: snapshot.data!.docs[index]["name"],
                              mail: snapshot.data!.docs[index]["mail"],
                              password: snapshot.data!.docs[index]["password"],
                              createdTime: snapshot.data!.docs[index]
                                  ["createdTime"],
                              isVerified: snapshot.data!.docs[index]
                                  ["isVerified"],
                              uid: snapshot.data!.docs[index]["uid"],
                            ),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit_outlined),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Text _userName(AsyncSnapshot<QuerySnapshot<Object?>> snapshot, int index) =>
      Text(snapshot.data!.docs[index]["name"]);

  CircleAvatar _avatar(
      AsyncSnapshot<QuerySnapshot<Object?>> snapshot, int index) {
    return CircleAvatar(
      backgroundColor: LightThemeColors.blazeOrange.withOpacity(.3),
      child: Text(
        snapshot.data!.docs[index]["name"].toString().characters.first,
      ),
    );
  }
}