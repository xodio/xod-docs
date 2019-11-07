---
title: Global Literals Reference
version: 1.0.0
---

# Global Literals Reference

Global literals are replaced with their values during the compilation process but left as placeholders if you only generate code, for example, with the “Show code” IDE menu item.

So, as long as you use globals instead of hard-coded values it's safe to share your project with other people even if the project uses your secret XOD Cloud API token to send data to your personal feeds.

## `=XOD_USERNAME` (String)

Your username. You have to be logged in if you refer this global. Otherwise, the compilation will end up with an error.

## `=XOD_PROJECT` (String)

The project name set in its metadata (in IDE via Edit → Project Preferences). Do not confuse this name with project file name on the file system: they may don’t match.

## `=XOD_TOKEN` (String)

The secret XOD Cloud API token. If you refer this global, a XOD Cloud API _key_ should be set or generated in the project metadata (in IDE via Edit → Project Preferences). Internet connection to exchange the public key to the secret token is also required at the moment of compilation.

The token is used to write or read data from the XOD Cloud API.
