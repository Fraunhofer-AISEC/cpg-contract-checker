bytes memory data = abi.encode([bytes4(keccak256('deposit()'))]);
bytes memory singleMulticallData = abi.encodePacked(bytes4(keccak256('multicall(bytes[])')), data);
        
(bool successDeposit, ) = address(proxy).call(abi.encodeWithSignature("multicall(bytes[])", [singleMulticallData, singleMulticallData]));
require(successDeposit, "deposit not successful");
