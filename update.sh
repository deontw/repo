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
gpg -abs -u D8A11D878A1E7168229B72871F4BE83D3C22E8E4 -o Release.gpg Release