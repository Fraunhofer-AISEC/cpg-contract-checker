pragma solidity ^0.8.17;
import "forge-std/Script.sol";
import "../src/Proxy.sol";
import "../src/Game.sol";     

contract ProxyScript is Script {
    function run() external {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(privateKey);
        Game game = new Game(); 
       
       
       
        vm.stopBroadcast();
      
    }
}
