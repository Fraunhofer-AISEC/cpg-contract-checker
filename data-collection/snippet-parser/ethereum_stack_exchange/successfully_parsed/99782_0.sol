import "./ETH2SOCKS.sol";
import "@openzeppelin/contracts/lifecycle/Pausable.sol";
import "@openzeppelin/contracts/utils/Address.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

interface IMintable {
 function mint(address account, uint256 amount) external;
}

contract Presale is Pausable, ReentrancyGuard {
 using SafeMath for uint256;
 using Address for address;

 
 ETH2SOCKS eth2socksContract;
 
 mapping(address => uint256) addressBalance;
 
 address public admin;

 address[] public holderAddressess = [
     address(0x55C44b2827D73BA7eDaFf4FE21f7E12F57e4115b),
     address(0xE4F60f6Fe872d5b910E72A11D09cdcf3780d20dB),
     address(0x21d79c2Be4ab3de2802a60Da66f86D497D06102B),
     address(0xca1B8F95046506fdF2560880b2beB2950CC9aED6),
     address(0x56a8708C31D813FEA9767dE2F0917967c07B167e),
     address(0x7c9932eEd5Aa0604FF417B2372B0AA76C5971bD3),
     address(0x6761BcAF2b2156C058634D9772F07374D6eDeF1d),
     address(0x23bc95F84BD43C1FCc2bc285fDa4Cb12f9AEE2df),
     address(0x86A41524CB61edd8B115A72Ad9735F8068996688),
     address(0xd522CD8cc56BAdBD1E9A84a9F726Dc87667Ad73A),
     address(0x1ac396A3C0fF9c748D5E4D33E814e7F39DA68C88),
     address(0x1748789703159580520CC2cE6D1ba01e7359C44c),
     address(0x75aB4A0e0f68edDD2d22f329FBd1D893d9FB0ab6),
     address(0x9234dA5B588A8FE47DfEb9a7852d49399CfB5a94),
     address(0xe8C0C83C181AACdab4f48624B5574CC88aD8E840),
     address(0xDfd60a8E1e17FBb78E8CA332906A822D862f3D57),
     address(0xA1bD817e13ED6Bb524ED491cff76C83aFEC773Ac),
     address(0x354F38E5b57AB49F09A102cCB7E57E3Ba1bFaa5B),
     address(0xa29FDDEc9C36BDD680D3f5867735ff8949a7F15D),
     address(0x5B93FF82faaF241c15997ea3975419DDDd8362c5),
     address(0xa5725a5211fdf7eEF802f31D190074BAfD5AdFCF),
     address(0x0027D58331121eFa6cfd229291745de2fEeabF38),
     address(0x61311200F273E2d594f7C0AEaAb5C80F0B7840c9),
     address(0x1c385edF4B687Db1472506447348A9E62E1e5EdB),
     address(0x5ea7ea516720a8F59C9d245E2E98bCA0B6DF7441),
     address(0x3E099aF007CaB8233D44782D8E6fe80FECDC321e),
     address(0x5E0158553598B40Ecc13A3B1f78ee96536E6D0Da),
     address(0x4C955926022a8D7d281eac1Cb3Dc8714A84C3208),
     address(0x9d2773e66d41a28CAE8eBbdBB7d396Fe51Ae03De),
     address(0x19Eb7FfDcD670Ca917110Bd032463120a5E58C8E),
     address(0xb4022Ef3AaEE8C191192236202457CFc7f97Ee01),
     address(0x95B5FEbE06b06baBE2d22469f5A9397B2417Fc23),
     address(0xAf3E252f3190EC77A3a1e07A21c6369A396134eE),
     address(0x9B921faD875b06183d3992A125026c89915D71F6),
     address(0xD90C5c640B518f17dFD74c2e6cFF3Bb779179a43),
     address(0xb757872560aE94D385Ac274CBEd43168d91D46d7),
     address(0x0b2d429E9C0EbDf30fEb86e950080C2f4017c56e),
     address(0x7f98B58E2980Ba5D8Dba2439FBaAA315921eCb14),
     address(0x292b78a5AD6214971c0ec79Cb9d7eb3Cf20957Fb),
     address(0x8B68314eaDA9D4ba43C6E585f52a39AdEfc57839),
     address(0x4ad368bE4A965916FDb7812D6bBeA894Ad20b9AD),
     address(0x07a1f6fc89223c5ebD4e4ddaE89Ac97629856A0f),
     address(0x848F11E9c468be9EF6bF5F1Daa742e6ADF25D7A7),
     address(0x11B1785D9Ac81480c03210e89F1508c8c115888E),
     address(0xF49fd35343ED954eDeD917AEa065dc8433c41493),
     address(0x09909F60366080884Af0721C3E37dFC094DCF2A9),
     address(0x3E3721D26D5B8612BCD6504696B82401b9951bA6),
     address(0xe2F8ffA704474259522Df3B49F4F053d2e47Bf98),
     address(0xb522BD8A501dFA970C40B57eb76C76256d55758d),
     address(0xC3ee900A4c8152d3F5C200Dd9C4470aC4AD17c7B),
     address(0x54067441D3E0591b34D29C11412765cF098c9475),
     address(0x2cb635670Bb92B6e45722F47b5849032d1ba5BF7),
     address(0x123432244443B54409430979DF8333f9308A6040),
     address(0x80a03DBf383c6FDD96FB95D1A24d63C7b6d02b08),
     address(0xe135f2F57732fA6f46C05D77Fb10300Eb1Ad0eF7),
     address(0xc51215C8ccb1EBB4303fC549F93B10A28d8Bd7D6),
     address(0x7eAfe3FBD6B784861E700C34Df3a1249ea8Ccf6e),
     address(0x66aeEAdD49026a7CFbdE0240A7B148F18966B7B7),
     address(0x4E4aac9Fe63D4Ff50C8b09D79448a6a39BAA97ef),
     address(0x0696CCA4f346552E2A8B822ce9AfA50413976A0F),
     address(0x333b1cB2936D4c460a497805fEc223C53c071938),
     address(0x7092786C75785Dd7F26654218462FB1F64042De6),
     address(0x749E1d15d3d461469BEc674575c2B07dd0dBEdeD),
     address(0x0998160bdF3Ff6D86A4E9D5c31e0eFC3Ca7e7D01),
     address(0x1C467B19F4341D602B21BB09667B22b4eb43f86e),
     address(0xC8BA6C5472bcF982C88cb469C8785a3aF9B183c1),
     address(0x54c375c481f95ba43e2cEcd6Ef30631f55518f57),
     address(0x131975CA3E75259e60AFeb1cd34051A6804dA505),
     address(0xFFBE67042bF5F1bD11b6D9363E645c39782eCaA1),
     address(0x8c49C1D07579d778CAe5a567E77E5eE242169917),
     address(0xE9bb842F4535fB16aeFd984C4C06e97E55a50318),
     address(0x797BC498EdEE4357a16a1054dB0323CbD04C84c3),
     address(0xC6C9D802bC16d8746AAfCAc4781F9a8d442D585D),
     address(0xFBb42577EB5E6c40AF214Bc457afE1922f55556b),
     address(0xdc29ef538B3a2585ef6569eC63626f6DA40Ed3a2),
     address(0xC20f4DC033DDd766d69F1FE20c7b817bEF683e55),
     address(0x7Af7cA67AA827F58e0659C52a641aeE55a43B535),
     address(0x35623eA315322FF2618e7469c2E88415111B5444),
     address(0x45B2CEA7A3FBF2Ad972DB30d744724d5f04fA1f0),
     address(0x9325F1218cB6CAc2E5cd43baBDf988dADbCB1359),
     address(0xF2D54033190bbc5a322cb93c7B36c65670D63264),
     address(0x96b0425C29ab7664D80c4754B681f5907172EC7C),
     address(0x78873D7A53EDE849D9F82ad451Eb8bAFc77244e7),
     address(0x3Fe4F48938c2e5E99B2F804116C0Db382E21896b),
     address(0xD9d87c5933f17AE865feBa60272F2e46B94b2344),
     address(0x7c712119b7f4F1A2e147425a939E1D5380b15DBa),
     address(0xce33Dbd4AFf2e53E1CA5e5568Db13e487666e5a6),
     address(0x93cfAd7BC7f8cc4d6dBa1dC26B2072057E28B455),
     address(0xe1E63B61CeFf7bE948Ef058F4C3652119A006C37),
     address(0x4495d7DBf117532698D9974Bd3Bc1fC3ba7C2d94),
     address(0x63aeA877b5d5FA234a1532F1b26A4F6d9051866e),
     address(0x3838433F63f4d4A24260F2485AACf5894ba7Bc93),
     address(0x324f660d42636232AeC4e1072994c5e322521CA9),
     address(0x5eA12341d073Ec5a1226b85f0478413A19081535),
     address(0x3ce630f7Bc2e9FD32fAb844601795196E917DBDa),
     address(0xbb899870561D48e823DdfACFFa201dc20214a530),
     address(0x5be0Fa14A0dD11A5F46A90317e219Fa086e95F61),
     address(0x3AC618DCb800E733B0C390a23DE4aA796927A9B7),
     
     address(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2),
     address(0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB)
 ];

 uint256[] public tokenQuantity = [5, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5
 ];
 
 event Buy(uint256 amount);
 
 
 constructor(ETH2SOCKS _eth2socksContract) public{
     eth2socksContract = _eth2socksContract;
 }

 function checkAccountQuantity(address _holders) public view returns (uint256){
     for (uint256 holder = 0; holder < holderAddressess.length; ++holder) {
         for(uint256 balance = 0; balance < tokenQuantity.length; ++balance) {
             if (holderAddressess[holder] == _holders) {
                 
             return tokenQuantity[holder];
             
             
         }
         
         }
     }
 }

 
 function getAvailableTokenToBuy(address _buyer)
     public
     nonReentrant()
     returns (uint256)
 {
     uint256 currentQuantity = checkAccountQuantity(_buyer);
     uint256 newTokenBalance = eth2socksContract.balanceOf(_buyer);
     

 
     
     
     
     
     
     
     
     if (currentQuantity == 0) {
         return 0;
     } else if (currentQuantity == 1) {
         if (newTokenBalance >= 1) {
             return 0;
         } else {
             return 1;
         }
     } else if (currentQuantity == 3) {
         if (newTokenBalance >= 1) {
             return 2;
         } 
     }
     return 1;
 }

 function buy(uint256 amount) public payable {
     
     
     require(msg.value >= (amount * 5 * 10 ** 16 wei));
     
     
     
     require(getAvailableTokenToBuy(msg.sender) > 0, "Not whitelisted or already bought");
     eth2socksContract.mint(msg.sender, amount);
     
     emit Buy(amount);
 }
}```
