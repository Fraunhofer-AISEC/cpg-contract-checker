pragma solidity ^0.4.21;

import "./Ownable.sol";

    contract Allowance is Ownable{
        uint AllowanceWeek = 0.01 ether;
        address ledger;
        uint32 coolDownTime = 1 weeks;
        uint32 overflow;
        uint32 weekCooldown;

        modifier onlyLedgerOrOwner{
            require(msg.sender == ledger || msg.sender == owner);
            _;
        }

        function _triggerCooldown()internal onlyOwner{
          weekCooldown = uint32(now + coolDownTime);
      }

        function () public payable{

        }

        function _changeCoolDownTime(uint32 _CoolDownTime) external onlyOwner{
            coolDownTime = _CoolDownTime;
        }

        function withdraw() external payable onlyLedgerOrOwner {
            require(now >= weekCooldown);
            require(this.balance >= AllowanceWeek);
            ledger.transfer(AllowanceWeek);
            _triggerCooldown();
            overflow = uint32(this.balance - (AllowanceWeek * 76));
            if(overflow > 0){
                msg.sender.transfer(overflow);
            }
      }

      function _setAllowance(uint _Allowance) external onlyOwner{
          AllowanceWeek = _Allowance;
      }

      function _changeAddress(address _Address) external onlyOwner{
          ledger = _Address;
      }

      function transferOwnership (address newOwner) onlyOwner{
        require(newOwner != address(0));
        OwnershipTransferred(owner, newOwner);
        owner = newOwner;  
    }  
    }
