function updateCategoryLabel(string _newCategoryLabel, string _oldCategoryLabel) {
    categoryMap[_newCategoryLabel] = categoryMap[_oldCategoryLabel];
    delete categoryMap[_oldCategoryLabel];
}
