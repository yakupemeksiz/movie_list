import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movie_list/common/base/base_view.dart';
import 'package:movie_list/common/constants/app_constants.dart';
import 'package:movie_list/common/constants/color_constants.dart';
import 'package:movie_list/common/constants/localization_constants.dart';
import 'package:movie_list/common/extensions/context_extensions.dart';
import 'package:movie_list/inject.dart';
import 'package:movie_list/routers/app_router.dart';
import 'package:movie_list/services/models/response/movie_response_model.dart';
import 'package:movie_list/views/home/home_view_model.dart';

part 'widgets/movie_card_widget.dart';

@RoutePage()
class HomeView extends BaseView<HomeViewModel> {
  HomeView({super.key}) : super(vm: getIt.call);

  @override
  Widget build(BuildContext context, HomeViewModel vm) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Column(
          children: [
            Gap(context.topPadding),
            Text(
              LocalizationConstants.home,
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: PagedGridView(
                padding: EdgeInsets.only(
                  top: 16.h,
                  left: 16,
                  right: 16,
                  bottom: context.bottomPadding + 16.h,
                ),
                pagingController: vm.pagingController,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
                  childAspectRatio: .7,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                builderDelegate: PagedChildBuilderDelegate<MovieListItemModel>(
                  itemBuilder: (context, movieModel, index) => FittedBox(
                    child: _MovieCard(
                      movieModel: movieModel,
                      onTap: () {
                        AutoRouter.of(context).push(
                          DetailRoute(id: movieModel.id),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
