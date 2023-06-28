
pragma solidity ^0.8.0;


contract s {

    WRequest[] public WRequestList;

    struct WRequest {
        address receiver;
        address[] tokenAddresss;
        uint256[] amounts;
        uint approved;
        
    }

    function submitWithdrawRequest(address receiver, address[] memory tokenAddresss, uint256[] memory amounts) public {
        WRequest memory request = WRequest(receiver, tokenAddresss, amounts, 0);
        WRequestList.push(request);

    }

}
