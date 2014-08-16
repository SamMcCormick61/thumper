#include "generator.h"
#include "_generator.h"
#include <stdio.h>
#include <assert.h>
#include <math.h>

geninfo_t *setup(int num_bands, int history_size, int chunk){
    geninfo_t *inf = (geninfo_t *)malloc(sizeof(geninfo_t));

    inf->num_bands = num_bands;
    inf->bands = (band_t *)_alloc_bands(num_bands, history_size);
    inf->chunk = chunk;
    inf->chunk_num = 0;
    inf->cfg = kiss_fft_alloc(chunk, 0, NULL, NULL);

    inf->fft_output = malloc(sizeof(kiss_fft_cpx)*chunk);
    inf->real_fft_output = malloc(sizeof(scalar_t)*chunk);

    // true output of generate()
    inf->output = malloc(sizeof(scalar_t)*num_bands);

    return inf;
}

void tear_down(geninfo_t *ginfo){
    _dealloc_bands(ginfo->bands, ginfo->num_bands);
    kiss_fft_free(ginfo->cfg);
    free(ginfo);
}

void generate(geninfo_t *inf, kiss_fft_cpx *input, int len){
    // TODO after debugging: if len < inf->chunk just pad input w/ zeros
    assert(len == inf->chunk);

    kiss_fft(inf->cfg, input, inf->fft_output);

    _get_frequency_amplitudes(inf->fft_output, len, inf->real_fft_output);

    _populate_bands(inf->real_fft_output, len, inf->bands, inf->num_bands);

    _analyze(inf->bands, inf->num_bands, inf->output);

    inf->chunk_num++;
}

band_t *_alloc_bands(int num_bands, int history_size){
    int i;
    band_t *bands = malloc(sizeof(band_t) * num_bands);
    for(i = 0; i < num_bands; i++){
        scalar_t *history = malloc(sizeof(scalar_t) * history_size);
        band_t b = {
            history,
            history_size,
            0.0,
            0.0,
            0.0,
            0
        };
        memcpy(bands + i, &b, sizeof(band_t));
    }
}

void _dealloc_bands(band_t *bands, int num_bands){
    int i;
    for(i = 0; i < num_bands; i++){
        free(bands[i].history);
    }
    free(bands);
}

void _history_push(band_t band, scalar_t intensity){
    // increment the cursor first so band.history[band.cursor] is always the most recent
    band.cursor++;
    if(band.cursor >= band.hsize) band.cursor = 0;

    band.history[band.cursor] = intensity;
    scalar_t total = 0.0;
    int i;
    for(i = 0; i < band.hsize; i++){
        total += band.history[i];
    }
    band.avg = total / (float)band.hsize;

    scalar_t var = 0.0;
    for (i = 0; i < band.hsize; i++){
        scalar_t s = band.history[i] - band.avg;
        var = var + (s * s);
    }
    var = var / (float)band.hsize;
    band.std = sqrt(var);
}


scalar_t _analyze_band(band_t band){
    scalar_t cur = band.history[band.cursor];
    scalar_t avg = band.avg;
    scalar_t std = band.std;

    return cur < avg ? 0 :
               std == 0 ? 0 : (cur - avg)/std;
}

void _analyze(band_t *bands, int num_bands,  scalar_t *out){
    int i;
    for(i = 0; i < num_bands; i++){
        out[i] = _analyze_band(bands[i]);
    }
}

scalar_t _get_intensity(scalar_t *buf, int band_size){
    scalar_t total = 0.0;
    int i;
    for(i = 0; i < band_size; i++){
        total += buf[i];
    }
    return total;
}

void _populate_bands(scalar_t *buf, int buf_size, band_t *bands, int num_bands){
    assert(buf_size % num_bands == 0); // must have equal size frequency bins

    int band_size = buf_size / num_bands;

    int i;
    for(i = 0; i < num_bands; i++){
        scalar_t *bin_start = buf + (i * band_size);
        _history_push(bands[i], _get_intensity(bin_start, band_size));
    }
}

void _get_frequency_amplitudes(kiss_fft_cpx *in_cpx, int in_size, scalar_t *out_real){
    // out_size better be = in_size
    int out_size = in_size ;
    int i;
    for(i = 0; i < out_size; i++) {
        kiss_fft_cpx c = in_cpx[i];
        // square of the modulus
        out_real[i] = (c.r * c.r) + (c.i * c.i);
    }
}

