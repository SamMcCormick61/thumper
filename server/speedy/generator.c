#include <stdio.h>
#include <assert.h>
#include <sndfile.h>
#include "kiss_fft.h"

#define CHUNK 1024
#define BANDS 32
#define HISTORY_SIZE 10
#define C 6
#define D 7
/*
      typedef struct
      {    sf_count_t  frames ;
           int         samplerate ;
           int         channels ;
           int         format ;
           int         sections ;
           int         seekable ;
       } SF_INFO ;
*/
int chunk_num = 0;
int samplerate;

void generate_cpx_from_input(kiss_fft_cpx *in, int size, short *raw_in, int raw_size) {
    // raw_in = {r,i,r,i,r,i,...}
    int i;
    for(i = 0; i < size; i++) {
        in[i].r = raw_in[i*2];
        in[i].i = raw_in[i*2 + 1];
    }
}

int main(int argc, char **argv) {
    if (argc != 2) {
        printf("usage: generator <file_path>");
        return 1;
    }
    char *path = argv[1];

    SNDFILE *infile;
    SF_INFO sfinfo;
    infile = sf_open(path, SFM_READ, &sfinfo);
    /*
    printf("%10s : %lu\n", "frames", sfinfo.frames);
    printf("%10s : %d\n", "samplerate", sfinfo.samplerate);
    printf("%10s : %d\n", "channels", sfinfo.channels);
    printf("%10s : %d\n", "format", sfinfo.format);
    printf("%10s : %d\n", "sections", sfinfo.sections);
    printf("%10s : %d\n", "seekable", sfinfo.seekable);
    */
    samplerate = sfinfo.samplerate;
    kiss_fft_scalar history[BANDS][HISTORY_SIZE];
    memset(history, 0, sizeof(kiss_fft_scalar) * BANDS * HISTORY_SIZE);

    //kiss_fft_cfg cfg = kiss_fft_alloc(CHUNK, 0, NULL, NULL);
    kiss_fft_cpx in[CHUNK];
    kiss_fft_cpx out[CHUNK];
    kiss_fft_scalar out_real[CHUNK];

    short raw_in[CHUNK * 2];

    sf_count_t count;
    while((count = sf_readf_short(infile, raw_in, CHUNK)) == CHUNK) {
        generate_cpx_from_input(in, CHUNK, raw_in, CHUNK*2);
        analyze_chunk(in, CHUNK, out, out_real, history);
    }

    sf_close(infile);
    return 0;
}

kiss_fft_scalar
remember(int band_num,
         kiss_fft_scalar *out_real,
         int out_size,
         kiss_fft_scalar history[BANDS][HISTORY_SIZE])
{
    int band_size = CHUNK / BANDS;
    assert(band_size == 32);

    int start = band_num * band_size;
    kiss_fft_scalar energy = 0;
    int i;
    for(i = start; i < start+band_size; i++) {
        energy += (float)out_real[i];
    }

    kiss_fft_scalar avg = 0;
    for (i = 0; i < HISTORY_SIZE; i++){
        avg = avg + history[band_num][i];
    }
    avg = avg / (float)(HISTORY_SIZE);

    int index = (chunk_num % (HISTORY_SIZE));
    history[band_num][index] = energy;

    return avg ? energy / avg : 0;
}

int analyze_chunk(kiss_fft_cpx *in,
                  int in_size,
                  kiss_fft_cpx *out,
                  kiss_fft_scalar *out_real,
                  kiss_fft_scalar history[BANDS][HISTORY_SIZE])
{
    kiss_fft_cfg ccfg = kiss_fft_alloc(CHUNK, 0, NULL, NULL);
    assert(in_size == CHUNK);
    kiss_fft(ccfg, in, out);

    int i;
    for(i = 0; i < in_size; i++) {
        kiss_fft_cpx c = out[i];
        // square of the modulus
        out_real[i] = (c.r * c.r) + (c.i * c.i);
    }
    printf("\n");
    kiss_fft_free(ccfg);

    kiss_fft_scalar BEATS[BANDS];
    memset(BEATS, 0, BANDS);

    float t = (float)(CHUNK * chunk_num) / samplerate;

    int band_size = in_size / BANDS;

    int logit = 0;
    int band;
    for(band = 0; band < BANDS; band++) {
        kiss_fft_scalar BEAT = remember(band, out_real, in_size, history);

        BEATS[band] = BEAT;
        if (BEAT > C) logit = 1;
    }
    if (logit == 1) {
        printf("%05.2f:", t);
        for(i = 0; i < BANDS; i++) {
            printf("%.2f ", BEATS[i]);
        }
        printf("\n");
    }

    chunk_num++;
}

