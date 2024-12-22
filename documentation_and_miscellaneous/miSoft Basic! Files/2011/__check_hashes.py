import os
import re
import sys
import hashlib

# List the files with a regular expression
def listFiles(regex, subdirs = False):
	if subdirs:
		files = []
		for (dirpath, dirnames, filenames) in os.walk('.'):
			for file in filenames:
				path = os.path.join(dirpath, file)
				if path[:2] == '.\\': path = path[2:]
				if bool(re.match(regex, path)):
					files.append(path)
		return files
	else:
		return [file for file in os.listdir(os.curdir) if os.path.isfile(file) and bool(re.match(regex, file))]

def getContents(fileName):
	file = open(fileName, 'r')
	data = file.read()
	file.close()
	return data

def getFileHash(fileName):
	return hashlib.sha256(getContents(fileName).encode('utf-8')).hexdigest()

dictionary = {}
files = listFiles('.*\.txt', False)
for file in files:
	dictionary[file] = getFileHash(file)

dictionary = dict(sorted(dictionary.items(), key=lambda item: item[1]))

for file in dictionary:
	print(dictionary[file], file)