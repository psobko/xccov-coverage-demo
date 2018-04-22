
#!/bin/bash

#1.Build the project and run tests
xcodebuild -scheme xccov -derivedDataPath ./Build/ -destination 'platform=iOS Simulator,OS=11.3,name=iPhone 7' -enableCodeCoverage YES clean build test

#2.Generate thte JSON coverage data
xcrun xccov view --json ./*.xccovreport