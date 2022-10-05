function createRequest(string memory description) public onlyManager {
    Request storage newRequest = requests.push();
    newRequest.description = description;
}
