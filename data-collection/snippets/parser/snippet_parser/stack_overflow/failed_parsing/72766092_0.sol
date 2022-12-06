SPDX-License-Identifier: MIT

pragma solidity >=0.4.16 <0.9.0;

contract parent{

    string public str = "Black";
    function check() public view returns(string memory){
        return str;
    }
}

contract child is parent {
    string public st = "Box";
    function check() public view override returns(string memory){  
        return string(abi.encodePacked(str,st));
    }
}
