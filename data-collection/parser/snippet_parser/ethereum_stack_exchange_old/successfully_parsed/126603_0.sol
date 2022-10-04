struct Color{
        string colorName;
        uint256 awardedPoints; 
        uint256 colorID;
    }

mapping(uint256 => Color) private colorsMapping;

function awardPoint(uint256 colorID) public {
        colorsMapping[colorID].awardedPoints++;    
    }
