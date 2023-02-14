  public class DeploymentTest : ContractDeploymentMessage
        {
      public static string BYTECODE = @"0x....";

      public DeploymentTest() : base(BYTECODE) { }
        }

      public async Task ConnectToTest()
            {
                var url = "https://github.com/Nethereum/TestChains";
                var pass = "0xb5b1870957d373ef0eeffecc6e4812c0fd08f554b37b233526acc331bf1544f7";
                var acc = new Account(pass);
                var chain = new Web3(acc, url);
                var deploymentMessage = new DeploymentTest();
                var deploymentHandler =  chain.Eth.GetContractDeploymentHandler<DeploymentTest>();

                 
                var transactionReceipt = await deploymentHandler.SendRequestAndWaitForReceiptAsync(deploymentMessage);
                var contractAddress = transactionReceipt.ContractAddress;

                }
