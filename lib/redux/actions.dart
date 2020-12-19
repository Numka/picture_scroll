abstract class Action {}

class ToggleFavorite extends Action {
  final String id;
  // I can toggle Favorite even without it, but if this app ever gets a proper backend it would be needed for proper optimistic updating. E.g. if server returns error we still syncronously update our state and show change but then revert it due to error.
  final bool isFavorite;

  ToggleFavorite(
    this.id,
    this.isFavorite,
  );
}
