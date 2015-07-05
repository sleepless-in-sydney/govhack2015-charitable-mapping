import csv
from geopy.geocoders import Nominatim, ArcGIS
#geolocator = Nominatim()
geolocator = ArcGIS()

fout = open ('nsw_data_jwwn.tsv','w')
er_fout = open ('er_out_jwwn.tsv','w')
writer = csv.writer(fout, delimiter="\t")
er_write = csv.writer(er_fout, delimiter="\t")


writer.writerow(['ABN','Latitude','Longitude','Aged_Care_Activities','Aged_Persons','Aboriginal_or_TSI','People_at_risk_of_homelessness','Charity_Name'])
with open('20150617_DataDotGov_AIS13.csv','r') as fin:
    for row in csv.reader(fin):
        if row[8] == 'NSW':
             abn = row[0]
             name = row[1].replace('\r',' ').replace('\n',' ')
             aged_care_activities = row[29]
             aged_persons = row[61]
             aboriginal_or_tsi = row[60]
             homelessness = row[72]
             try:
                 location = geolocator.geocode('%s %s %s %s %s' %(row[4],row[5],row[6],row[7],row[9]))
             except:
                 #row.extend((None,None))
                 er_write.writerow(row[0])
                 er_write.writerow('\n')
             print '%s %s %s %s %s' %(row[4],row[5],row[6],row[7],row[9])
             if location:
                 print "%s %s\n" %(location.latitude,location.longitude)
                 new_row = [abn,location.latitude,location.longitude,aged_care_activities,aged_persons,aboriginal_or_tsi,homelessness,name]
                 writer.writerow(new_row)
             else:
                 print "No Lat/Long :-(\n"
                 er_write.writerow(row[0])
                 er_write.writerow('\n')
             

#csv.writer(open(r"nsw_data.csv",'w')).writerows(filtered)
