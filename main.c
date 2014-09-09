#define BUFFER_SIZE 1024
#define READING 0x1
#define WRITING 0x2


int *audio = NULL;
kiss_fft_cpx *cpx_audio = NULL;
geninfo_t *geninfo = NULL;

int buf_cursor = 0;
int pin = 3;

char state = 0;

void setup() {
	audio = malloc(sizeof(int) * BUFFER_SIZE);
	out_audio = malloc(sizeof(int) * BUFFER_SIZE);

	geninfo = setup_gen(32, 43, BUFFER_SIZE);
}

int feed_buffer(int incomingAudio) {
	audio[buf_cursor] = incomingAudio;
	buf_cursor++;
	if (buf_cursor >= BUFFER_SIZE) {
		buf_cursor = 0;
		return 1;
	}
	return 0;
}

void loop() {
	if (feed_buffer(analogRead(pin))) {
		int i;
		for (i = 0; i < BUFFER_SIZE; i++) {
			cpx_audio[i].r = audio[i];
			cpx_audio[i].i = 0; // mono
		}

		generate(geninfo, cpx_audio, BUFFER_SIZE);
	}
	light_show(geninfo.output, geninfo.num_bands);
}

void light_show(scalar_t *bands, int num_bands) {
	scalar_t max = 0;
	int max_bin = 0;
	int i;
	for (i = 0; i < num_bands; i++){
		if (bands[i] > max) {
			max = bands[i];
			max_bin = i;
		}
	}

	if (max > 0) {
		set_color(color_bw(max_bin, num_bands));
	}
}

int to_hex(char r, char g, char b) {
	return (r << 16) | (g << 8) | b;
}

// input hex color in the fofm 0xRRGGBB
void set_color(int hex) {
	char r = ((hex >> 16) & 0xff);
	char g = ((hex >> 8)) & 0xff);
	char b = hex & 0xff;

	analogWrite(REDPIN, r);
	analogWrite(GREENPIN, g);
	analogWrite(BLUEPIN, b);
}

int color_bw(int freq_bin, int num_bands) {
	// go from 50,50,50 to 255,255,255
	int multiple = 200 / num_bands;
	int v = 50 + multiple * freq_bin;
	return to_hex(v,v,v);
}

