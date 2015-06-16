drexelforchrist.org
===================

This is the templating for the upcoming revision of the Drexel Students for Christ website.  It's based on [XSL](https://en.wikipedia.org/wiki/XSL).  Depending on the client's browser, the XSL may be parsed at the client using the browser's default XSL parser, or at the client using javascript, or at the server such that the client receives only standards-compliant HTML.

The objective of this project is to transform the relatively utilitarian XML output by the server into something pretty. 
  
Trademarkable and/or licensed assets such as logos, icons and fonts are not included in this repository because those are the property of Drexel Students for Christ or their owners and are licensed differently. 

##Why this is Awesome-er than the Previous Version

The benefits of this new design can be broken into two basic categories: this design method will work better with the server, and this design method will look better on each client device.  

###It'll work better with the server because:

-	The upcoming server-side database-handling system is designed to *not* be formatting-specific.  The design in this repository will provide a ubiquitous design that doesn't encumber the business logic of the server.  
-	There's less extensive testing required of design changes because the XML-based formatting is much more rigid in what is acceptable.  That is, problems are more likely to be caught earlier. 
 
###It'll work better with the client devices because:

-	We're finally finishing the replacement of the color scheme that dates back to when we were Drexel Cru. 
-	While visually similar to the previous design, it's a little bit prettier with better distinctions on where a given page fits into the Drexel Students for Christ Philosophy of Ministry. 
-	It's designed to work better with mobile devices and small screen sizes.
-	Wherever possible, images are being replaced by Vector-based graphics, which are smaller files, load faster, and look better on displays with elevated pixel densities (like Retina displays).
-	Wherever possible, images are encoded into other styling files, reducing the total number of files that need to load, reducing load time. 
-	This design is meant to be easily cached by client devices, reducing load time when navigating between pages, or re-visiting the site. 
-	Most design assets will be stored at drexelforchrist.com (not .org) which means they can be requested without the encumberance of cookies that must be sent with every request to drexelforchrist.org.  This will slightly improve load time. 