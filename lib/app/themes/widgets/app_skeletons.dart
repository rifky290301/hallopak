import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

import '../constants/app_size.dart';

class CustomSkeleton {
  static Column skeletonListTile(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SkeletonAvatar(
              style: SkeletonAvatarStyle(
                borderRadius: BorderRadius.all(Radius.circular(AppSize.semiSmall)),
                width: 60,
                height: 60,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: SkeletonParagraph(
                style: SkeletonParagraphStyle(
                  lines: 2,
                  spacing: 6,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  lineStyle: SkeletonLineStyle(
                    height: 16,
                    borderRadius: BorderRadius.circular(8),
                    minLength: MediaQuery.of(context).size.width / 6,
                    maxLength: MediaQuery.of(context).size.width / 2,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
