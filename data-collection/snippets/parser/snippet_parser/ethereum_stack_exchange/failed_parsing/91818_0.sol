        persons[personCount].personAddress = _sender;
        persons[personCount].earning= 0;
        persons[personCount].tokenCount = 0 ;
        persons[personCount].initialized = true;
        persons[personCount].assetsUploaded = new uint[](0);
        persons[personCount].assetsBought = new uint[](0);```

after doing all this i am unable to know whether the array is created or not because it is not showing up in remix.

**REMIX OUTPUT**
0:
uint256: personId 0
1:
address: personAddress 0x0000000000000000000000000000000000000000
2:
uint256: earning 0
3:
uint256: tokenCount 0
4:
bool: initialized false

assetsUploaded and assetsBought are missing here in the remix output

I am adding assets in assetsUploaded but am unable to see them. Is there any issue in the code which i need to fix?
