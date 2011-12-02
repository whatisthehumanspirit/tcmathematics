<?php
    # This parameter identifies the page and is used to configure the menu.
    # It is false in this case because the home page isn't listed in the menu.
    $page = false;
    
    require_once('template-header.php');
?>

                    <!-- This fills the page with a fractal image since the  
                         page has no real content. If you add actual content 
                         to this page change the id to "content" -->
                    <div id="content-fractal"></div>

<?php
    require_once('template-menu.php')
?>