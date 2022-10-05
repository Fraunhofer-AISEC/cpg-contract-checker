
pragma solidity ^0.8.0;

contract Test {
    struct allowedTokenDetails {
        address admin;
        uint256 price;
        uint256 balance;
        address rewardToken;
        uint256 timestampAdded;
        uint256 timestampLastUpdated;
    }
    mapping(address => allowedTokenDetails) public allowedTokensData;
    
    function setAllowedTokensData(address _token, string[][] memory _data) public {
        for (uint256 dataIndex = 0; dataIndex < _data.length; dataIndex++) {
            string memory dataKey = _data[dataIndex][0];
            string memory dataValue = _data[dataIndex][1];
            if (keccak256(abi.encodePacked(dataKey)) == keccak256(abi.encodePacked("admin"))) allowedTokensData[_token].admin = address(dataValue);
            if (keccak256(abi.encodePacked(dataKey)) == keccak256(abi.encodePacked("price"))) allowedTokensData[_token].price = uint256(dataValue);
            if (keccak256(abi.encodePacked(dataKey)) == keccak256(abi.encodePacked("balance"))) allowedTokensData[_token].balance = uint256(dataValue);
            if (keccak256(abi.encodePacked(dataKey)) == keccak256(abi.encodePacked("rewardToken"))) allowedTokensData[_token].rewardToken = address(dataValue);
            allowedTokensData[_token].timestampLastUpdated = block.timestamp;
        }
   }
}
