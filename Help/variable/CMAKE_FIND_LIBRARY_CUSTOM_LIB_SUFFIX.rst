CMAKE_FIND_LIBRARY_CUSTOM_LIB_SUFFIX
------------------------------------

Specify a ``<suffix>`` to tell the :command:`find_library` command to
search in a ``lib<suffix>`` directory before each ``lib`` directory that
would normally be searched.

This overrides the behavior of related global properties:

* :prop_gbl:`FIND_LIBRARY_USE_LIB32_PATHS`
* :prop_gbl:`FIND_LIBRARY_USE_LIB64_PATHS`
