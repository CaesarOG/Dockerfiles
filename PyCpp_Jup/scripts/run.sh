#!/bin/bash

pwd=`cat pwd.txt`

sed -i "s|# c.NotebookApp.password = .*|c.NotebookApp.password = u'$pwd'|g" /root/.jupyter/jupyter_notebook_config.py