
#!/bin/bash
xcodebuild -scheme xccov -derivedDataPath ./Build/ -destination 'platform=iOS Simulator,OS=11.3,name=iPhone 7' -enableCodeCoverage YES clean build test