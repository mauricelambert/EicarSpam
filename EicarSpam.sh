#!/usr/bin/env bash

a='X5O!P%@AP[4\PZX54(P^)7CC)7}$_!$H+H*'
for i in {0..300}; do
	echo "${a/_/EICAR-STANDARD-ANTIVIRUS-TEST-FILE}" > "test${i}.txt"
done