    function addValue() external payable {
       _addValue();
    }
    
    function _addValue() internal {
       payable(addr).transfer(msg.value);
    }
