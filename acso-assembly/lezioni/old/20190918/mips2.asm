# a = (b+c)-(d-f)+g
add $t0, $s1, $s2
sub $t1, $s3, $s4
sub $t0, $t0, $t1
add $s3, $t0, $s5