pragma solidity ^0.4.0;  
contract Transaction {

    uint num = 0;
    bytes32 [] storedKeys;
    uint [] x;

    struct Pilot {
        string details;
        uint expected_time;
        address creator; 
        uint amount;
        address [] listenrs;
        address [] reporters;
    }

    mapping (bytes32 => Pilot) _accounts;


    function  get_details_by_name(string key) public returns(string){
        return _accounts[stringToBytes32(key)].details;
    }

    function  get_pilots_names() public constant returns(bytes32 []){
        return storedKeys;
    }

    function stringToBytes32(string memory source) private returns (bytes32 result) {
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }

        assembly {
            result := mload(add(source, 32))
        }
    }
    function  get1() public constant returns(uint){
        return num;
    }

    
    function add_pilot(string s1, string det, uint hours_till_exp, uint am) public  {
        bytes32 s = stringToBytes32(s1);
        _accounts[s].creator = msg.sender;
        _accounts[s].amount = am;
        _accounts[s].details = det;
        _accounts[s].expected_time  = now + (hours_till_exp * 3600);
        _accounts[s].listenrs.push(msg.sender);
        num+=1;
        storedKeys.push(s);
    }
}
