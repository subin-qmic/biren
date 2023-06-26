import 'package:biren_kocluk/product/enum/admin_feature_types.dart';
import 'package:biren_kocluk/product/init/lang/locale_keys.g.dart';
import 'package:biren_kocluk/product/widget/admin/admin_select_feature.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AdminHomeView extends StatefulWidget {
  const AdminHomeView({super.key});

  @override
  State<AdminHomeView> createState() => _AdminHomeViewState();
}

class _AdminHomeViewState extends State<AdminHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _body(),
    );
  }

  AppBar get _buildAppBar => AppBar(
        title: Text(LocaleKeys.adminText.tr()),
      );

  SafeArea _body() {
    return SafeArea(
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
        ),
        children: const [
          AdminSelectFeature(featureTypes: FeatureTypes.homeworks),
          AdminSelectFeature(featureTypes: FeatureTypes.attendance),
          AdminSelectFeature(featureTypes: FeatureTypes.exams),
          AdminSelectFeature(featureTypes: FeatureTypes.announcement),
          AdminSelectFeature(featureTypes: FeatureTypes.classes),
          AdminSelectFeature(featureTypes: FeatureTypes.students),
        ],
      ),
    );
  }
}
