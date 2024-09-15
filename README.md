# rickandmortyapp
Rick & Morty app for iOS devices!

## Configuration
You do not need to do anything more than open the `.xcworkspace` to open the project. Dependecies are automatically resolved thanks to SPM.

## Generate Mocks
This project uses Sourcery for generating mocks for unit testing.

If you want to update the generated AutoMockable files, you can use the  `run-automockable.sh` script that you can find in `Tools/scripts`.

IMPORTANT: the script use parallel for generating all the AutoMockable file for each package. If you do not have installed previously, the script will do.