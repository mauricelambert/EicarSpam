$string = 'X5O!P%@AP[4\PZX54(P^)7CC)7}$_!$H+H*'.replace('_', 'EICAR-STANDARD-ANTIVIRUS-TEST-FILE')

for($i = 0; $i -lt 300; $i++){
	Set-Content "test$i.txt" $string
}