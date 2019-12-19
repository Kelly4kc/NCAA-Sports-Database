from bs4 import BeautifulSoup
import csv
import os
import time
from Utils import Utils

start_time = time.time()
years = Utils.getAllYears()
years = [[2014], [2015], [2016], [2017], [2018], [2019]]
divisions = range(1, 3)
sport_codes = Utils.getAllSportCodes()
sport_codes = [['WSO', 'w_soccer']]

for sport in sport_codes:
    for year in years:
        print('{} {}'.format(sport[1], year[0]))
        division = 1
        if sport[0] == 'MFB' and division == 1:
            division = 11
            continue
        schedule_file_name = 'schedules/{}/{}_schedules_{}_division_{}.csv'.format(year[0], sport[1], year[0], division)
        schedule_file = open(schedule_file_name, 'r')
        if not os.path.exists('games/{}'.format(year[0])):
            try:
                os.makedirs('games/{}'.format(year[0]))
            except:
                print('Failed to create directory games/{}', year[0])
        if not os.path.exists('game_info/{}'.format(year[0])):
            try:
                os.makedirs('game_info/{}'.format(year[0]))
            except:
                print('Failed to create directory game_info/{}', year[0])

        write_file_name = 'games/{}/{}_games_{}_division_{}.csv'.format(year[0], sport[1], year[0], division)
        write_file = open(write_file_name, 'w', newline='')
        write_file_name2 = 'game_info/{}/{}_game_info_{}_division_{}.csv'.format(year[0], sport[1], year[0], division)
        write_file2 = open(write_file_name2, 'w', newline='')
        with schedule_file and write_file and write_file2:
            reader = csv.DictReader(schedule_file)
            writer = csv.writer(write_file)
            writer2 = csv.writer(write_file2)
            first = True
            count = 0
            for row in reader:
                count += 1
                game_url = 'https://stats.ncaa.org' + row['game_url']
                if game_url == 'https://stats.ncaa.org':
                    continue
                print("{}\tScraping {} game {}: {} vs. {}".format(count, sport[1], row['game_id'], row['team_name'], row['opponent_name']), end='')
                page = Utils.getPage(game_url, 0.1)
                info_tables = page.find_all("table", attrs={"width" : "50%"})
                periods_html = info_tables[0]
                away_periods_html = periods_html.find_all('tr')[1].find_all('td')
                home_periods_html = periods_html.find_all('tr')[2].find_all('td')
                periods = ['game_id', 'game_url', 'team_url']
                for td in periods_html.find_all('tr')[0].find_all('td'):
                    periods.append(td.text.replace('\xa0', 'team_name').strip())
                away_periods = [row['game_id'], row['game_url']]
                for td in away_periods_html:
                    if td.select('a') != []:
                        away_periods.append(td.select('a')[0].attrs.get('href'))
                    away_periods.append(td.text.strip())
                home_periods = [row['game_id'], row['game_url']]
                for td in home_periods_html:
                    if td.select('a') != []:
                        home_periods.append(td.select('a')[0].attrs.get('href'))
                    home_periods.append(td.text.strip())
                notes = []
                for table in info_tables[1:]:
                    for tr in table.find_all('tr'):
                        info_row = tr.find_all('td', attrs={"class" : "boldtext"})
                        if info_row != []:
                            periods.append(info_row[0].text.replace(':', ''))
                            info = tr.find_all('td')[1].text.replace('\n', '').strip()
                            away_periods.append(info)
                            home_periods.append(info)
                        else:
                            for td in tr.find_all('td'):
                                notes.append(td.text.strip())
                for note in notes:
                    periods.append('note')
                    away_periods.append(note)
                    home_periods.append(note)
                writer2.writerow(periods)
                writer2.writerow(away_periods)
                writer2.writerow(home_periods)
                write_file2.flush()
                if first:
                    header_items = page.find_all("th")
                    header = ['game_id','game_url', 'team_url', 'team_name', 'home/away', 'player_url']
                    for i in range(0, int(len(header_items) / 2)):
                        header.append(header_items[i].text)
                    writer.writerow(header)
                    first = False
                tables = page.find_all("table", attrs={"width" : "1000px"})
                try:
                    away_team = page.find_all("table", attrs={"class": "mytable", "width": "50%"})[0].find_all("tr")[1].find_all('td')[0].text
                    home_team = page.find_all("table", attrs={"class": "mytable", "width": "50%"})[0].find_all("tr")[2].find_all('td')[0].text
                    away_team_url = page.find_all("table", attrs={"class" : "mytable", "width" : "50%"})[0].find_all("tr")[1].find_all('td')[0].select("a")[0].attrs.get('href')
                    home_team_url = page.find_all("table", attrs={"class" : "mytable", "width" : "50%"})[0].find_all("tr")[2].find_all('td')[0].select("a")[0].attrs.get('href')
                except:
                    if (away_team == None):
                        break
                    try:
                        away_team_url = page.find_all("table", attrs={"class": "mytable", "width": "50%"})[0].find_all("tr")[1].find_all('td')[0].select("a")[0].attrs.get('href')
                    except:
                        away_team_url = None
                    try:
                        home_team_url = page.find_all("table", attrs={"class": "mytable", "width": "50%"})[0].find_all("tr")[2].find_all('td')[0].select("a")[0].attrs.get('href')
                    except:
                        home_team_url = None
                away = True
                players_without_url = 0
                for team_table in tables:
                    stat_rows = team_table.find_all("tr")
                    for stat_row in stat_rows:
                        columns = stat_row.find_all("td")
                        if (len(columns) > 1 and columns[0].text.strip() != "Totals"):
                            player_stats = []
                            first = True
                            for column in columns:
                                if first:
                                    stat = column.text.strip().replace('\x91', "'")
                                    try:
                                        player_url = column.select("a")[0].attrs.get('href')
                                        player_stats.append(player_url)
                                    except:
                                        players_without_url += 1
                                    first = False
                                else:
                                    stat = column.text.strip().replace('*', '').replace('-', '').replace('/', '')
                                    if stat == '':
                                        stat = '0'
                                player_stats.append(stat)
                            if away:
                                team_url = away_team_url
                                team = away_team
                                side = 'away'
                            else:
                                team_url = home_team_url
                                team = home_team
                                side = 'home'
                            writer.writerow([row['game_id'], row['game_url'], team_url, team, side] + player_stats)
                    away = False
                write_file.flush()
                print(' {} players without url'.format(players_without_url))
print("--- {} hours ---".format((time.time() - start_time) / 3600))