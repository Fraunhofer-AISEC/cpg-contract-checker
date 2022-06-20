contract SecondToken...
 function buy() 
{
        bool success = mintedToken.transferFrom(msg.sender, address(this), amount);
}
