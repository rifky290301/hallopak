import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hallopak/app/data/models/user_model.dart';
import 'package:hallopak/app/modules/complaint/views/detail_complaint_view.dart';
import 'package:hallopak/app/routes/app_pages.dart';
import 'package:hallopak/app/themes/extensions/app_text_style.dart';
import 'package:hallopak/app/themes/helpers/convert_time.dart';
import 'package:hallopak/app/themes/widgets/app_decoration.dart';
import 'package:hallopak/app/themes/widgets/app_header.dart';
import 'package:hallopak/app/themes/widgets/app_list_tile.dart';
import 'package:hallopak/app/themes/widgets/app_skeletons.dart';

import '../../../themes/constants/app_size.dart';
import '../controllers/complaint_controller.dart';

class ComplaintView extends GetView<ComplaintController> {
  const ComplaintView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppDecoration.appHeader,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppHeader.appBack,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppHeader.appText('Komplain List', paddingbottom: 0),
                  if (controller.role == WARGA)
                    Container(
                      height: 45,
                      width: 45,
                      margin: const EdgeInsets.only(right: AppSize.medium),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.small),
                        color: const Color(0xFFFDF5ED),
                      ),
                      child: IconButton(
                        onPressed: () => Get.toNamed(Routes.ADD_COMPLAINT),
                        icon: const Icon(
                          Icons.add_rounded,
                          color: Color(0xFFDA6317),
                        ),
                      ),
                    ),
                ],
              ),
              Expanded(
                child: GetBuilder<ComplaintController>(
                  init: controller,
                  builder: (_) {
                    if (_.isLoad) {
                      return ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: AppSize.small),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return CustomSkeleton.skeletonListTile(context);
                        },
                      );
                    } else if (_.complaints.isEmpty) {
                      return Center(
                        child: Text(
                          'Tidak ada pengaduan',
                          style: AppTextStyle.textMedium.copyWith(fontSize: 16),
                        ),
                      );
                    }
                    return ListView.builder(
                      padding: const EdgeInsets.only(top: AppSize.small, left: AppSize.small, right: AppSize.small),
                      itemCount: _.complaints.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Get.to(() => const DetailComplaintView(), arguments: _.complaints[index]),
                          child: AppListTile(
                            icon: Icons.report_gmailerrorred_rounded,
                            title: _.complaints[index].judul!,
                            subtitle: _.complaints[index].deskripsi!,
                            time: ConvertTime.convertDate(_.complaints[index].waktu!),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const Center(child: Text('')),
            ],
          ),
        ),
      ),
    );
  }
}
