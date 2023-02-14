pragma solidity ^0.4.23;
        contract Usermapping {
            uint256 public value;
            bytes32 public name;
            function addValue(uint a) public returns (bool)
            {
                value = a;
                return true;
            }
            function getValue() public view returns(uint256)
            {
                return value;
            }
            function setName(bytes32 nameSet) public returns(bool){
                name = nameSet;
                return true;
            }
             function getName() public view returns(bytes32){
                return name;
            }
        }

        var B = artifacts.require("./Usermapping.sol");
          module.exports = function(deployer){
        deployer.deploy(B)
       }
