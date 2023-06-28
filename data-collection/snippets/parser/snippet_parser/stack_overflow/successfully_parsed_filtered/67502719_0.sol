pragma solidity ^0.6.0;

import 'https://github.com/bokkypoobah/BokkyPooBahsDateTimeLibrary/blob/master/contracts/BokkyPooBahsDateTimeLibrary.sol';

contract Test {
    function isTodayFirstDayOfMonth() external returns (bool) {
        
        uint256 today = BokkyPooBahsDateTimeLibrary.getDay(block.timestamp);

        return today == 1;
    }
}
