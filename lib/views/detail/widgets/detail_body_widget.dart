part of '../detail_view.dart';

final class _DetailBodyWidget extends StatelessWidget {
  final MovieDetailResponseModel detailModel;
  const _DetailBodyWidget({required this.detailModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CachedNetworkImage(
              height: 195.h,
              imageUrl: AppConstants.imagePath + detailModel.posterPath!,
            ),
            const Gap(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    detailModel.title ?? '',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    detailModel.genres!.map((e) => e.name).join(', '),
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.titleMedium,
                  ),
                  Gap(8.h),
                  Text(
                    '${detailModel.runtime}${LocalizationConstants.minutes}',
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.titleSmall,
                  ),
                  Gap(8.h),
                  Text(
                    DateFormat.y().format(
                      detailModel.releaseDate!,
                    ),
                    style: context.textTheme.titleSmall,
                  ),
                  Gap(8.h),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: ColorConstants.yellowColor,
                      ),
                      Gap(4.w),
                      Text(
                        detailModel.voteAverage?.toStringAsFixed(1) ?? '',
                        style: context.textTheme.titleSmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const Gap(16),
        Text(
          (detailModel.overview ?? '') * 3,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          (detailModel.overview ?? '') * 3,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    ).symmetricHDefaultPadding;
  }
}
