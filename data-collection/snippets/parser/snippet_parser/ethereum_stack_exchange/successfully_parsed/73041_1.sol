pragma solidity 0.5.10;

contract MultiStage {

    struct stage {
      uint256 startDate;
      uint256 endDate;
      uint8 discount;
    }

    stage[] saleStages;

    function addStage(uint256 _start, uint256 _end, uint8 _discount) external {
        require(_start < _end);
        uint256 _length = saleStages.length;
        if (_length > 0) {
             
             require(saleStages[_length-1].startDate > _end);
        }
        saleStages.push(stage(_start, _end, _discount));
    }

    function getCurrentStage() private returns (uint256 _index) {
        _index = saleStages.length;
        while (_index > 0 && now > saleStages[_index-1].endDate) {
            _index--;
        }
        if (_index != saleStages.length) {
            saleStages.length = _index;
        }
        require(_index > 0, "Final stage has ended");
        return _index - 1;
    }
}
