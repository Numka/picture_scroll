abstract class Action {}

class ToggleFavorite extends Action {
  final String id;
  final bool isFavorite;

  ToggleFavorite(
    this.id,
    this.isFavorite,
  );
}
