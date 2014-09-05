#define BUFFER_SIZE 1024
#define READING 0x1
#define WRITING 0x2

int *audio = NULL;
int *out_audio = NULL;
int count = 0;
int pin = 3;

char state = 0;

void setup() {
	audio = malloc(sizeof(int) * BUFFER_SIZE);
	out_audio = malloc(sizeof(int) * BUFFER_SIZE);
}

int generate_signal(int incomingAudio) {
	audio[count] = incomingAudio;
	count++;
	if (count >= BUFFER_SIZE) {
		count = 0;
		return 1;
	}
	return 0;
}

void loop() {
	if (generate_signal(analogRead(pin))) {

		memcpy(out_audio, audio, sizeof(int) * BUFFER_SIZE);
		output(out_audio);
	}
}

void output(int *out_audio) {

}