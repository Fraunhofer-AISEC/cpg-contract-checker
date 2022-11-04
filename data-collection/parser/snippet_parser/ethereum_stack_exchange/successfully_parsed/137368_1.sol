function setOracleAddress(address _oracle) public {
        oracle = _oracle;
        o = VRFv2Consumer(oracle);
    }
function getRandNum() private {
        uint256 id = o.requestRandomWords();
        uint num = o.lastRequestId();
        require(id == num, "id does not match last request");
        (bool fulfilled, uint[] memory randomNumber) = o.getRequestStatus(id);
        while(fulfilled != true) {
            (fulfilled, randomNumber) = o.getRequestStatus(id);
        }
        oracleValue = randomNumber[0];
        randNumFulfilled = true;
    }
