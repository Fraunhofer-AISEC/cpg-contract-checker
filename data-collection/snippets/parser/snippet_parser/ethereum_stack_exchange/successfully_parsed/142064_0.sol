function setUriToUpdate(uint256 temperature) public {
    uint256 timesAmount = 10 ** 18;
    if (temperature < 10 * timesAmount) {
       uriToUpdate = METADATA_BELOW;
    } else if (temperature > 10 * timesAmount && temperature < 20 * timesAmount) {
       uriToUpdate = METADATA_AVERAGE;
    } else if (temperature >= 20 * timesAmount && temperature < 50 * timesAmount) {
       uriToUpdate = METADATA_ABOVE;
    }
}
