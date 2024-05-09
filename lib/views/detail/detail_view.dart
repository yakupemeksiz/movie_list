import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:movie_list/common/base/base_view.dart';
import 'package:movie_list/common/constants/app_constants.dart';
import 'package:movie_list/common/constants/color_constants.dart';
import 'package:movie_list/common/constants/localization_constants.dart';
import 'package:movie_list/common/extensions/context_extensions.dart';
import 'package:movie_list/common/extensions/widget_extensions.dart';
import 'package:movie_list/inject.dart';
import 'package:movie_list/services/models/response/movie_detail_response_model.dart';
import 'package:movie_list/views/detail/detail_view_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

part 'widgets/detail_body_widget.dart';

@RoutePage()
final class DetailView extends BaseView<DetailViewModel> {
  final int id;

  DetailView({required this.id, super.key})
      : super(vm: () => getIt.call(param1: id));

  @override
  Widget build(BuildContext context, DetailViewModel vm) {
    return OrientationBuilder(
      builder: (_, orientation) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(context.topPadding),
            IconButton(
              onPressed: () {
                context.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
            ),
            Flexible(
              child: YoutubePlayer(
                controller: vm.controller,
              ),
            ),
            Gap(16.h),
            if (orientation == Orientation.portrait)
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: _DetailBodyWidget(
                    detailModel: vm.detailModel,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
