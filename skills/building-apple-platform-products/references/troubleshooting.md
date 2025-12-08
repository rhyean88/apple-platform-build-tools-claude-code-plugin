# Troubleshooting Index

Quick lookup for common errors across Apple platform builds.

**Important**: Each reference file contains topic-specific troubleshooting. This index helps you find the right file.

## Error Quick Reference

| Error Message | See File |
|---------------|----------|
| "The project does not contain a scheme" | project-discovery.md |
| "No schemes found" / No shared schemes | project-discovery.md |
| "error: root manifest not found" | swift-package-manager.md |
| "the package manifest at '...' cannot be accessed" | swift-package-manager.md |
| "dependency '...' is not used by any target" | swift-package-manager.md |
| "package '...' is using Swift tools version X" | swift-package-manager.md |
| "could not find module '...' for target" | swift-package-manager.md |
| "No such module 'ModuleName'" | xcodebuild-basics.md |
| "Code Sign error: No signing certificate" | xcodebuild-basics.md |
| "architecture 'arm64' that is incompatible" | xcodebuild-basics.md |
| "Build input file cannot be found" | xcodebuild-basics.md |
| "Unable to find a destination matching" | destinations.md |
| "Unable to boot device in current state: Booted" | destinations.md |
| "no available devices matched the request" | destinations.md |
| "Simulator is stuck or corrupt" | destinations.md |
| "Test runner exited before starting" | testing.md |
| "UI Testing Failure - No target application" | testing.md |
| "Timed out waiting for test results" | testing.md |
| "Tests failed" (exit code 66) | testing.md |
| "Archive action requires specifying a scheme" | archiving.md |
| "No signing certificate found" (archive) | archiving.md |
| "Archive not created" | archiving.md |
| "The archive is invalid" | archiving.md |

## Environment Issues

These general errors aren't topic-specific.

### "xcrun: error: unable to find utility..."

**Cause**: Xcode command line tools not configured.

**Solution**:
```bash
sudo xcode-select -s /Applications/Xcode.app
xcode-select -p  # Verify
sudo xcodebuild -license accept
```

### "error: tool 'xcodebuild' requires Xcode..."

**Cause**: Xcode not installed or not selected.

**Solution**:
```bash
# Install Xcode from App Store, then:
sudo xcode-select -s /Applications/Xcode.app
sudo xcodebuild -license accept
```

### "Requested but did not find extension point..."

**Cause**: Xcode internal error, often after updates.

**Solution**:
```bash
rm -rf ~/Library/Developer/Xcode/DerivedData
xcodebuild -derivedDataPath ./build clean build -scheme "MyApp"
```

## Cleanup Commands

Universal commands for resetting build state.

```bash
# Clean build folder
xcodebuild clean -scheme "MyApp"

# Remove derived data
rm -rf ~/Library/Developer/Xcode/DerivedData

# Reset SPM
swift package reset

# Reset all simulators
xcrun simctl erase all

# Remove SPM cache
rm -rf ~/Library/Caches/org.swift.swiftpm
rm -rf .build

# Remove Xcode caches
rm -rf ~/Library/Caches/com.apple.dt.Xcode
```

## Debug Commands

Commands for investigating build issues.

```bash
# Show build settings
xcodebuild -showBuildSettings -scheme "MyApp"

# Verbose build with log
xcodebuild build -scheme "MyApp" 2>&1 | tee build.log

# Check Xcode version
xcodebuild -version

# Check available SDKs
xcodebuild -showsdks

# Check Swift version
swift --version
```
