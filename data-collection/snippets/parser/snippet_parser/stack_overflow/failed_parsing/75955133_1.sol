public async void DeclareWinner()
    {
        string contractAbi = ContractDetails.ContractABI;
        string contractAddress = ContractDetails.ContractAddress;
        string method = "declareWinner";

        string roomId = RoomIDInput.text;
        string winner = Winner.text;
        string[] obj = { roomId, winner };

        string args = JsonConvert.SerializeObject(obj);

        string value = "0";
        string gasLimit = "200000";
        string gasPrice = "20000000000";
        try
        {
            string response = await Web3GL.SendContract(method, contractAbi, contractAddress, args, value, gasLimit, gasPrice);
            WinnerTxt.text=Winner.text;
        }
        catch (Exception e)
        {
            Debug.Log(e, this);
        }
    } 
