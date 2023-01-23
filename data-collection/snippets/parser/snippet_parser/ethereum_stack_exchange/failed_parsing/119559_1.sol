pragma solidity ^0.8.10;

import "@openzeppelin/contracts/governance/TimelockController.sol";

interface Ierc20 {
    function mint(address to, uint amount) external; 
    function burn(uint amount) external;
    function findBalance(address _tokenOwner) external view returns(uint256);
}

contract TimeLock is TimelockController {

    address[] proposers = new address[](1);
    address[] executors = new address[](1);
    uint256 minDelay;

    constructor(address proposer, address executor) TimelockController( minDelay, proposers, executors ) {
        minDelay = block.timestamp + 4 minutes;
        proposers[0] = proposer;       
        executors[0] = executor;
    }

    function scheduleMintFuctionCall(address to, uint amount) public {
        address target = 0x5FbDB2315678afecb367f032d93F642f64180aa3;
        bytes memory data = abi.encodeWithSignature('Ierc20(target).mint(address, uint256)', to, amount);
        uint256 value = 10000000;
        bytes32 salt = keccak256("MY_SALT");
        uint256 delay = block.timestamp + 3 minutes;
        this.schedule(target, value, data, bytes32(0), salt, delay, { from: proposers[0] });
    }

    function balanceOf(address _to) public view returns(uint256) {

        address target = 0x5FbDB2315678afecb367f032d93F642f64180aa3;
        return Ierc20(target).findBalance(_to);

    }
    
}
