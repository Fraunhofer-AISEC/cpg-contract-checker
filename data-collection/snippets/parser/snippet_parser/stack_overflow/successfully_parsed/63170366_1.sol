function createRequest(uint256 value) public {
    Request storage newRequest = requests.push();
    newRequest.value = value;
}
