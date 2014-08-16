#include "audio_input.h"

#include <sndfile.h>

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
    if (argc < 2) {
        printf("usage: generator <file_path> ...");
        return 1;
    }
    int i;
    for (i = 1; i < argc; i++) {
        gen(argv[i]);
    }
    return 0;
}

int gen(char *path) {
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
    scalar_t history[BANDS][HISTORY_SIZE];
    memset(history, 1, sizeof(scalar_t) * BANDS * HISTORY_SIZE);

    //kiss_fft_cfg cfg = kiss_fft_alloc(CHUNK, 0, NULL, NULL);
    kiss_fft_cpx in[CHUNK];
    kiss_fft_cpx out[CHUNK];
    scalar_t out_real[CHUNK];

    short raw_in[CHUNK * 2];
    kiss_fft_cfg cfg = kiss_fft_alloc(CHUNK, 0, NULL, NULL);
    sf_count_t count;
    while((count = sf_readf_short(infile, raw_in, CHUNK)) == CHUNK) {
        generate_cpx_from_input(in, CHUNK, raw_in, CHUNK*2);
    }
    kiss_fft_free(cfg);

    sf_close(infile);
    return 0;
}


int audio_read(kiss_fft_cpx *buf, int len){
    int i;
    for(i = 0; i < len; i++){
        buf[i].i = 0;
        buf[i].r = 0;
    }
    return len;
}