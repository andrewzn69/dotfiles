#!/usr/bin/python

import yaml
import requests
import os.path

#path to news script
save_path ='/home/zm/.config/polybar/scripts/news'

#path to stored key
keyfile_path = os.path.expanduser("~") + "/.config/keys.yaml"


#find sources & country codes at https://newsapi.org/sources
sources = "hacker-news,reuters"
country = ""
category = ""

# save_url saves URL so that it is possible to open the news in the browser
# the url will always be the most recent, enable if number_news = 1
save_url = False
number_news = 5

try:
    
    with open(keyfile_path, "r") as yamlfile:
      data = yaml.load(yamlfile, Loader=yaml.FullLoader)
      api_key = data[0]['polybar-news']['api_key']

    data = requests.get('https://newsapi.org/v2/top-headlines?apiKey='+api_key+'&sources='+sources+'&country='+country+'&category='+category).json()

    news_string = ""

    for x in range(number_news):
      sourceName = data['articles'][x]['source']['name']
      title = data['articles'][x]['title']
      news_string += '['+sourceName+ '] '+ title + ' '   
      
    path = os.path.join(save_path,"current_news.txt")         
    f = open(path, "w")
    f.write(news_string)
    f.close()
    
    if save_url == True:
      url = data['articles'][0]['url']
      path = os.path.join(save_path,"current_url.txt")         
      f = open(path, "w")
      f.write(url)
      f.close() 
      
      
except requests.exceptions.RequestException as e:
    print ('Something went wrong!')
    
    
    
    
    
    
    
    
    
  
    

