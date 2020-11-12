 
require 'yaml'
require 'pry'

def load_library(path)
  emoticons = YAML.load_file('./lib/emoticons.yml')
 
 emoticon_lib = {}
  
  emoticons.each do |meaning, value|  
    
    emoticon_lib[meaning] = {}
    emoticon_lib[meaning][:english] = value[0]
    emoticon_lib[meaning][:japanese] = value[1]
end 
  emoticon_lib
end 

def get_japanese_emoticon(path, emoticon)
  emoticons = load_library(path)
  emoticons.each do |meaning, value|
    if value[:english] == emoticon
      return value[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end


def get_english_meaning(path, emoticon)
  emoticons = load_library(path)
  emoticons.each do |meaning, value|
    puts meaning 
    if value[:japanese] == emoticon
      return meaning
    end
  end
  return "Sorry, that emoticon was not found"
end
