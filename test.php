<?php
   $c = new Memcached(); 
   $c->addServer("10.61.11.61", 11211); 
   var_dump( $c->getAllKeys() );
?>   