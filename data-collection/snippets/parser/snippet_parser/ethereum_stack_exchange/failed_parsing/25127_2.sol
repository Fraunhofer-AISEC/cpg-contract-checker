,../test/TestWrapperCreator.sol:11:23: TypeError: Type bytes32[] memory is not implicitly convertible to expected type bytes32[3] storage ref.
        resultNames = new bytes32[](3);
                      ^--------------^
,../test/TestWrapperCreator.sol:19:60: TypeError: Invalid type for argument in function call. Invalid implicit conversion from bytes32[3] storage ref to bytes32[] memory requested.
        Topic testTopic = eventCreator.createTopic("test", resultNames, 1000000);
