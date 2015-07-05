# govhack2015-charitable-mapping
The index.html file can be run locally if need be. It grabs the required libraries from various CDNs and the data is grabbed live via the cartodb.js api.

The index-sublayers version just uses cartodb to store the data rather than grabbing from the cartodb json files. It needs further work as there is no interacitvity (tooltips et al).

Search could and should be implemented.

Some of the lats and longs are incorrect in the geo-referenced data file. Needs substantial error checking on abns that have been referenced to states other than NSW.

The ABS census SA2 data is problematic as there were issues in exporting to csv or xls files during the development weekend.

ACNC data has some issues with non printable characters and carriage returns. The non printables may need to be addressed in an update to the python code (when we did this there were three instances in the file that we just edited for speed's sake).

