from bs4 import BeautifulSoup
import csv
import time
from Utils import Utils

start_time = time.time()
years = Utils.getAllYears()
divisions = range(1, 3)
sport_codes = Utils.getAllSportCodes()


for year in years:
    for sport in sport_codes:
        division = 1
        if sport[0] == 'MFB' and division == 1:
            division = 11
        print('Scraping {} teams from {} in division {}...'.format(sport[1], year, division))
        conference_team_file_name = Utils.getFileName('teams_with_conference', year, division, sport)
        Utils.createDirectory('teams_with_conference', year)
        conference_team_file = open(conference_team_file_name, 'w', newline='')
        conference_file_name = Utils.getFileName('conferences', year, divsion, sport)
        conference_file = open(conference_file_name, 'r')
        with conference_file and conference_team_file:
            conference_reader = csv.DictReader(conference_file)
            conference_team_writer = csv.writer(conference_team_file)
            conference_team_writer.writerow(['team_url', 'team_name', 'conference_name', 'conference_id'])
            teams = dict([])
            total_num_teams = 0
            for conference in conference_reader:
                num_teams = 0
                print('\t{}...'.format(conference['conference_name']), end='')
                conference_url = 'http://stats.ncaa.org/team/inst_team_list?sport_code={}&academic_year={}&division={}' \
                                    '&conf_id={}&schedule_date=l'.format(sport[0], year, division, conference['conference_id'])
                page = Utils.getPage(conference_url, 0.1)
                for team_node in page.find_all('table', attrs={'width' : '95%'})[0].find_all('a'):
                    num_teams += 1
                    team_name = team_node.text
                    team_url = team_node.attrs.get('href')
                    teams.update([(team_name,team_url)])
                    conference_team_writer.writerow([team_url, team_name, conference['conference_id'], conference['conference_name']])
                total_num_teams += num_teams
                print('found {} teams'.format(num_teams))
            team_file_name = Utils.getFileName('teams', year, division, sport)
            team_file = open(team_file_name, 'r')
            with team_file:
                team_file_reader = csv.DictReader(team_file)
                num_teams = 0
                print('\tIndependent...', end='')
                for team in team_file_reader:
                    if team['team_name'] not in teams:
                        num_teams += 1
                        total_num_teams += 1
                        conference_team_writer.writerow([team['team_url'], team['team_name'], '-2','Independent'])
                print('found {} teams'.format(num_teams))
            print('\t{} total teams'.format(total_num_teams))
print('--- {} hours ---'.format((time.time() - start_time) / 3600))