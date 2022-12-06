pragma solidity ^0.6.0;
    
    interface AddNumbers { function add(uint256 a, uint256 b) external returns (uint256 c); }

contract Example {
    AddNumbers addContract;
    event StringFailure(string stringFailure);
    event BytesFailure(bytes bytesFailure);

    function exampleFunction(uint256 _a, uint256 _b) public returns (uint256 _c) {

        try addContract.add(_a, _b) returns (uint256 _value) {
            return (_value);
        } catch Error(string memory _err) {
            
            emit StringFailure(_err);
        } catch (bytes memory _err) {
            emit BytesFailure(_err):
        }
    }
}
