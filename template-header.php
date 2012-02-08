<?php 
    echo '<?xml version="1.0" encoding="UTF-8"?>';
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

        <title>TC Mathematics</title>

        <link rel="stylesheet" type="text/css" media="screen" href="css/screen.css" />
        
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        
        <script type="text/javascript">
            // These nested functions govern the behavior of the menu.
            $(document).ready(function() {
                /* This assigns links to all of the menu items that correspond 
                   to actual pages */
                $('.page').click(function() {
                    var url = $(this).attr('id') + '.php';
                    window.location.href = url;
                });
                
                /* This uses the php page parameter to create a few JavaScript 
                   parameters. */
                var pageName = '<?php echo $page; ?>';
                var currentPage = '#' + pageName;
                if ( $(currentPage).hasClass('menu-level-1') ) {
                    var currentMenuLevel1 = currentPage;
                } else {
                    var currentMenuLevel1 = '#' + $(currentPage).parent().prev().attr('id');
                    $(currentMenuLevel1).next('.menu-level-2-container').addClass('keep-expanded');
                }
                                
                /* This highlights the item in the menu that corresponds to 
                   the current page and expands the menu if appropriate */
                if (pageName != false) {
                    $(currentPage).addClass('menu-item-active');
                    
                    if ($(currentPage).parent('.menu-level-2-container')) {
                        $(currentPage).parent('.menu-level-2-container').show();
                    }
                }
                
                /* This makes the menu sexy. I'll come back and provide better 
                   comments. Am sleepy */
                $('.menu-level-1').click(function() {
                    if ( $(this).next('.menu-level-2-container').css('display') != 'block' ) {
                        $('.menu-level-2-container').each(function() {
                           if ( $(this).hasClass('keep-expanded') == false ) {
                               $(this).hide(250);
                           } 
                        });
                        $(this).next('.menu-level-2-container').show(500);
                    }
                    
                    if ( $(this).attr('id') == currentMenuLevel1.slice(1) ) {
                        $('.menu-level-2-container').each(function() {
                           if ( $(this).hasClass('keep-expanded') == false ) {
                               $(this).hide(250);
                           } 
                        });
                    }
                });
            });
        </script>
    </head>

    <body>
        <div id="main"><!-- This is the main container, which, among other 
                            things, centers everything in the browser. -->
            <div id="header"><!-- This is, like, the header, dude. -->
                <a id="logo" title="" href="index.php"></a>
            </div>
            
            <div id="main-content"><!-- This is the main content container, 
                                        which includes the menu and the page 
                                        content area. -->
                <div id="content-area"><!-- This is the page content area. -->