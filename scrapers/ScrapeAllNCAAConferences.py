from bs4 import BeautifulSoup
import csv
import os
from Utils import Utils

years = Utils.getAllYears()
divisions = range(1, 3)

sport_codes = Utils.getAllSportCodes()

for year in years:
    for sport in sport_codes:
        division = 1
        if (sport[0] == 'MFB' and division == 1):
            division = 11
        print("Scraping {} conferences from {} in division {}...".format(sport[1], year[0], division), end='')
        url = "https://stats.ncaa.org/team/inst_team_list?academic_year={}&conf_id=-1&division={}&sport_code={}".format(
            year[0], division, sport[0])
        page = Utils.getPage(url, 0.1)
        conference_nodes = page.select("li a")

        conferences = []
        for conference_node in conference_nodes:
            href = conference_node.attrs.get('href')
            if 'changeConference' in href and '-1' not in href:
                conference_id = href[href.index('(') + 1: href.rindex(')')]
                conference_name = conference_node.text
                conferences.append([conference_id, conference_name])
        print(" found {} conferences".format(len(conferences)))

        if not os.path.exists('conferences/{}'.format(year[0])):
            try:
                os.makedirs('conferences/{}'.format(year[0]))
            except:
                print('Failed to create directory conferences/{}', year[0])

        filename = 'conferences/{}/{}_conferences_{}_division_{}.csv'.format(year[0], sport[1], year[0], division)
        file = open(filename, 'w', newline='')
        with file:
            writer = csv.writer(file)
            writer.writerow(['conference_id', 'conference_name'])
            writer.writerows(conferences)