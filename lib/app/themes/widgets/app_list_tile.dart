import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_size.dart';
import '../extensions/app_shadow.dart';
import '../extensions/app_text_style.dart';

class AppListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String? time;
  const AppListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 105,
      margin: const EdgeInsets.only(bottom: AppSize.semiSmall),
      padding: const EdgeInsets.symmetric(horizontal: AppSize.medium, vertical: AppSize.semiSmall),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.semiSmall),
        color: Colors.white,
        boxShadow: [AppShadow.appShadowList],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: const Color(0xFFDA6317),
            size: 45,
          ),
          const SizedBox(width: AppSize.semiSmall),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: AppTextStyle.textMedium.copyWith(fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Text(
                      time ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.textRegular.copyWith(
                        fontSize: 14,
                        color: AppColors.textDisable,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSize.micro),
                Text(
                  subtitle,
                  style: AppTextStyle.textRegular.copyWith(fontSize: 14, color: AppColors.textDisable),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
