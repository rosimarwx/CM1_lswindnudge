#!/bin/tcsh

module load nco

set h = 2 
set path2files = "/glade/scratch/rberrios/cm1runs/ctl_5ms_28C/"

while (${h} <= 241)
  if (${h} < 10) then
    set hour = "00000"${h}
  else if (${h} >= 10 && ${h} < 100) then
    set hour = "0000"${h}
  else
    set hour = "000"$h
  endif
  set filename = ${path2files}"cm1out_"${hour}".nc"
  echo ${filename}
  
  ncrename -d ni,xh ${filename} 
  ncrename -d nj,yh ${filename} 
  ncrename -d nk,z ${filename} 

  @ h += 1
end 
