part of '../home_view.dart';

final class _MovieCard extends StatelessWidget {
  final MovieListItemModel movieModel;
  final VoidCallback onTap;

  const _MovieCard({
    required this.movieModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: AppConstants.imagePath + movieModel.posterPath!,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                heightFactor: 12,
                widthFactor: 8,
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Center(
                heightFactor: 12,
                widthFactor: 8,
                child: Icon(Icons.error),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      ColorConstants.primaryColor.withOpacity(0.2),
                      ColorConstants.primaryColor.withOpacity(0.8),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieModel.title!,
                    style: context.textTheme.titleMedium,
                  ),
                  Text(
                    movieModel.genres!,
                    style: context.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: ColorConstants.primaryColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: ColorConstants.yellowColor,
                      size: 16,
                    ),
                    Gap(5.w),
                    Text(
                      movieModel.voteAverage?.toStringAsFixed(1) ?? '',
                      style: context.textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
