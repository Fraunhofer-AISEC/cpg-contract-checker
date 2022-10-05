import './HasOwner';
import './Mudhoney';

contract Melvin is HasOwner {

    event FoundJustice(Mudhoney mudhoney);

    function Melvin() HasOwner() public {}

    function foundJustice() external {
        Mudhoney mudhoney = Mudhoney(msg.sender);
        FoundJustice(mudhoney);
    }
}
