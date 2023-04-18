dpkg-scanpackages --multiversion debs > Packages.tmp
rm -f Packages Packages.bz2 Packages.xz Packages.zst
cp Packages.tmp Packages
bzip2 Packages
cp Packages.tmp Packages
xz Packages
cp Packages.tmp Packages
zstd Packages
mv Packages.tmp Packages
php updaterelease.php
gpg -abs -u C3713CFDF578925A5FC9769E5F8EA57C5DDD6BF9 -o Release.gpg Release