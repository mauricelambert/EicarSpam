<?php

$middle_string = "EICAR-STANDARD-ANTIVIRUS-TEST-FILE";

for ($i = 0; $i < 300; $i++) {
  $file = fopen("file{$i}.txt", "w");
  fwrite($file, 'X5O!P%@AP[4\\PZX54(P^)7CC)7}$' . $middle_string  . '!$H+H*');
  fclose($file);
}
?>
