

pragma solidity 0.6.12;


interface IFlashLoadReceiver {
    function executeOperation(
        address[] calldata assets,
        uint256[] calldata amounts,
        uint256[] calldata premiums,
        address initiator,
        bytes calldata params
    ) external returns (bool);
}

contract Demo is IFlashLoadReceiver {
    
    function executeOperation(
        address[] calldata assets,
        uint256[] calldata amounts,
        uint256[] calldata premiums,
        address initiator,
        bytes calldata params
    ) override external returns (bool) {
        
        
        return doExecuteOperation(assets, amounts, premiums, initiator, params);
    }

    
    function doExecuteOperation(
        address[] memory assets,
        uint256[] memory amounts,
        uint256[] memory premiums,
        address initiator,
        bytes memory params
    ) internal returns (bool) {
        
        return false;
    }

}
