import wave
import numpy
import struct
import config
from subprocess import PIPE, Popen
import json
import sys
# LLRRLLRRLLRRLLRRLLRRLL
C = 200

def instant_energy(window):
	f = lambda rest, x: rest + x**2
	return reduce(f, window)

class FrequencyBandAggregate(object):
	def __init__(self, history_size=32):
		self.history = [0. for i in xrange(history_size)]
		self.avg = 0.

	def sample(self, energy):
		self.history.pop()
		self.history.append(energy)
		self.avg = numpy.average(self.history)
		return self.avg

class Generator(object):
	def __init__(self, file_path):
		"""input a wave_read object"""
		self.wave = f = wave.open(file_path, 'r')
		self.frame_rate = f.getframerate()
		self.total_frames = f.getnframes()
		self.sample_width = f.getsampwidth()
		self.channels = f.getnchannels()

		self.chunk = 1024
		self.num_bands = 32
		self.beats = [[] for i in xrange(self.total_frames / self.chunk)]
		self.pos = 0
		self.bands = [FrequencyBandAggregate(32) for i in xrange(self.num_bands)]

	def read_all(self):
		for i in xrange(self.total_frames / self.chunk):
			self.read()
		print self.beats
	def read(self):
		data = self.wave.readframes(self.chunk)
		window = struct.unpack('h'*(self.chunk*self.channels), data)
		if self.channels == 2:
			cw = map(lambda x,y: (x+y*1j), window[::2], window[1::2])

		freqs = numpy.fft.fft(cw)
		band_size = self.chunk / self.num_bands

		beat = []
		for i in xrange(self.chunk / band_size):
			e = 0
			for j in xrange(band_size):
				c = cw[i*band_size + j]
				e += c.real**2 + c.imag**2

			avg = self.bands[i].sample(e)
			beat.append(e / avg)
		for b in beat:
			if b > C:
				self.beats.append(beats)
		# separate the frequencies into subbands
		self.pos += 1
		#print self.pos, self.total_frames / self.chunk
	def close(self):
		self.wave.close()


def make_led(out, name, led_dir, use_c=True):
	print "generatoring %s!" %name
	led_file_path = "%s/%s.LED" %(led_dir, name)
	if use_c:
		gen_exec = config.SERVER_PATH + "/speedy/generator"
		p = Popen([gen_exec, out], stdin=PIPE, stdout=PIPE)
		stdout,stderr = p.communicate()
		times = stdout.split('\n')

		def parse_line(line):
			t, rest = line.split(':')
			return {
				'time' : float(t),
				'freq_mag' : [float(f) for f in rest.split()]
			}
		parsed_times = [parse_line(l) for l in times if l]
	else:
		g = Generator(out)
		g.read_all()

	with open(led_file_path, 'w') as f:
		s = json.dumps(parsed_times, indent=2)
		#print s
		f.write(s)





if __name__ == "__main__":
	outs = sys.argv[1:]
	for out in outs:
		name = ".".join(out.split('/')[-1].split('.')[:-1])
		out_led = config.LED_DIRECTORY
		make_led(out, name, out_led)