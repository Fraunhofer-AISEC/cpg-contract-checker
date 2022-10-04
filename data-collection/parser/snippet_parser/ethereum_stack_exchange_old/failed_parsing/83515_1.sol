pragma solidity ^0.5.12;
import "./A.sol";
contract B{


    event Payment(address recipient, uint value);
    event Receive(address sender, uint value);

    address sender;
    address payable receiver;
    uint sentValue;
    uint receiptValue;
    uint gasPrice;

    function pay(address payable recipient) external payable{\\Transfers some ether to A
        recipient.transfer(msg.value);
        A(recipient).cash(msg.value, tx.gasprice);
        receiver=recipient;
        sentValue=msg.value;
        gasPrice=tx.gasprice;
        emit Payment(recipient, msg.value);
    }

    function payView() public view returns(address, string memory, string memory, string memory){\\Shows some data about the last transfer.
        return (receiver, uint2str(sentValue), uint2str(gasPrice), uint2str(address(this).balance));
    }

    function cash(uint cashValue, uint GasPrice) external payable{\\Records some data about the last received transaction
        sender=msg.sender;
        receiptValue=cashValue;
        gasPrice=GasPrice;
        emit Receive(msg.sender, cashValue);
    }

    function cashView() public view returns(address, string memory, string memory, string memory){\\Shows some data about the last received transaction
        return (sender, uint2str(receiptValue), uint2str(gasPrice), uint2str(address(this).balance));
    }

    function uint2str(uint _i) internal pure returns (string memory ) {
        if (_i == 0) {
                return "0";
         }
        uint j = _i;
        uint len;
        while (j != 0) {
                len++;
              j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len - 1;
        while (_i != 0) {
             bstr[k--] = byte(uint8(48 + _i % 10));
             _i /= 10;
         }
        return string(bstr);
    }
    function() external payable{}
}
