function duplicatefinder(mapping exists, uint256 intermediate, uint256[] expandedValues) internal pure {
        if(exists[intermediate] == false){
            expandedValues[i] = intermediate;
            exists[intermediate] = true;
        } else {
            intermediate += 1 % 20;
            duplicatefinder(exists, intermediate, expandedValues);
        }
    }
