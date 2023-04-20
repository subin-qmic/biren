import 'package:biren_kocluk/core/enum/admin_feature_types.dart';
import 'package:biren_kocluk/core/init/lang/locale_keys.g.dart';
import 'package:biren_kocluk/core/init/theme/light_theme_colors.dart';
import 'package:biren_kocluk/features/admin/view/add_announcement_view.dart';
import 'package:biren_kocluk/features/request_study/view/study_view.dart';
import 'package:biren_kocluk/gen/assets.gen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class FeatureSelectCard extends StatefulWidget {
  const FeatureSelectCard({super.key, required this.featureTypes});

  final FeatureTypes featureTypes;

  @override
  State<FeatureSelectCard> createState() => _FeatureSelectCardState();
}

class _FeatureSelectCardState extends State<FeatureSelectCard> {
  late String imagePath;
  late String title;
  late Widget callView;

  @override
  void initState() {
    super.initState();
    switch (widget.featureTypes) {
      case FeatureTypes.task:
        imagePath = Assets.images.task.path;
        title = LocaleKeys.studentFeatures_tasks.tr();
        callView = const AddAnnouncementView();
        break;
      case FeatureTypes.study:
        imagePath = Assets.images.study.path;
        title = LocaleKeys.studentFeatures_requestAStudy.tr();
        callView = const StudyView();
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => callView,
              ),
            );
          },
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: LightThemeColors.white,
              borderRadius: context.normalBorderRadius,
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text(
          title,
          style: context.textTheme.titleMedium,
        ),
      ],
    );
  }
}
