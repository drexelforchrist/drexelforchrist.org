<?php

// Load the XML source
$xml = new DOMDocument;
$xml->load('page-church.xml');

$xsl = new DOMDocument;
$xsl->load('xsl/default.xsl');

// Configure the transformer
$proc = new XSLTProcessor;
$proc->importStyleSheet($xsl);

//var_dump();

echo $proc->transformToXML($xml);

?>