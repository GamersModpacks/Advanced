@echo off
:: Check PackFramework folder
echo [%time%] Checking PackFramework folder...
IF EXIST "framework" (
    echo [%time%] Found a PackFramework folder!
) ELSE (
	echo [%time%] Downloading PackFramework source...
	git clone https://github.com/Den4enko/PackFramework framework
	cd framework
	git checkout forge/1.19.2
	cd ..
)
:: Clean old files
echo [%time%] Cleaning old files...
rmdir beta /s /q
:: Merge two modpacks
echo [%time%] Merging two modpacks...
xcopy framework\*.* beta\ /e /Q > nul
xcopy mod\*.* beta\ /e /y /Q > nul
:: Copy Changelog
echo [%time%] Copying Changelog...
copy CHANGELOG.md beta\config\fancymenu\assets\changelog.md > nul
:: Remove unused files
echo [%time%] Removing unused files...
del beta\README.md
del beta\.gitattributes
del beta\.packwizignore
:: Pack Additions
echo [%time%] Pack Additions...
cd beta
packwiz refresh > nul
packwiz remove xaeros-minimap > nul
packwiz refresh --build > nul
echo [%time%] Done!
@pause