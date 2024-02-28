class ExploreItem {
  String _imgExploreItem;
  String _description;

  // Constructor mặc định
  ExploreItem(this._imgExploreItem, this._description);

  // Getter cho imgExploreItem
  String get imgExploreItem => _imgExploreItem;

  // Setter cho imgExploreItem
  set imgExploreItem(String imgExploreItem) {
    _imgExploreItem = imgExploreItem;
  }

  // Getter cho description
  String get description => _description;

  // Setter cho description
  set description(String description) {
    _description = description;
  }
}
