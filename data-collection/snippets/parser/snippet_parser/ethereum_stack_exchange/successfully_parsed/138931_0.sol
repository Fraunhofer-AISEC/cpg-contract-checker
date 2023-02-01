function Multiple(string[] memory my_ids) public onlyOwner {
    for (uint i = 0; i < my_ids.length; i++) {
        performCalc(my_ids[i]);
    }
}
