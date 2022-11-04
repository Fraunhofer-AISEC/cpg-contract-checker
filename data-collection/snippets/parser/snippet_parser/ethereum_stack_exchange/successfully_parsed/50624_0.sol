function checkInflation() returns (bool success)
{
    if(year >= 5) {
        return false;
    }
    else if (now >= deploymentTime + 31557600) { 
        uint256 supplyIncrease = (supply*5) / 100;
        mintToken(0x8E73AEF2448068d4e31F86Aa08279465339fF601, supplyIncrease);
        year+=1; 
        supply += supplyIncrease; 
        deploymentTime += 31557600; 
        return true;
    }
    else {
        return false;
    }
}
