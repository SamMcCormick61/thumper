#include "audio_input.h"

int samplerate;

void generate_cpx_from_input(kiss_fft_cpx *in, int size, short *raw_in) {
    // raw_in = {r,i,r,i,r,i,...}
    int i;
    for(i = 0; i < size; i++) {
        in[i].r = raw_in[i*2];
        in[i].i = raw_in[i*2 + 1];
    }
}

int gen() {

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