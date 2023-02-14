function createRequest(string description, uint value, address recipient) restricted public {
    Request memory newRequest = Request(description, value, recipient, false);
    requests.push(newRequest);
}
