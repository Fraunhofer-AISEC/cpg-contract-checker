contract Campaign {
struct Request {
    ...

    mapping(address => bool) approvals;

}

constructor(uint256 minimum, address creator) {
    ...
}

function createRequest(
    string memory description,
    uint256 value,
    address payable recipient
) public onlyManager {
    Request memory newRequest = Request({ 
        
    });
}
...
