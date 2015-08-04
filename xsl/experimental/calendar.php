<?php

// Load the XML source
$xml = new DOMDocument;
$xml->load('calendar.xml');

$xsl = new DOMDocument;
$xsl->load('calendarMagic.xsl');

// Configure the transformer
$proc = new XSLTProcessor;
$proc->importStyleSheet($xsl);

//var_dump();

echo $proc->transformToXML($xml);

?>