@set ZOPE_HOME=/plone/Zope-2.10.13-final-py2.4
@set INSTANCE_HOME=/plone/zinstance/parts/instance
@set PYTHON=/plone/Python-2.4/bin/python
@set SOFTWARE_HOME=%ZOPE_HOME%\lib\python
@set CONFIG_FILE=%INSTANCE_HOME%\etc\zope.conf
@set PYTHONPATH=%SOFTWARE_HOME%
@set ZOPE_RUN=%INSTANCE_HOME%\bin\servicewrapper.py
"%PYTHON%" "%ZOPE_RUN%" -C "%CONFIG_FILE%" %1 %2 %3 %4 %5 %6 %7