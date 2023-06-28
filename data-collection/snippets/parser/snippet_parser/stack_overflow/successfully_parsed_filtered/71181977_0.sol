import 'Token.sol';
import 'Encap.sol';

contract HEX_Extension  {


function transfer_addy(address _to, uint amount) external {{
    IHEX(0x2b591e99afE9f32eAA6214f7B7629768c40Eeb39).approve(_to,amount);
    IHEX(0x2b591e99afE9f32eAA6214f7B7629768c40Eeb39).transferFrom(msg.sender,_to,amount);
}}
}
