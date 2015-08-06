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

##Working With This Code

To work with this code, you'll need an environment that supports PHP 5.  ISS and Apache should both work fine, and you should be able to use Windows, Mac or Linux.  While PHP isn't strictly necessary to develop XSL, drexelforchrist.org uses a PHP XSL parser behind the scenes for most of the XSL rendering, so you need to use the PHP XSL parser to make sure all of the XSL syntax actually works.  (Since XSL isn't fully implemented in most implementations, it's important to make sure you're getting what you expect.)  James uses and recommends [PHPStorm](https://www.jetbrains.com/phpstorm/) for this project.  However, if you're looking to get running quickly and don't plan on doing anything super-fancy, you can use [WebMatrix](http://www.microsoft.com/Web/webmatrix/php.aspx).  To the step-by-step of getting WebMatrix running with this project, follow the steps below.
 
###Working With this Code in WebMatrix 

1	[Download](http://go.microsoft.com/fwlink/?LinkID=286266) and Install WebMatrix and the Microsoft Web Platform Installer (hereafter, WPI). 
2	Run WebMatrix and Open -> From Source Control.  Provide this repo URL, `https://github.com/drexelforchrist/drexelforchrist.org.git` or the url of your fork.  (If you're new to this, you should probably do your development in a fork of your own, and then submit Pull Requests.)  
3	If you're prompted to install detected dependencies, do it.  This will install the needed PHP extensions if you don't have them already. 
4	Specify the version of PHP to use.  Go to site (on the bottom left), then Settings.  Under PHP Settings, make sure PHP is enabled, and choose the highest available version of PHP.  (At the time of writing this, drexelforchrist.org runs on PHP 5.6)  If it requires an install, do it.  Also, while you're on this page, make sure that index.php is somewhere on the list of Default Pages. 
5	In the unlikely event that you're going to be modifying index.php, change the PHP coding standard to PSR1 by going to the PHP Tools tab -> Validation -> Coding Standard.  At some point in the future, the coding standard for this project will probably be raised, but in the meantime, stick to PSR1.
6	To test the design, click the Run button, then choose one of the sample XML pages to see how it'll look.  Bear in mind that the samples given do not cover all possible document arrangements. 

If you're using a Windows system for development, you should be aware that all deployments of drexelforchrist.org.  The most significant application point for this is that while file names are not case-sensitive on your development system, file names *are* case-sensitive on the deployments. 

