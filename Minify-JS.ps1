# Initializing Paths

$javaPath           = "C:\Program Files\Java\jre6\bin\java.exe"
$closurePath        = "D:\lib\closure-compiler\compiler.jar"
$combinedOutputPath = "D:\Output\yourfile-combined.js"
$minifiedOutputPath = "D:\Output\yourfile-min.js"

New-Item $combinedOutputPath -type file -force | out-null
New-Item $minifiedOutputPath -type file -force | out-null

$files =
"D:\Repository\source1.js",
"D:\Repository\source2.js",
"D:\Repository\source3.js"

# Concatenating Files

foreach($file in $files){
    Write-Host $file
    $item = Get-Item $file
    $fileContent = Get-Content $item
    Add-Content $combinedOutputPath $fileContent
}

# Minifying Files

& $javaPath -jar $closurePath --js $combinedOutputPath --js_output_file $minifiedOutputPath