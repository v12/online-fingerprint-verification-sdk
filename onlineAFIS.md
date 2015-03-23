_draft Version_

_Last Updated on Jan 31, 2012_

_By Saurabh Kumar, [@saurabh\_world](http://saurabhworld.in/go/twitter)_


# Introduction #

OnlineAFIS™ is a web based fingerprint biometrics project.

A web-based user-interface is used to capture Live Scan and enrollment of Fingerprints. The web browser accesses the fingerprint sensor installed on client’s machine using the [TWAIN interfacing standards](http://twain.org), which makes this web-application independent of third-party vendor specific sensor devices and platform independent and easily accessible throughout Internet.

Fingerprint features are extracted as [Minutiae](http://en.wikipedia.org/wiki/Minutiae) and Fingerprint Image data along with its template is stored on a centralized database server. Fingerprint Image data is stored as a raw image (compatible with ISO/IEC 19794-4:2005(E)) and its template is stored in ISO 19794-2:2005(E) for inter-application compatibility, although this software system provides a custom template format which is much smaller in size.

Standard feature extraction time is 130ms per fingerprint image. Multiple Fingerprints of different fingers can be used for verification (1:1) and identification (1: N) of a person. Matching is a time consuming process for big databases. It must be optimized at database level and algorithm level. Without the database level optimization this software matches around 1000 fingerprint per sec.

The [demonstration application](http://saurabhworld.in/go/5), coded in ASP.net using C# is a ready version. this application is an Open Source Cloud based Web Application which can be integrated with any existing Web Based Open Source solutions. Matlab version of onlineAFIS is also available. OnlineAFIS is an open-source project with some rights reserved with the owner.




# Specifications and requirements #

## On client machine ##

  * Fingerprint Sensor Device with TWAIN Capability.
  * Internet Explorer with ActiveX and Javasript enabled (for use in Non-IE based browsers, please use the plugin version of [Dynamic Web Twain](http://www.dynamsoft.com/Products/WebTWAIN_Overview.aspx)).

## On the central-server ##

  * IIS Server or equivalent with .net Framework 3.5 above or ‘mono’ framework
  * Multi-Core processing unit is preferred to utilize the in-built parallel processing feature.
  * A database server for storing fingerprint images and generated ISO templates - My-SQL, Microsoft SQL server 2008 or it’s equivalent


# Security and other considerations #

## Security ##

OnlineAFIS is a web-application, therefore, it is expected that required level of security on client machine and servers will be implemented at various Layers (ref. OSI Model) by the project deploying organization. viz security certificates, SSL, etc.

As such, OnlineAFIS does not require any other security requirement but it will be thoroughly considered before final implementation.
Fingerprint Live-Scan

The application works with a Fingerprint Scanner which is TWAIN compatible and provides drivers for the same. [TWAIN](http://twain.org) is an open standard for Image Acquisition devices. Various vendors including [Biometrika](http://www.neurotechnology.com/fingerprint-scanner-biometrika-hiscan.html) and [Crossmatch](http://360biometrics.com/fingerprint-scanners/crossmatch/Verifier_300_LC_Fingerprint_Reader_Biometric_Reader_Fingerprint_Scanner.php) provides TWAIN interface to their scanning devices. Complete list of supported devices is listed [compatible\_devices](here.md)

# Pricing and third-party dependencies #

OnlineAFIS depends on third party plug-in from Dynamic Web TWAIN which is Licensed and the server base Licence needs to be purchased from the vender and fingerprint scanner device (which must have TWAIN interface). Other than this there is no other dependencies on third party libraries or vendors.

# Silent Features #

Some of the silent features of the project, which sets it apart from the other biometrics related project are :-
  * Minimum to no third-party dependencies
  * Complies with e-govenence and algorithm adopts MINDTCT# modular design
  * Being develop as an open-source project.

Already in use in prestigious projects at NIC, Ministry of Communications & Information Technology, Govt. of India.

# Legal Notices #

### Copyright ###
Copyright 2010-2012 Saurabh Kumar/ [@saurabh\_world](http://saurabhworld.in/go/twitter), http://saurabhworld.in. Distributed software is copyrighted by their respective contributors and are distributed under their own individual licenses.

### Disclaimer ###
Neither Saurabh Kumar,saurabhworld.in nor any of its sponsors make any guarantees, explicit or implicit, about the contents of this report. Use at your own risk.

### Trademark ###
OnlineAFIS is a Registered Trademark of Saurabh Kumar. All trademarks are property of their respective owners.