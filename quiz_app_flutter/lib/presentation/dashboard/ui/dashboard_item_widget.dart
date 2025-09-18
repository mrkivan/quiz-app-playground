import 'package:flutter/material.dart';
import 'package:quiz_app_flutter/domain/entities/dashboard/dashboard_data.dart';
import 'package:quiz_app_flutter/presentation/utils/ui/core/app_spacers.dart';
import 'package:quiz_app_flutter/presentation/utils/ui/widgets/app_text_styles.dart';
import 'package:quiz_app_flutter/presentation/utils/ui/widgets/base_card_view.dart';
import 'package:quiz_app_flutter/presentation/utils/ui/widgets/circle_with_number.dart';

class DashboardItemWidget extends StatelessWidget {
  final DashboardDataItem item; // Your domain model equivalent
  final VoidCallback onClick;

  const DashboardItemWidget({super.key, required this.item, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return BaseCardView(
      onClick: onClick,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon
          Image.asset(getIcon(item.sectionId), width: 32, height: 32),
          AppSpacers.largeWidth,

          // Title
          Expanded(child: AppTextStyles.dashboardTitle(item.title)),
          AppSpacers.mediumWidth,

          // Total number circle
          CircleWithNumber(number: item.total),
        ],
      ),
    );
  }

  String getIcon(int sectionId) {
    switch (sectionId) {
      case 1:
        return 'assets/icons/ic_android_icon.webp';
      case 2:
        return 'assets/icons/ic_kotlin_icon.webp';
      case 3:
        return 'assets/icons/ic_java_icon.webp';
      default:
        return 'assets/icons/ic_android_icon.webp';
    }
  }
}
