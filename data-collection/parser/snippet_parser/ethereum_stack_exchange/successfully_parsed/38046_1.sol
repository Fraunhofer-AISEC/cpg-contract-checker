pragma solidity ^0.4.18;

    contract A {

        bytes32 name;
        function A(bytes32 _name) public {
            name = _name;
        }

        function getName() public constant returns (bytes32) {
            return name;
        }
    }

    contract handleArray {

        bytes32 public name;
        uint public arrIndex;

        mapping(uint => address) testArray;

        function handleArray() public {
            arrIndex = 0;
        }

        function newEntry(address _newA) public {
            testArray[arrIndex] = A(_newA);
            arrIndex++;
        }

        function returnEntry(uint _index) public returns (string) {
            bytes32 input;
            string memory output;
            A a = A(testArray[_index]);

            
            input = a.getName();

            bytes memory bytesArray = new bytes(32);
            for (uint256 i; i < 32; i++) {
                bytesArray[i] = input[i];
            }

            
            output = string(bytesArray);

            return string(output);
        }
    }
