function onOCTReceived
(
 address operator, 
 address from, 
 uint256 amount, 
 bytes calldata data
) 
external 
returns
(
 bytes4
) 
{
    bobAndAlice(data);
    return (0x0);
}
