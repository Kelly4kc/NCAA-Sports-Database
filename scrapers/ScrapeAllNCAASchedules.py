from bs4 import BeautifulSoup
import csv
import os
from Utils import Utils

years = Utils.getAllYears()
years = None
divisions = range(1, 3)
sport_codes = Utils.getAllSportCodes()
sport_codes = None

for year in years:
    for sport in sport_codes:
        division = 1
        if sport[0] == 'MFB' and division == 1:
            division = 11
            continue
        game_ids = set()
        print('Scraping {} schedules from {} in division {}'.format(sport[1], year[0], division))
        if not os.path.exists('schedules/{}'.format(year[0])):
            try:
                os.makedirs('schedules/{}'.format(year[0]))
            except:
                print('Failed to create directory schedules/{}', year[0])
        filename = 'teams/{}/{}_teams_{}_division_{}.csv'.format(year[0], sport[1], year[0], division)
        team_file = open(filename, 'r')
        write_file_name = 'schedules/{}/{}_schedules_{}_division_{}.csv'.format(year[0], sport[1], year[0], division)
        write_file = open(write_file_name, 'w', newline='')
        with team_file and write_file:
            reader = csv.DictReader(team_file)
            writer = csv.writer(write_file)
            writer.writerow(['game_id', 'game_url', 'date', 'team_url', 'team_name', 'opponent_url', 'opponent_name', 'location', 'overtime', 'team_score', 'opponent_score'])
            for row in reader:
                team_url = row['team_url']
                team_name = row['team_name']
                print('\t{}...'.format(team_name), end='')
                url = 'https://stats.ncaa.org' + team_url
                page = Utils.getPage(url, 0.1)
                schedule = page.find_all('table')[0].find_all('table')[0]
                schedule_rows = schedule.find_all('tr')
                games = 0
                games_without_id = 0
                unfinished_games = 0
                for i in range(2, len(schedule_rows)):
                    row_data = schedule_rows[i].find_all('td')
                    date = row_data[0].text.strip()
                    try:
                        opponent_href = row_data[1].contents[1].attrs.get('href')
                        opponent_url = opponent_href
                    except:
                        opponent_url = None
                    if len(row_data) == 3:
                        if len(row_data[2].contents) >=2:
                            game_url = row_data[2].contents[1].attrs.get('href')
                            game_id = game_url[12:game_url.rindex('?')]
                            if game_id in game_ids:
                                continue
                            game_ids.add(game_id)
                        else:
                            games_without_id += 1
                            game_id = None
                            game_url = None
                    else:
                        #for row in row_data:
                            #print(row.text)
                        continue
                    opponent_info = row_data[1].text.strip()
                    if '@' in opponent_info:
                        location = opponent_info[opponent_info.index('@') + 2:]
                        if opponent_info .index('@') != 0:
                            opponent_name = opponent_info[:opponent_info.rindex('@') - 1]
                        else:
                            opponent_name = opponent_info[2:]
                    else:
                        opponent_name = opponent_info
                        location = opponent_info
                    score_string = row_data[2].text.strip()
                    game_result = score_string[0]
                    if '(' in score_string:
                        overtime = score_string[score_string.index('(') + 1:score_string.rindex(')')]
                        score = score_string[2:score_string.index('(') - 1]
                    else:
                        overtime = None
                        score = score_string[2:]
                    games += 1
                    if game_result != '-':
                        team_score = score[:score.index('-') - 1]
                        opponent_score = score[score.index('-') + 2:]
                    else:
                        team_score = None
                        opponent_score = None
                        unfinished_games += 1
                    writer.writerow([game_id, game_url, date, team_url, team_name, opponent_url, opponent_name, location, overtime, team_score, opponent_score])
                write_file.flush()
                print('{} games found. '.format(games), end='')
                print('{} games without id '.format(games_without_id), end='')
                print('{} games unfinished'.format(unfinished_games))