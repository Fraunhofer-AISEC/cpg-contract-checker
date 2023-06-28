pragma solidity ^0.5.1;

contract SampleInterface {
    function foo(uint256 someValue) external returns (uint256);
}

library SampleLibrary {
    enum SampleType {
        FIRST,
        SECOND
    }
}

contract SampleInterfaceManager {
    mapping(uint => SampleInterface[]) public interfacesByType;

    function processFoo(uint256 someValue, SampleLibrary.SampleType sampleType) external returns (uint256) {
        SampleInterface[] storage sampleInterfaces = interfacesByType[uint(sampleType)];
        uint temp = someValue;
        for (uint i = 0; i < sampleInterfaces.length; i++) {
            SampleInterface sampleInterface = sampleInterfaces[i];

            

            if (sampleInterface != address(0)) {
                temp = sampleInterface.foo(temp);
            }
        }
        return temp;
    }
}
