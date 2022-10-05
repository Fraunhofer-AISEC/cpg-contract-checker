<!DOCTYPE html>
<html>
<head>
 <title>Decentralized Voting App</title>
 <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
 <link href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css' rel='stylesheet' type='text/css'>
 <style>
   </style>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Shitlist2</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Abel">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Londrina+Shadow">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Londrina+Solid">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans">
<link rel="stylesheet" href="assets/css/styles.min.css" rel='stylesheet' type='text/html'>
<link href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css' rel='stylesheet' type='text/css'>
</head>
<body>
    <div class="highlight-clean">
        <div class="container">
            <div class="intro">
                <h2 class="text-center" style="font-family:'Londrina Shadow', cursive;font-size:135px;margin-bottom:-13px;">SHITLIST</h2>
                <p class="text-center" style="font-family:'Open Sans', sans-serif;">Anonymously check and report names of alleged abusers.&nbsp;<br><br></p>
            </div>
            <div class="buttons"><a class="btn btn-primary" role="button" href="#" id="checknamebutton" data-toggle="modal" data-target="#checkname" style="font-family:'Open Sans', sans-serif;background-color:#c2a747;font-size:15px;">Check Name</a>
                <div class="modal fade"
                    role="dialog" tabindex="-1" id="checkname">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title" style="font-family:'Londrina Solid', cursive;font-size:45px;">Check Name:</h4><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button></div>
                            <div class="modal-body"><input type="text" id="searchNameAccused" name="name_check" placeholder="...type here..." autofocus="" style="font-family:'Open Sans', sans-serif;padding-bottom:1px;margin-bottom:21px;">
                                <p style="font-family:'Open Sans', sans-serif;">Enter the name of the person or organization you would like to check. Spelling counts as does capitalization. The search only shows results for exact matches.</p>
                                <p id="returnedClaimNumber">Claims:&nbsp;</p>
                            </div>
                            <div class="modal-footer"><button class="btn btn-light" type="button" data-dismiss="modal" style="font-family:'Open Sans', sans-serif;">Close</button>
                                <button class="btn btn-primary" type="button" id="btnCheckName" style="font-family:'Open Sans', sans-serif;font-size:18px;" >Check Name</button></div>
                        </div>
                    </div>
                </div><button class="btn btn-light" type="button" id="makeclaimbutton" data-toggle="modal" data-target="#makeclaim" style="font-family:'Open Sans', sans-serif;background-color:#ff77a8;font-size:15px;color:rgb(255,255,255);">MAke Claim</button>
                <button
                    class="btn btn-light" type="button" id="getrefundbutton" data-toggle="modal" data-target="#getrefund" style="font-family:'Open Sans', sans-serif;background-color:#7ad1b5;color:rgb(255,255,255);font-size:15px;">Get ReFUND</button>
                    <div class="modal fade" role="dialog" tabindex="-1" id="makeclaim">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title" style="font-family:'Londrina Solid', cursive;font-size:44px;">MAKE CLAIM:</h4><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button></div>
                                <div class="modal-body">
                                    <p style="font-family:'Open Sans', sans-serif;">The name of the person or organization against who you are making a claim:&nbsp;</p>

                                    <input type="text" id="name_accused" name="name_accused" placeholder="...Name...">

                                    <p style="font-family:'Open Sans', sans-serif;">Details of the claim you are making.&nbsp;</p>

                                    <input type="text" id="claim_details" name="claim_details" placeholder="...What happened..." style="width:379px;padding-bottom:1px;">
                                </div>
                                <div class="modal-footer"><button class="btn btn-light" type="button" data-dismiss="modal">Close</button>
                                    <button class="btn btn-primary" type="button" id="btnfunctionmakeClaim" style="font-family:'Open Sans', sans-serif;font-size:14px;">Make Claim</button></div>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
        <div class="container" style="max-width:458px;width:313px;">
            <div class="table-responsive" style="width:288px;">
                <table class="table">
                    <thead>
                        <tr style="width:476px;">
                            <th class="justify-content-center align-items-center align-content-center" id="status" style="font-family:Abel, sans-serif;">Status</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
        <div></div>
    </div>
    <div>
        <div class="modal fade" role="dialog" tabindex="-1" id="getrefund">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" style="font-family:'Londrina Solid', cursive;font-size:38px;">Get Refund</h4><button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button></div>
                    <div class="modal-body" style="font-family:'Open Sans', sans-serif;">
                        <p>You can request your refund after 1 year.&nbsp;</p><input class="justify-content-center" type="text" name="refundAddress" required="" placeholder="Ethereum Address"></div>
                    <div class="modal-footer"><button class="btn btn-light" type="button" data-dismiss="modal">Close</button><button class="btn btn-primary" type="button" id="claimRefund">Get Refund</button></div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-basic">
        <footer>
            <div class="social"><a href="#"><i class="icon ion-social-instagram"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-facebook"></i></a></div>
            <ul class="list-inline">
                <li class="list-inline-item"><a href="#">Home</a></li>
                <li class="list-inline-item"><a href="#">Services</a></li>
                <li class="list-inline-item"><a href="#">About</a></li>
                <li class="list-inline-item"><a href="#">Terms</a></li>
                <li class="list-inline-item"><a href="#">Privacy Policy</a></li>
            </ul>
            <p class="copyright">Company Name © 2017</p>
        </footer>
    </div>

</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
<script src="app.js"></script>
</html>
