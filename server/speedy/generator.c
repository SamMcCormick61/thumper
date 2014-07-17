#include <stdio.h>
#include <sndfile.h>
#include "kiss_fft.h"

#define CHUNK 1024
#define BANDS 32
#define HISTORY_SIZE 10
#define C 20
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
    for(i = 0; i < size; i = i + 1) {
        in[i].r = raw_in[i];
        in[i].i = raw_in[i + size];
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
    printf("%10s : %lu\n", "frames", sfinfo.frames);
    printf("%10s : %d\n", "samplerate", sfinfo.samplerate);
    printf("%10s : %d\n", "channels", sfinfo.channels);
    printf("%10s : %d\n", "format", sfinfo.format);
    printf("%10s : %d\n", "sections", sfinfo.sections);
    printf("%10s : %d\n", "seekable", sfinfo.seekable);
    samplerate = sfinfo.samplerate;
    int history[BANDS][HISTORY_SIZE];
    int i;
    for(i = 0; i < BANDS; i++) {
        int j;
        for(j = 0; j < HISTORY_SIZE; j++) {
            history[i][j] = 0;
        }
    }

    kiss_fft_cfg cfg = kiss_fft_alloc(CHUNK, 0, NULL, NULL);
    kiss_fft_cpx in[CHUNK];
    kiss_fft_cpx out[CHUNK];
    kiss_fft_scalar out_real[CHUNK];

    short raw_in[CHUNK * 2];

    sf_count_t count;
    while((count = sf_readf_short(infile, raw_in, CHUNK)) == CHUNK) {
        generate_cpx_from_input(in, CHUNK, raw_in, CHUNK*2);
        analyze_chunk(&cfg, in, CHUNK, out, out_real, history);
    }

    sf_close(infile);
    return 0;
}

int
remember(int band_num,
         kiss_fft_scalar *out_real,
         int out_size,
         kiss_fft_scalar history[BANDS][HISTORY_SIZE])
{
    int band_size = out_size / BANDS;
    int start = band_num * band_size;
    kiss_fft_scalar energy = 0;
    int i;
    for(i = start; i < start+band_size; i++) {
        energy = energy + out_real[i];
    }
    // energy = (energy * BANDS) / out_size;


    kiss_fft_scalar avg = 0;
    for (i = 0; i < HISTORY_SIZE; i++){
        avg = avg + history[band_num][i];
    }
    avg = avg / (HISTORY_SIZE);

    //printf("energy: %f avg: %f\n", energy, avg);;
    int BEAT = energy > C * avg ? 1 : 0;

    // now place this energy in our history
    int index = (chunk_num % (HISTORY_SIZE));
    // (30 % 31) + 1 = 31
    // (31 % 31) + 1 = 1
    // (32 % 31) + 1 = 2
    history[band_num][index] = energy;

    return BEAT;
}

int analyze_chunk(kiss_fft_cfg *cfg, // will always be same dimensions
                  kiss_fft_cpx *in,
                  int in_size,
                  kiss_fft_cpx *out,
                  kiss_fft_scalar *out_real,
                  kiss_fft_scalar history[BANDS][HISTORY_SIZE])
{
    kiss_fft(*cfg, in, out);

    int i;
    for(i = 0; i < in_size; i++) {
        kiss_fft_cpx c = out[i];
        // square of the modulus
        out_real[i] = (c.r * c.r) + (c.i * c.i);
    }

    char BEATS[BANDS+1];
    memset(BEATS, '\0', BANDS+1);

    int band_size = in_size / BANDS;
    for(i = 0; i < BANDS; i++) {
        int BEAT = remember(i, out_real, in_size, history);
        BEATS[i] = BEAT ? '|' : ' ';
    }

    int s = 0;
    for(i = 0; i < BANDS; i++) s += BEATS[i] == '|' ? 1 : 0;

    if (s > 0) {
        float t = (float)(CHUNK * chunk_num) / samplerate;
        int s = (int)t / 60;
        t = t - 60*s;
        printf("%d:%05.2f : %s",s, t, BEATS);
        printf("\n");
    }
    chunk_num++;
}

