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
        if sport[0] == 'MFB' and division == 1:
            division = 11
        print("Scraping {} teams from {} in division {}...".format(sport[1], year[0], division), end='')
        url = "https://stats.ncaa.org/team/inst_team_list?academic_year={}&conf_id=-1&division={}&sport_code={}".format(year[0], division, sport[0])
        page = Utils.getPage(url, 0.25)
        team_nodes = page.select("td a")
        teams = []
        for team_node in team_nodes:
            href = team_node.attrs.get('href')
            team_url = href
            team_name = team_node.text
            teams.append([team_url, team_name])
        print(" found {} teams".format(len(teams)))

        if not os.path.exists('teams/{}'.format(year[0])):
            try:
                os.makedirs('teams/{}'.format(year[0]))
            except:
                print('Failed to create directory teams/{}', year[0])

        filename = 'teams/{}/{}_teams_{}_division_{}.csv'.format(year[0], sport[1], year[0], division)
        file = open(filename, 'w', newline='')
        with file:
            writer = csv.writer(file)
            writer.writerow(['team_url', 'team_name'])
            writer.writerows(teams)
