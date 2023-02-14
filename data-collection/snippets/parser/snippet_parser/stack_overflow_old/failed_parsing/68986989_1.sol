    [FunctionOutput]
    public class DrugBoxesDTO 
    {
        [Parameter("tuple[]", "box1", 1)]
        public List<DrugBoxDTO> Boxes { get; set; }
    }

    public class DrugBoxDTO 
    {
        public string DrugName { get; set; }
        public string Producer { get; set; }
        public int Weight { get; set; } 
        public int Id { get; set; }
    }

Task<DrugBoxesDTO> qwe = drugStoreContract.GetFunction("getAllBoxes").CallAsync<DrugBoxesDTO>();
