#!/bin/bash
# gfx1 CHAR
# gfx2 SCR1
# gfx3 OBJ
# gfx4 SCR2
# gfx5 map ROM for SCR2
mame2dip trojan.xml \
    -rbf jttrojan \
    -frac gfx2 4 \
    -frac gfx3 2 \
    -frac gfx4 2 \
    -start gfx1 0x30000 \
    -order maincpu soundcpu adpcm gfx5 gfx1 gfx2 gfx4 gfx3 \
    -header 32 -header-data 2 \
    -header-offset 8 soundcpu gfx1 gfx2 gfx3 proms

for i in Tro*mra; do
    mra -z /opt/mame -A "$i"
done

mkdir -p _alternatives/_Trojan
mv 'Trojan (bootleg).mra' 'Trojan (US set 1).mra' 'Trojan (US set 2).mra' _alternatives/_Trojan