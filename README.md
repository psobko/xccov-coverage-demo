# XCCOV - Making Code Coverage Comprehensive
`xccov` (which is easy to mix up with [xcov](https://github.com/nakiostudio/xcov)) is a new command line tool available with Xcode 9.3 which allows easy parsing of Xcode Code Coverage reports. The usage is pretty simple:

```
xccov view [--file-list | --file <path>] archive.xccovarchive

xccov view [--only-targets | --files-for-target <target name> | --functions-for-file <name or path>] [--json] report.xccovreport
```

Like the other Xcode CLI tools you'll need to run it through xcrun. Here's the most basic command to display a report:

```
 xcrun xccov view Build/Logs/Test/*.xccovreport
```

Which will genrate human-readable output (though its 200 chars wide in this case which makes it human-readable-in-some-cases).  Behind the scenes there's not too much happening here, just parsing the `.plist` which contains all the same data. Looking at the [output](https://raw.githubusercontent.com/psobko/xccov-coverage-demo/master/coverage_report.txt) you'll see summaries of line counts and percentages. The JSON format is straightforward as well:

```
xcrun xccov view Build/Logs/Test/*.xccovreport --json >> coverage_report.json
```

This [output](https://raw.githubusercontent.com/psobko/xccov-coverage-demo/master/coverage_report_json.txt) will get back a bit more data, you'll get line numbers and execution counts. The structure is project -> target -> source file -> method.

There really isn't much more to it than that, the other flags are for returning a subset of the data which you might use in a larger project.

Some more info about the command from the pan page:
> When  tests  are run with code coverage enabled, Xcode generates two files that contain its representation of coverage data. These are the coverage report, with extension xccovreport, and the coverage archive, with extension xccovarchive. The coverage report contains line coverage percentages for each target, source file, and function/method that has coverage  information. The  coverage  archive  contains the raw execution counts for each file in the report. Using xccov, the contents of these files can be viewed in either human-readable or machine-parseable format. These files are located in the 'Logs/Test' subdirectory of your Xcode project's DerivedData subfolder. Additionally, if the -resultBundlePath  flag  is  passed  to  xcodebuild(1), copies of the files are placed in the results bundle.
