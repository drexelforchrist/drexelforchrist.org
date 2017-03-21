<?php


	// Load the configuration
	$hostReplacements = [];
	if (($handle = fopen("config.txt", "r")) !== FALSE) {
		while (($data = fgetcsv($handle, 1000, "\t")) !== FALSE) {
			if (count($data) < 2 || substr($data[0], 0, 1) != "#") {
				continue;
			}
			if (substr($data[0], 1, 5) == "host:") {
				$hostReplacements[substr($data[0],1)] = $data[1];
				continue;
			}
		}
		fclose($handle);
	}


if ($handle = opendir('./xsl')) {

	echo "<p>Exporting:</p><ul>";
	while (false !== ($entry = readdir($handle))) {
		if (substr($entry,-4,4) != ".xsl") {
			continue;
		}
		export($entry);
		echo "<li>$entry</li>";
	}
	closedir($handle);
	echo "</ul><p>Sample content files can be created by putting any xml file into the root directory of this project.</p>";
}

function export($filename) {

	global $hostReplacements;

	$xslContent = file_get_contents("xsl/" . $filename);

	@mkdir('xsl_export');

	// Make needed adjustments to the XSL for the current configuration.
	foreach ($hostReplacements as $needle => $replacement) {
		$xslContent = str_replace("%%" . $needle . "%%", $replacement, $xslContent);
		file_put_contents("xsl_export/" . $filename, $xslContent);
	}

}