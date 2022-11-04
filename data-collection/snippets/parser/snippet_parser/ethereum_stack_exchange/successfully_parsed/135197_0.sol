
pragma solidity >=0.8.0;

contract MediaContractFactory {
    address [] public deployedContracts;
    event Received(address, uint);

    function createContract(uint deploymentPrice, uint expiration, string memory tasking, string memory formatting) public{
          address newContract =  address(new MediaContract(deploymentPrice, expiration, tasking, formatting, payable(msg.sender)));
          deployedContracts.push(newContract);
    }

    function getDeployedContracts() public view returns (address [] memory){
        return deployedContracts;
    }

    receive() external payable {
        emit Received(msg.sender, msg.value);
    }
}

contract MediaContract {
    address payable public customer ;
    address payable public platform;
    address payable public reporter;
    address public contractAddress;
    uint public contractPrice;
    uint public platformFee;
    struct Coordinate {
        uint256 lat;
        uint256 long;
    }
    string public task;
    string public format;
    uint public created;
    uint public expires;
    string public status;
    Coordinate[] public coordinates;
    string[] public mediaAddresses;
    event Received(address, uint);

    constructor (uint deploymentPrice, uint expiration, string memory tasking, string memory formatting, address payable newCustomer) payable{
        require(msg.value >= deploymentPrice);
        customer = newCustomer;
        contractPrice =  address(this).balance * 95 / 100;
        platformFee = address(this).balance * 5 / 100;
        created = block.timestamp;
        expires = expiration;
        task = tasking;
        format = formatting;
        status = 'open';
        contractAddress = address(this);
    }
}