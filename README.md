Description
===========
This cookbook installs the Microsoft .NET Framework 4.6

Requirements
============

* Windows cookbook

Platform
--------

* Windows Vista or later
* Windows Server 2008 or greater

Attributes
==========
* `default['ms_dotnet46']['http_url']`: Download URL for MS .NET 4.6 MSI
* `default['ms_dotnet46']['timeout']`: Timeout for completing the installation

Usage
=====

Include the default recipe on a node's runlist to ensure that .NET Framework 4.6 is installed on the system
