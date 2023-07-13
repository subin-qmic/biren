import 'package:biren_kocluk/features/admin/view/attendance/take_attendance_view.dart';
import 'package:biren_kocluk/product/constants/firestore_field_constants.dart';
import 'package:biren_kocluk/product/enum/firebase_collection_enum.dart';
import 'package:biren_kocluk/product/init/lang/locale_keys.g.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

mixin TakeAttendanceOperationMixin on State<TakeAttendanceView> {
  late DateTime selectedDate;
  List<String> statusList = <String>[
    LocaleKeys.came.tr(),
    LocaleKeys.didntCame.tr()
  ];
  String? statusValueTR;
  String? statusValue;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.selectedDate ?? DateTime.now();
  }

  void onSubmitButton() async {
    await FirebaseCollections.attendance.reference.add({
      FirestoreFieldConstants.nameField: widget
          .snapshot.data!.docs[widget.index][FirestoreFieldConstants.nameField],
      FirestoreFieldConstants.uidField: widget.snapshot.data!.docs[widget.index]
          [FirestoreFieldConstants.uidField],
      FirestoreFieldConstants.statusField: statusValue,
      FirestoreFieldConstants.dateField: Timestamp.fromDate(selectedDate),
    });
    if (mounted) {
      Navigator.pop<bool>(context, true);
    }
  }
}
