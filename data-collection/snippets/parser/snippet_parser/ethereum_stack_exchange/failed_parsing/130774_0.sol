contract.sendEventEventFlowable(filter)
        .subscribe(doc -> {           
            System.out.println(doc.name);
        }, throwable -> {
            throwable.printStackTrace();
        }, () -> {
            System.out.println("End of research");
        });
