abstract class FavoriteButtonState {}

class FavoriteButtonInitial extends FavoriteButtonState {}

class FavoriteBUttonUpdated extends FavoriteButtonState {
  final bool isFavorate;

  FavoriteBUttonUpdated({required this.isFavorate});
}
