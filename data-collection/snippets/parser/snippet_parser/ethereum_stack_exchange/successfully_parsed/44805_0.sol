pragma solidity ^0.4.18;
import "http://github.com/OpenZeppelin/zeppelin-solidity/contracts/ownership/Ownable.sol";
import "./Service.sol";

contract Factory is Ownable {

    mapping(string => address) services;

    event DidExecuteService(address contractAddress);

    modifier ValidateString(string str) {
        require(bytes(str).length > 0);
        _;
    }

    function Factory() public {}

    function createService(string name) public onlyOwner ValidateString(name) {
        address assetAddress = new Game();
        services[name] = assetAddress;
    }

    function executeService(string name) public onlyOwner {
        address contractAddress = services[name];
        Service(contractAddress).execute();
        emit DidExecuteService(contractAddress);
    }

    function getContract(string name) public view returns (address) { return services[name]; }

    function countContracts() public view returns (uint) { return 0; }

    function getBalance() public view returns (uint) { return address(this).balance; }
}
