<?php
    # This parameter identifies the page and is used to configure the menu.
    # It is false in this case because the home page isn't listed in the menu.
    $page = 'equation-balancer';
    
    require_once('template-header.php');
?>
                    <script type="text/javascript">
                        // Animation variables
                        var panAnimationTime = 500;
                        var panHeightMax = 116;
                        var panHeightNormal = 140;
                        var panHeightMin = 164;
                        // array = [ x coefficient, constant ]
                        var pan1 = [0, 0];
                        var pan2 = [0, 0];
                        var x = 0;
                        var isTared = false;
                        
                        function message(message) {
                            alert(message);
                        }
                        
                        function addToPan(pan, event, ui) {
                            var panNumber = $(pan).attr("id").slice(-1);
                            if ( $(ui.draggable).hasClass("algebra-tile-x") ) {
                                var algebraTileType = "x";
                            } else if ( $(ui.draggable).hasClass("algebra-tile-1") ) {
                                var algebraTileType = "1";
                            }
                          
                            $(ui.draggable).remove();
                            $("#pan-" + panNumber + " .algebra-tile-" + algebraTileType).css("visibility", "visible");
                          
                            if (panNumber == "1") {
                                if (algebraTileType == "x") {
                                    pan1[0] ++;
                                    $("#pan-1 .algebra-tile-x .label").html(pan1[0] + "x");
                                    newTileX();
                                } else if (algebraTileType == "1") {
                                    pan1[1] ++;
                                    $("#pan-1 .algebra-tile-1 .label").html(pan1[1]);
                                    newTile1();
                                }
                            } else if (panNumber == "2") {
                                if (algebraTileType == "x") {
                                    pan2[0] ++;
                                    $("#pan-2 .algebra-tile-x .label").html(pan2[0] + "x");
                                    newTileX();
                                } else if (algebraTileType == "1") {
                                    pan2[1] ++;
                                    $("#pan-2 .algebra-tile-1 .label").html(pan2[1]);
                                    newTile1();
                                }
                            }
                        }
                        
                        function newTileX() {
                            $("#palette").prepend('<div class="algebra-tile algebra-tile-x round-corners"><div class="label">x</div></div>');
                            $("#palette .algebra-tile").draggable({revert: "invalid"});
                        }
                    
                        function newTile1() {
                            $("#palette").append('<div class="algebra-tile algebra-tile-1 round-corners"><div class="label">1</div></div>');
                            $("#palette .algebra-tile").draggable({revert: "invalid"});
                        }
                        
                        function tarePans() {
                            var numerator = pan2[1] - pan1[1];
                            var denominator = pan1[0] - pan2[0];
                            
                            if (numerator != 0 && denominator != 0) {
                                x = numerator / denominator;
                                isTared = true;
                                $(".balance-pan").animate({top: panHeightNormal}, 500);
                            } else if (numerator == 0 && denominator != 0) {
                                x = 0;
                                isTared = true;
                                $(".balance-pan").animate({top: panHeightNormal}, 500);
                            } else if (numerator != 0 && denominator == 0) {
                                message("These expressions are not equal!");
                            } else if (numerator == 0 && denominator == 0) {
                                message("This equation can't be solved for a single value of x, or x is undefined!");
                            }
                        }
                        
                        function measurePans() {
                            if (isTared) {
                                var pan1Total = x * pan1[0] + pan1[1];
                                var pan2Total = x * pan2[0] + pan2[1];
                            
                                if (pan1Total == pan2Total) {
                                    $("#pan-1").animate({top: panHeightNormal}, 500);
                                    $("#pan-2").animate({top: panHeightNormal}, 500);
                                    message("Congratulations!");
                                } else if (pan1Total < pan2Total) {
                                    $("#pan-1").animate({top: panHeightMax}, 500);
                                    $("#pan-2").animate({top: panHeightMin}, 500);
                                } else if (pan1Total > pan2Total) {
                                    $("#pan-1").animate({top: panHeightMin}, 500);
                                    $("#pan-2").animate({top: panHeightMax}, 500);
                                }
                            } else {
                                message("First tare the balance!");
                            }
                        }
                        
                        function resetPans() {
                            isTared = false;
                            pan1 = [0, 0];
                            pan2 = [0, 0];
                            x = 0;
                            $("#pan-1 .algebra-tile-x .label").html("x");
                            $("#pan-1 .algebra-tile-1 .label").html("1");
                            $("#pan-2 .algebra-tile-x .label").html("x");
                            $("#pan-2 .algebra-tile-1 .label").html("1");
                            $("#balance .algebra-tile").css("visibility", "hidden");
                            $(".balance-pan").animate({top: panHeightNormal}, 500);
                        }
                        
                        $(document).ready(function() {
                      		  $("#palette .algebra-tile").draggable({revert: "invalid"});
                      		  
                      		  $(".balance-pan").droppable({
                      		      tolerance: "touch", 
                      		      drop: function(event, ui) {
                      		          addToPan(this, event, ui);
                    		        }
                    		    });
                      	});
                    </script>
                    
                    <div id="content">
                        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.min.js"></script>
                        
                        <h3>The Great Equation Balancer</h3>
                        
                        <h4>Palette</h4>
                        
                        <div id="palette" class="round-corners">
                            <div class="algebra-tile algebra-tile-x round-corners">
                                <div class="label">x</div>
                            </div>
                            
                            <div class="algebra-tile algebra-tile-1 round-corners">
                                <div class="label">1</div>
                            </div>
                        </div>
                        
                        <h4>Balance</h4>
                        
                        <div id="balance">
                            <div id="balance-mechanism" class="round-corners">
                                <div id="tare" class="button round-corners" onclick="tarePans();">Tare</div>
                                <div id="measure" class="button round-corners" onclick="measurePans();">Measure</div>
                                <div id="reset" class="button round-corners" onclick="resetPans();">Reset</div>
                            </div>
                            
                            <div id="pan-1" class="balance-pan round-corners">
                                <div class="algebra-tile algebra-tile-x round-corners">
                                    <div class="label">x</div>
                                </div>
                        
                                <div class="algebra-tile algebra-tile-1 round-corners">
                                    <div class="label">1</div>
                                </div>
                            </div>
                            
                            <div id="pan-2" class="balance-pan round-corners">
                                <div class="algebra-tile algebra-tile-x round-corners">
                                    <div class="label">x</div>
                                </div>
                        
                                <div class="algebra-tile algebra-tile-1 round-corners">
                                    <div class="label">1</div>
                                </div>
                              </div>
                        </div>
                    </div>
                                        
<?php
    require_once('template-menu.php')
?>