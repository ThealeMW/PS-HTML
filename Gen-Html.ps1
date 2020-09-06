$readlogs = Get-Content -Path "C:\logs\logs.txt"
$createhtml = "<html>
<head>
<title>LUDER TINDER</title>
<style>
.pace {
  -webkit-pointer-events: none;
  pointer-events: none;
  -webkit-user-select: none;
  -moz-user-select: none;
  user-select: none;
}

.pace-inactive {
  display: none;
}

.pace .pace-progress {
  background: #ffffff;
  position: fixed;
  z-index: 2000;
  top: 0;
  right: 100%;
  width: 100%;
  height: 1px;
}

.pace .pace-progress-inner {
  display: block;
  position: absolute;
  right: 0px;
  width: 100px;
  height: 100%;
  box-shadow: 0 0 10px #ffffff, 0 0 5px #ffffff;
  opacity: 1.0;
  -webkit-transform: rotate(3deg) translate(0px, -4px);
  -moz-transform: rotate(3deg) translate(0px, -4px);
  -ms-transform: rotate(3deg) translate(0px, -4px);
  -o-transform: rotate(3deg) translate(0px, -4px);
  transform: rotate(3deg) translate(0px, -4px);
}

.pace .pace-activity {
  display: block;
  position: fixed;
  z-index: 2000;
  top: 15px;
  right: 15px;
  width: 14px;
  height: 14px;
  border: solid 2px transparent;
  border-top-color: #ffffff;
  border-left-color: #ffffff;
  border-radius: 10px;
  -webkit-animation: pace-spinner 400ms linear infinite;
  -moz-animation: pace-spinner 400ms linear infinite;
  -ms-animation: pace-spinner 400ms linear infinite;
  -o-animation: pace-spinner 400ms linear infinite;
  animation: pace-spinner 400ms linear infinite;
}

@-webkit-keyframes pace-spinner {
  0% { -webkit-transform: rotate(0deg); transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); transform: rotate(360deg); }
}
@-moz-keyframes pace-spinner {
  0% { -moz-transform: rotate(0deg); transform: rotate(0deg); }
  100% { -moz-transform: rotate(360deg); transform: rotate(360deg); }
}
@-o-keyframes pace-spinner {
  0% { -o-transform: rotate(0deg); transform: rotate(0deg); }
  100% { -o-transform: rotate(360deg); transform: rotate(360deg); }
}
@-ms-keyframes pace-spinner {
  0% { -ms-transform: rotate(0deg); transform: rotate(0deg); }
  100% { -ms-transform: rotate(360deg); transform: rotate(360deg); }
}
@keyframes pace-spinner {
  0% { transform: rotate(0deg); transform: rotate(0deg); }
  100% { transform: rotate(360deg); transform: rotate(360deg); }
}

body {
  background-color: #222222;
  font-family: sans-serif;
}
img {
    width: 100%;
    height: 100%;
    min-width: 80px;
    max-width: 80px;
    min-height: 80px;
    max-height: 80px;
}
</style>
<script src='https://code.jquery.com/jquery-1.12.4.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/pace/1.0.2/pace.min.js'></script>
</head>
<body>
<center>
<img src='assets/header.png' style='max-width: 100% !important;max-height: 100% !important;width: 600px;height: 100px; margin-top: 30px; margin-bottom: 30px;'>
<h1 style='color:#404040; margin-top: 30px; margin-bottom: 30px;'>SCRAPER</h1>"
$closehtml = "</center>
</body>
</html>"

$createhtml | Out-File -Encoding utf8 -FilePath "C:\logs\final.html" -Append -Verbose

foreach ($img in $readlogs)
{
    $imgname = $img.Substring(0, $img.IndexOf('-'))
    $image = "<a href='$img' style='display: inline-block; text-decoration: none;' target='_blank'><img src='$img' style='border: 2px solid; border-image: conic-gradient(red, yellow, lime, aqua, blue, magenta, red) 1;'><p style='font-size: smaller;color: white;font-family: serif;'>$imgname</p></a>"
    $image | Out-File -Encoding utf8 -FilePath "C:\logs\final.html" -Append -Verbose
}

$closehtml | Out-File -Encoding utf8 -FilePath "C:\logs\final.html" -Append -Verbose

$compress = @{
  Path = "C:\logs"
  CompressionLevel = "Fastest"
  DestinationPath = "C:\html.zip"
}
Compress-Archive @compress -Verbose -Force
