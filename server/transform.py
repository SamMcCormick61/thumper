from multiprocessing import Pool
import config
import subprocess
import os
from pydub import AudioSegment
import wave

def convert(inp, name, out_dir):
	song = AudioSegment.from_mp3(inp)

	out = "%s/%s.wav" % (out_dir, name)

	song.export(out, format="wav")


class Transformer(object):

	def __init__(self):
		self.progress = {}
		self.pool = Pool(processes=None) #use cpu count

	def finished(self):
		files = []
		for dirpath, dirnames, filenames in os.walk(config.MUSIC_DIRECTORY):
			files.extend(filenames)
		return files

	def get_progress(self):
		done = self.finished()
		working = []
		errored = []
		for name, aresult in self.progress.items():
			if aresult.ready():
				if aresult.successful():
					#done.append(name)
					pass
				else:
					errored.append(name)
			else:
				working.append(name)
		return (sorted(s) for s in (done, working, errored))

	def start(self, f, name, out):
		if name in self.progress:
			return "already have this song"
		else:

			tmp = "%s/%s" % (config.TMP_DIRECTORY, name)
			f.save(tmp)
			name = "".join(name.split(".")[:-1])
			aresult = self.pool.apply_async(convert, (tmp, name, out))
			self.progress[name] = aresult


transformer = Transformer()

def start(f, name):
	return transformer.start(f, name, config.MUSIC_DIRECTORY)

def progress():
	return transformer.get_progress()

