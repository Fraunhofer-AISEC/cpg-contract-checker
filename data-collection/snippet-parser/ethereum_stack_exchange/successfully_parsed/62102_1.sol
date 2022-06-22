  function updateCategoryLabel(string _newCategoryLabel, string _oldCategoryLabel) {
    categoryMap[_oldCategoryLabel].label = _newCategoryLabel;
    Category tmpCategory = categoryMap[_oldCategoryLabel];
    delete categoryMap[_oldCategoryLabel];
    categoryMap[_newCategoryLabel] = tmpCategory;
  }
