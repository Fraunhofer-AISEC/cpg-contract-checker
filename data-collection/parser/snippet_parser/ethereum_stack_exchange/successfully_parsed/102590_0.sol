pragma solidity 0.8.0;

function isMemberOfArrayEncodedTest(address member, address [] memory memberArray) public returns (string memory){
        bytes4 sig = bytes4(keccak256("isMemberOfArray(address,address[])"));
        bytes memory param1 = abi.encode(member);
        bytes memory param2 = abi.encode(memberArray);
        
        bytes memory data = abi.encodePacked(sig,param1,param2);
        bytes memory proof = abi.encodeWithSelector(sig,member,memberArray);
}