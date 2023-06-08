// ignore_for_file: unrelated_type_equality_checks, use_build_context_synchronously

import 'dart:io';

import 'package:biren_kocluk/features/admin/service/announcement_service.dart';
import 'package:biren_kocluk/product/enum/firebase_collection_enum.dart';
import 'package:biren_kocluk/product/init/theme/light_theme_colors.dart';
import 'package:biren_kocluk/product/widget/button/done_action_button.dart';
import 'package:biren_kocluk/product/widget/text_field/main_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kartal/kartal.dart';

class CheckHomeworkView extends StatefulWidget {
  const CheckHomeworkView({Key? key}) : super(key: key);

  @override
  State<CheckHomeworkView> createState() => _CheckHomeworkViewState();
}

class _CheckHomeworkViewState extends State<CheckHomeworkView> {
  XFile? imageXfile;
  File? image;
  late String imageDownloadURL;
  TextEditingController descriptionController = TextEditingController();

  void pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      imageXfile = image;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException {
      return;
    }
  }

  Future<void> onSubmitButton() async {
    imageDownloadURL = await AnnouncementService().uploadImage(imageXfile!);
    FirebaseCollections.homeworkPush.reference.add({
      "description": descriptionController.text,
      "image": imageDownloadURL,
      "senderName": FirebaseAuth.instance.currentUser!.displayName,
      "senderMail": FirebaseAuth.instance.currentUser!.email,
      "senderUserID": FirebaseAuth.instance.currentUser!.uid,
    });
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    pickImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          _submitButton(),
          context.emptySizedWidthBoxNormal,
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              image != null ? _image(context) : _selectImageButton(),
              context.emptySizedHeightBoxLow3x,
              Padding(
                padding: context.horizontalPaddingNormal,
                child: Column(
                  children: [
                    MainTextField(
                      hintText: "Açıklama (İsteğe Bağlı)",
                      keyboardType: TextInputType.text,
                      controller: descriptionController,
                      minLines: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DoneActionButton _submitButton() {
    return DoneActionButton(
      color: image != null
          ? LightThemeColors.blazeOrange
          : LightThemeColors.blazeOrange.withOpacity(.6),
      onTap: () {
        image != onSubmitButton() ? null : null;
      },
    );
  }

  Center _selectImageButton() {
    return Center(
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: LightThemeColors.red,
        ),
        onPressed: () {
          pickImage();
        },
        child: const Text("Fotoğraf Seçilmedi!"),
      ),
    );
  }

  GestureDetector _image(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pickImage();
      },
      child: SizedBox(
        width: context.width,
        child: Image.file(image!, fit: BoxFit.cover),
      ),
    );
  }
}