/*
 * push an intensity on the band's history and
 * recalculate various attributes (avg, etc)
 */
void _history_push(band_t band, scalar_t intensity);

/*
 * returns the intensity we see a beat
 * 0.0 => no beat at all
 * 1.0 => highest intensity beat
 */
scalar_t _analyze_band(band_t band);

/*
 * input a raw frequency buffer and a size
 * returns the intensity of that frequency band
 * by summing
 */
scalar_t _get_intensity(scalar_t *buf, int band_size);

void _get_frequency_amplitudes(kiss_fft_cpx *in_cpx, int in_size, scalar_t *out_real);

void _populate_bands(scalar_t *buf, int buf_size, band_t *bands, int num_bands);

/*
 * analyzes an array of bands and maps the outputs
 */
void _analyze(band_t *bands, int num_bands,  scalar_t *out);

band_t *_alloc_bands(int num_bands, int history_size);
void _dealloc_bands(band_t *bands, int num_bands);

