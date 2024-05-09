final class MovieRequestModel {
  final int page;
  final MovieSortBy sortBy;

  const MovieRequestModel({
    required this.page,
    this.sortBy = MovieSortBy.popularityDesc,
  });

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'sort_by': sortBy.toJson(),
    };
  }
}

enum MovieSortBy {
  popularityAsc,
  popularityDesc,
  revenueAsc,
  revenueDesc,
  primaryReleaseDateAsc,
  primaryReleaseDateDesc,
  voteAverageAsc,
  voteAverageDesc;

  String toJson() {
    switch (this) {
      case MovieSortBy.popularityAsc:
        return 'popularity.asc';
      case MovieSortBy.popularityDesc:
        return 'popularity.desc';
      case MovieSortBy.revenueAsc:
        return 'revenue.asc';
      case MovieSortBy.revenueDesc:
        return 'revenue.desc';
      case MovieSortBy.primaryReleaseDateAsc:
        return 'primary_release_date.asc';
      case MovieSortBy.primaryReleaseDateDesc:
        return 'primary_release_date.desc';
      case MovieSortBy.voteAverageAsc:
        return 'vote_average.asc';
      case MovieSortBy.voteAverageDesc:
        return 'vote_average.desc';
    }
  }
}
