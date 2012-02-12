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
                                <div class="label">x</div>
                            </div>
                            
                            <div class="algebra-tile algebra-tile-1 round-corners">
                                <div class="label">1</div>
                            </div>
                        </div>
                        
                        <h4>Balance</h4>
                        
                        <div id="balance-area">
                            <div id="balance" class="round-corners">
                                <div id="tare" class="button round-corners">Tare</div>
                                <div id="measure" class="button round-corners">Measure</div>
                                <div id="reset" class="button round-corners">Reset</div>
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