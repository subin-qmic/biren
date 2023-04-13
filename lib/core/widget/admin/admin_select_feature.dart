import 'package:biren_kocluk/core/enum/admin_feature_types.dart';
import 'package:biren_kocluk/core/init/theme/light_theme_colors.dart';
import 'package:biren_kocluk/features/admin/view/add_announcement_view.dart';
import 'package:biren_kocluk/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class AdminSelectFeature extends StatefulWidget {
  const AdminSelectFeature({super.key, required this.featureTypes});

  final FeatureTypes featureTypes;

  @override
  State<AdminSelectFeature> createState() => _AdminSelectFeatureState();
}

class _AdminSelectFeatureState extends State<AdminSelectFeature> {
  late String imagePath;
  late String title;
  late Widget callView;

  @override
  void initState() {
    super.initState();
    switch (widget.featureTypes) {
      case FeatureTypes.announcement:
        imagePath = Assets.images.announcement.path;
        title = "Duyuru Oluştur";
        callView = const AddAnnouncementView();
        break;
      case FeatureTypes.task:
        imagePath = Assets.images.task.path;
        title = "Ödev Oluştur";
        callView = const AddAnnouncementView();
        break;
      case FeatureTypes.student:
        imagePath = Assets.images.student.path;
        title = "Öğrenciler";
        callView = const AddAnnouncementView();
        break;
      case FeatureTypes.login:
        imagePath = Assets.images.login.path;
        title = "Giriş Talepleri";
        callView = const AddAnnouncementView();
        break;
      case FeatureTypes.study:
        imagePath = Assets.images.study.path;
        title = "Etüt İstekleri";
        callView = const AddAnnouncementView();
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
