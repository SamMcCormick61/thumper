#include "kiss_fft.h"
#include "audio_input.h"

typedef struct {
	scalar_t *history;
	int hsize;
	scalar_t avg;
	scalar_t std;
	scalar_t tpb; // time slices per beat (avg)
	int cursor;
} band_t;

typedef struct {
	band_t *bands;
	int num_bands;
	int chunk;
	int chunk_num;
	kiss_fft_cfg cfg;
	kiss_fft_cpx *fft_output;
	scalar_t *real_fft_output;
	scalar_t *output;
} geninfo_t;


/*
PUBLIC API
call setup once to get a handle on a geninfo_t, pass that into generate alongside a buffer
representing the next chunk frames of the audio (complex signal)
when you're done, just call tear_down
*/

geninfo_t *setup(int num_bands, int history_size, int chunk);

void tear_down(geninfo_t *ginfo);

void generate(geninfo_t *inf, kiss_fft_cpx *input, int len);
