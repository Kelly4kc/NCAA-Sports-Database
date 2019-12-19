from bs4 import BeautifulSoup
import csv
import time
from Utils import Utils

start_time = time.time()
years = Utils.getAllYears()
divisions = range(1, 3)
sport_codes = Utils.getAllSportCodes()
years = [2012]
sport_codes = [['WSB', 'w_softball'], ['WSO', 'w_soccer'], ['WVB', 'w_volleyball']]

for year in years:
    for sport in sport_codes:
        division = 1
        if sport[0] == 'MFB' and division == 1:
            division = 11
        print('Scraping {} rosters from {} in division {}'.format(sport[1], year, division))
        Utils.createDirectory('rosters', year)
        filename = 'teams/{}/{}_teams_{}_division_{}.csv'.format(year, sport[1], year, division)
        team_file = open(filename, 'r')
        write_file_name = Utils.getFileName('rosters', year, division, sport)
        write_file = open(write_file_name, 'w', newline='')
        with team_file and write_file:
            reader = csv.DictReader(team_file)
            writer = csv.writer(write_file)
            first = True
            for row in reader:
                team_url = row['team_url']
                team_name = row['team_name']
                url = 'https://stats.ncaa.org' + team_url
                urls = url.rsplit('/', 1)
                url = urls[0] + '/roster/' + urls[1]
                page = Utils.getPage(url, 0.1)
                print('\tScraping {} roster...'.format(row['team_name']), end='')
                if first:
                    header_items = page.find_all('th')
                    header_items = header_items[1:]
                    header = ['team_url', 'team_name', 'player_url']
                    for i in range(0, len(header_items)):
                        header.append(header_items[i].text)
                    writer.writerow(header)
                    first = False
                roster_rows = page.find_all('tr')[2:]
                players_without_url = 0
                players = 0
                for roster_row in roster_rows:
                    columns = roster_row.find_all('td')
                    player = [team_url, team_name]
                    players += 1
                    try:
                        player_url = columns[1].select('a')[0].attrs.get('href')
                        player.append(player_url)
                    except:
                        players_without_url += 1
                        player.append(None)
                    for column in columns:
                        player.append(column.text.replace('\x91', "'").strip())
                    writer.writerow(player)
                write_file.flush()
                print('found {} players. {} players without url'.format(players, players_without_url))
print('--- {} hours ---'.format((time.time() - start_time) / 3600))
