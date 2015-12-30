<?php

$requestedContent = "index.xml";

if (isset($_SERVER['QUERY_STRING'])) {
	$requestedContent = $_SERVER['QUERY_STRING'];
//	$requestedContent = explode("/", $requestedContent)[1];
}

if (file_exists($requestedContent)) {
	loadAndProcess($requestedContent);
	die();
} else if (strpos($_SERVER['QUERY_STRING'], 'xslExport') !== false) {
	loadAndProcess($requestedContent);
	die();
} else {
	directoryListing();
}



function loadAndProcess($requestedContent) {

	// Load the XSL
	$xslContent = file_get_contents('xsl/default.xsl');

	// Load the configuration
	$hostReplacements = array();
	if (($handle = fopen("config.txt", "r")) !== FALSE) {
		while (($data = fgetcsv($handle, 1000, "\t")) !== FALSE) {
			if (count($data) < 2 || substr($data[0], 0, 1) == "#") {
				continue;
			}
			if (substr($data[0], 0, 5) == "host:") {
				$hostReplacements[$data[0]] = $data[1];
				continue;
			}
		}
		fclose($handle);
	}

	// Make needed adjustments to the XSL for the current configuration.
	foreach ($hostReplacements as $needle => $replacement) {
		$xslContent = str_replace("%%".$needle."%%", $replacement, $xslContent);
	}

	if (strpos($_SERVER['QUERY_STRING'], 'xslExport') !== false) {
		header("Content-Type: text/plain");
		echo $xslContent;
		die();
	}

	// Load the XML source
	$xml = new DOMDocument;
	$xml->load($requestedContent);

	// Load XSL content into DOMDocument.
	$xsl = new DOMDocument;
	$xsl->loadXML($xslContent);

	// Configure the transformer
	$proc = new XSLTProcessor;
	$proc->importStyleSheet($xsl);

	//var_dump();

	echo $proc->transformToXML($xml);
}


function directoryListing() {
	echo "<p><a href=\"?xslExport\" >XSL Export...</a></p>";

	if ($handle = opendir('.')) {
		echo "<p>Choose a content file:</p><ul>";
		while (false !== ($entry = readdir($handle))) {
			if (substr($entry,-4,4) != ".xml") {
				continue;
			}
			echo "<li><a href=\"?$entry\">$entry</a></li>";
		}
		closedir($handle);
		echo "</ul><p>Sample content files can be created by putting any xml file into the root directory of this project.</p>";
	}
}

?>