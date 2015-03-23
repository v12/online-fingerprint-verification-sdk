# Introduction #

'Online Fingerprint verification sdk' is an Automated fingerprint identification library([AFIS](http://en.wikipedia.org/wiki/Automated_fingerprint_identification)). The library helps in building online solutions for those who wants to incorporate [fingerprint](http://en.wikipedia.org/wiki/Fingerprint) [biometrics](http://en.wikipedia.org/wiki/Biometrics) in their [web based](http://en.wikipedia.org/wiki/Web_application) application.

## Scope ##
Now-a-days, websites allow users to do more than just retrieve information. They can build on the interactive facilities of of old internet to provide "Network as platform" computing, allowing users to run software-applications entirely through a browser.
Current project explores and implements a client/server based online Automated Fingerprint Identification System based on the [Live Scan](http://en.wikipedia.org/wiki/Fingerprint#Livescan_devices) of the Fingerprint. The whole of the system can be broadly divided into following modules – fingerprint enrollment, Fingerprint Feature Extraction and storage, and Fingerprint Matching against enrolled Fingerprints of people.

A web-based user-interface is developed for capturing Live Scan and enrollment of Fingerprints. The [web browser](http://en.wikipedia.org/wiki/web%20browser) accesses the fingerprint sensor installed on client’s machine using the TWAIN interfacing standards, which makes this web-application independent of third-party vendor specific sensor devices and platform independent and easily accessible though internet.

Fingerprint features are extracted as Minutiae and Fingerprint Image data along with its template is stored on a centralized database server. Fingerprint Image data is stored as a raw image (compatible with ISO/IEC 19794-4:2005(E)) and its template is stored in ISO 19794-2:2005(E) for inter-application compatibility, although this software system provides a custom template format which is much smaller in size. Standard feature extraction time is 130ms per fingerprint image.
Multiple Fingerprints of different fingers can be used for verification (1:1) and identification (1: N) of a person. Matching is a time consuming process for big databases. It must be optimized at database level and algorithm level. Without the database level optimization this software matches around 1000 fingerprint per sec.


## Demo ##
  1. See [Demonstration video](http://saurabhworld.in/go/5) of the application

## Join the project ##
To join the project, you can contact me at saurabh {at} saurabhworld {dot} in

or follow on the following channels for updates.
  * [Forum](https://groups.google.com/forum/?fromgroups#!forum/onlineAFIS)
  * [@onlineAFIS/twitter](https://twitter.com/intent/user?screen_name=onlineAFIS) - real-time project updates
  * [Google+ https://plus.google.com/u/0/111225195795240181451/posts]