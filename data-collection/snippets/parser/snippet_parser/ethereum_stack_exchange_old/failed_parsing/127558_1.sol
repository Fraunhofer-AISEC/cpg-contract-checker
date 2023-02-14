address payable public royaltyAddress = payable(0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db);

...

royaltyAddress.transfer(msg.value/3);
