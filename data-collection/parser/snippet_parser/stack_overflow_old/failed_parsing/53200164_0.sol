uint tokenPrice = 1e15;
uint tokenPriceStep = 1e11;
uint sendValue = 3e18; 
uint balance = 0;
do {    
    balance += 1e18;
    sendValue -= tokenPrice;
    tokenPrice += tokenPriceStep;
} while (sendValue > tokenPrice);
if(sendValue > 0){
    balance += sendValue *  1e18 / tokenPrice;
    tokenPrice += (sendValue *  1e18 / tokenPrice) * tokenPriceStep / 1e18;
    sendValue = 0;
}
