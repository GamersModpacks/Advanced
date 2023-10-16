@echo off
:: Cleaning old files.
rmdir beta /s /q
:: Merging two modpacks
xcopy framework\*.* beta\ /e
xcopy mod\*.* beta\ /e /y
:: Removing unused files.
del beta\README.md
del beta\.gitattributes
del beta\.packwizignore
:: Pack Additions
cd beta
packwiz refresh
packwiz remove xaeros-minimap
packwiz cf install xaeros-minimap-fair-play-edition
packwiz cf install https://www.curseforge.com/minecraft/mc-mods/unionlib/files/4570859
packwiz refresh --build
@pause