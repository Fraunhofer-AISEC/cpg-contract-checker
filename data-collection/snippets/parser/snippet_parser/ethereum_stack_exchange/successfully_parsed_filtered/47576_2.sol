function adopt(
    uint256 _beastQuantity,
    uint256 _aquaticQuantity,
    uint256 _plantQuantity,
    address _referrer
)
public
payable
whenNotPaused
{
    require(_beastQuantity <= 3 && _aquaticQuantity <= 3 && _plantQuantity <= 3);

    address adopter = msg.sender;
    address actualReferrer = 0x0;

    
    if (_referrer != adopter) {
        actualReferrer = _referrer;
    }

    
    uint256 value = msg.value;

    uint256 price;

    
    if (_beastQuantity > 0) {
        price = _adoptCreeptomas(
            adopter,
            CLASS_BEAST,
            _beastQuantity,
            actualReferrer
        );
        require(value >= price);
        value -= price;
    }


    
    if (_aquaticQuantity > 0) {
        price = _adoptCreeptomas(
            adopter,
            CLASS_AQUATIC,
            _aquaticQuantity,
            actualReferrer
        );
        require(value >= price);
        value -= price;
    }

    
    if (_plantQuantity > 0) {
        price = _adoptCreeptomas(
            adopter,
            CLASS_PLANT,
            _plantQuantity,
            actualReferrer
        );
        require(value >= price);
        value -= price;
    }

    
    msg.sender.transfer(value);

}
