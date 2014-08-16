#include "kiss_fft.h"
#define CHUNK 1024
#define BANDS 32
#define HISTORY_SIZE 43
#define C 10

typedef kiss_fft_scalar scalar_t;

int audio_read(kiss_fft_cpx *buf, int len);

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
