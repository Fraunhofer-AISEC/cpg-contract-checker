 @RequestMapping("/addCandidate")
    public String addCandidateDetails(@RequestParam("candidateName") String candidateName, @RequestParam("elecName") String elecName) {
        try{

        String contractAddress = contract.getContractAddress();
        System.out.println(contractAddress);
        contract.addCandidate(candidateName.getBytes(), elecName.getBytes());
        }
        catch (Exception e) {
            String error = e.getMessage();
            return error;
        }
        return "Success";
    }
