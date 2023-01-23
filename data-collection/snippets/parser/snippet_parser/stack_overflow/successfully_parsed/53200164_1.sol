uint times = sendValue / tokenPrice; 
balance += times * (1e18);
tokenPrice += times * tokePriceStep;
sendValue -= times * tokenPrice;
