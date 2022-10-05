contract BurnEth
    function: burnEth(...) is payable, accepts uint weiAmountToBurn
        body:   -sends the weiAmountToBurn to address(0)

contract OtherContract
    function: calculations() is public, no input parameters
        body:   -calculates the amount of Wei (that is, weiAmountToBurn)
                -makes a call to burnEth to burn calculated Wei from msg.sender address
