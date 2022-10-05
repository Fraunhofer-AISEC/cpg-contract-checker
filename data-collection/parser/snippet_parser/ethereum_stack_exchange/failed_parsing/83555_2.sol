        function () external payable {
            require (clicksfromcreatorcount>=1);
            if (clicksfromcreatorcount ==1) {
                require (tx.origin == creatorino);

            }
            require (count<2);
            count++;     
        }
}
