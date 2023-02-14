function getLink(address key, uint index) external view returns (string) {
    return addressToLinks[key][index];
}
