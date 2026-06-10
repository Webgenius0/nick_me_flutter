import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nick_me/assets_helper/app_colors.dart';
import 'package:nick_me/assets_helper/app_lottie.dart';

Widget loadingIndicatorCircle({
  required BuildContext context,
  Color? color,
  double? size,
}) {
  // double loaderSize = 100.sp;
  return DotLottieLoader.fromAsset(
    AppLottie.trailLoading,
    frameBuilder: (ctx, dotlottie) {
      if (dotlottie != null) {
        return Center(
          child: Lottie.memory(
            dotlottie.animations.values.single,
            height: 150,
            delegates: LottieDelegates(
              values: [
                ValueDelegate.color(['**'], value: AppColor.c8A8A8A),
              ],
            ),
          ),
        );
      }
      return SizedBox();
    },
  );
}
