@echo off
:: Clean old files
echo %time% [Script] Cleaning old files...
rmdir beta /s /q
:: Merge two modpacks
echo %time% [Script] Merging two modpacks...
xcopy framework\*.* beta\ /e /Q > nul
xcopy mod\*.* beta\ /e /y /Q > nul
:: Copy Changelog
echo %time% [Script] Copying Changelog...
copy CHANGELOG.md beta\config\fancymenu\assets\changelog.md > nul
:: Remove unused files
echo %time% [Script] Removing unused files...
del beta\README.md
del beta\.gitattributes
del beta\.packwizignore
:: Pack Additions
echo %time% [Script] Pack Additions...
cd beta
packwiz refresh > nul
packwiz remove xaeros-minimap > nul
packwiz refresh --build > nul
echo %time% [Script] Done!
@pause