from bs4 import BeautifulSoup
import csv
import time
import os
from urllib.request import Request, urlopen

class Utils:
    def getAllSportCodes():
        sport_code_file_name = 'ncaa_sport_codes.csv'
        sport_code_file = open(sport_code_file_name, 'r')
        sport_codes = []
        with sport_code_file:
            reader = csv.reader(sport_code_file)
            for row in reader:
                sport_codes.append(row)
        return sport_codes

    def getAllYears():
        return [2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019]

    def getPage(url, sleepTime):
        time.sleep(sleepTime)
        req = Request(url, headers={'User-Agent': 'Mozilla/5.0'})
        try_limit = 10
        for tries in range(0, try_limit):
            try:
                page = urlopen(req)
                return BeautifulSoup(page, 'html.parser')
            except:
                print('Failed to connect to {} trying again. {} try.'.format(url, tries))
        return None

    def createDirectory(type, year):
        path = '{}/{}'.format(type, year)
        if not os.path.exists(path):
            try:
                os.makedirs(path)
            except:
                print('Failed to create directory {}', path)

    def getFileName(type, year, division, sport):
        return '{}/{}/{}_{}_{}_division_{}.csv'.format(type, year, sport[1], type, year, division)