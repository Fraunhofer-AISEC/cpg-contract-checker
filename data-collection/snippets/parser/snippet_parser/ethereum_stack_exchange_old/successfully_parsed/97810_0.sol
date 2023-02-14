function triggerThisFunction(uint256 addValue) public override payable {
        imaGlobalVariable += msg.value;
        imAlsoaGlobal += addValue;
    }
