<?php
    # This parameter identifies the page and is used to configure the menu.
    # It is false in this case because the home page isn't listed in the menu.
    $page = 'equation-balancer';
    
    require_once('template-header.php');
?>

                    <div id="content">
                        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.min.js"></script>
                        
                        <h3>The Great Equation Balancer</h3>
                        
                        <h4>Palette</h4>
                        
                        <div id="palette" class="round-corners">
                            <div class="algebra-tile algebra-tile-x round-corners">
                                <div class="label">X</div>
                            </div>
                            
                            <div class="algebra-tile algebra-tile-1 round-corners">
                                <div class="label">1</div>
                            </div>
                        </div>
                        
                        <h4>Balance</h4>
                        
                        <div id="balance-area">
                            <div id="pan-1" class="balance-pan"></div>
                            
                            <div id="balance">
                                <div id="tare" class="balance-button">Tare</div>
                                <div id="measure" class="balance-button">Measure</div>
                                <div id="reset" class="balance-button">Reset</div>
                            </div>
                            
                            <div id="pan-2 class="balance-pan"></div>
                        </div>
                    </div>
                                        
<?php
    require_once('template-menu.php')
?>