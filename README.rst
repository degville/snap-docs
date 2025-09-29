Snap documentation
=========================

This repository contains the source files to build a work-in-progress migration of the Snap documentation.

The migration involves porting the documentation currently hosted and published directly from the Snapcraft forum (https://forum.snapcraft.io/c/doc/15) to this repository, where it will be built with `Sphinx <https://www.sphinx-doc.org>` and published via `ReadtheDocs <https://readsthedocs.com/>`.

The documentation is written in Markdown and built with Sphinx, all taken from the `Documentation starter pack`_.

Build the documentation
-----------------------

Install prerequisite software
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To install the prerequisites:

.. code-block:: none

   make install

This will create a virtual environment (``.sphinx/venv``) and install
dependency software (``.sphinx/requirements.txt``) within it.

View the documentation
~~~~~~~~~~~~~~~~~~~~~~

To view the documentation:

.. code-block:: none

   make run

This will do several things:

* activate the virtual environment
* build the documentation
* serve the documentation on **127.0.0.1:8000**
* rebuild the documentation each time a file is saved
* send a reload page signal to the browser when the documentation is rebuilt

The ``run`` target is therefore very convenient when preparing to submit a
change to the documentation.

.. LINKS
.. _`Documentation starter pack`: https://github.com/canonical/sphinx-docs-starter-pack/tree/main

