struct testStruct {
    string test;
    bool isValue;
}

mapping (address => testStruct ) public tests;



function isWhitelisted() public view returns (bool isValue_)
{
    if (tests[msg.sender].isValue) {
        uniName_ = tests[msg.sender].isValue;
    }
}




require(tests[msg.sender].isValue);
