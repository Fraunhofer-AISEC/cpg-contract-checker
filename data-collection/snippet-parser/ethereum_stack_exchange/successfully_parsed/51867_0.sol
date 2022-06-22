function check_index(address addy, uint256 index) view returns (bool) {
    return (my_mapping[addy].length > index);
}
