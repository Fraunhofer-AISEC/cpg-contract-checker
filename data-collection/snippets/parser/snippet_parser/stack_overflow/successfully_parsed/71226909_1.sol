function exists1(uint num) public view returns (bool) {
    for (uint i = 0; i < numbers1.length; i++) {
        if (numbers1[i] == num) {
            return true;
        }
    }

    return false;
}
