#!/bin/bash

rm Packages Packages.bz2 Packages.xz Packages.zst Release Release.gpg

echo "[Repository] Generating Packages..."
./apt-ftparchive packages ./debs > Packages
zstd -q -c19 Packages > Packages.zst
xz -c9 Packages > Packages.xz
bzip2 -c9 Packages > Packages.bz2

echo "[Repository] Generating Release..."
./apt-ftparchive \
		-o APT::FTPArchive::Release::Origin="Deon's Repo" \
		-o APT::FTPArchive::Release::Label="Deon" \
		-o APT::FTPArchive::Release::Suite="stable" \
		-o APT::FTPArchive::Release::Version="1.0" \
		-o APT::FTPArchive::Release::Codename="ios" \
		-o APT::FTPArchive::Release::Architectures="iphoneos-arm iphoneos-arm64" \
		-o APT::FTPArchive::Release::Components="main" \
		-o APT::FTPArchive::Release::Description="Deon's Repo" \
		release . > Release

echo "[Repository] Signing Release using Deon's GPG Key..."
gpg -abs -u C3713CFDF578925A5FC9769E5F8EA57C5DDD6BF9 -o Release.gpg Release

echo "[Repository] Finished"
