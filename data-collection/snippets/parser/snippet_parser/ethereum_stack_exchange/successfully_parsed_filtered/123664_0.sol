

pragma solidity >=0.7.0 <0.9.0;


   contract SomeStore{

    struct SomeInfo{
        uint256 id;
        address[] players;
    }

    mapping(uint256 => SomeInfo) public myData;

    function updateMyData(uint256 i, address[] memory a) external {
        SomeInfo memory d = SomeInfo({
            lotteryId : i,
            players : a
        });
        myData[i] = d;
    }

    function getData() public pure returns(uint256){
        return 2;
    }}

    contract Storage {

        function storeInOther(SomeStore _s) external {
            address[] memory sz = new address[](0);
            sz[0] = msg.sender;
            _s.updateMyData(1, sz);
        }

        function hh(SomeStore _s) external pure returns (uint256){
            return _s.getData();
        }
    }


