# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "main.h" 1
# 1 "mylib.h" 1



typedef unsigned short u16;
# 42 "mylib.h"
extern unsigned short *videoBuffer;

extern unsigned short *frontBuffer;
extern unsigned short *backBuffer;



void loadPalette(const unsigned short* palette);

void waitForVblank();
void initialize();




void setPixel3(int row, int col, unsigned short color);
void drawRect3(int row, int col, int height, int width, unsigned short color);
void fillScreen3(unsigned short color);
void drawImage3(const unsigned short* image, int row, int col, int height, int width);


void setPixel4(int row, int col, unsigned char colorIndex);
void drawRect4(int row, int col, int height, int width, unsigned char colorIndex);
void fillScreen4(unsigned char color);

void drawBackgroundImage4(const unsigned short* image);
void drawImage4(const unsigned short* image, int row, int col, int height, int width);
void drawSubImage4(const unsigned short* sourceImage, int sourceRow, int sourceCol, int sourceWidth,
       int row, int col, int height, int width);

void loadPalette(const unsigned short* palette);

void flipPage();
# 95 "mylib.h"
extern unsigned int oldButtons;
extern unsigned int buttons;
# 105 "mylib.h"
void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control);






typedef volatile struct
{
        volatile const void *src;
        volatile const void *dst;
        volatile unsigned int cnt;
} DMA;

extern DMA *dma;
# 234 "mylib.h"
typedef struct { u16 tileimg[8192]; } charblock;
typedef struct { u16 tilemap[1024]; } screenblock;
# 322 "mylib.h"
typedef struct{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
}OBJ_ATTR;
# 2 "main.h" 2
# 1 "game.h" 1
void initLevel1();
void initLevel2();
void updatePosition();
void updateScreenLocations();
void animateLuigi();
void updateOAM();
void animateBoo();
void animateLoo();
void animateHoo();
void updateGhost();
void updateGhost1();
void updateGhost2();
void updateFlashLight();
void updateBattery();
void collision();
void cheat();
void timer();

extern int numberOfGhosts;
# 3 "main.h" 2
# 1 "opening.h" 1
# 20 "opening.h"
extern const unsigned char opening[970105];
# 4 "main.h" 2

void goToSplash();
void updateSplash();
void goToInstruction();
void updateInstruction();
void goToLevel1();
void updateLevel1();
void goToLevel2();
void updateLevel2();
void goToPause();
void updatePause();
void goToLose();
void updateLose();
void goToWin();
void updateWin();

void hideSprites();

void setupSounds();
void playSoundA(const unsigned char* sound, int length, int frequency, int loops);
void playSoundB(const unsigned char* sound, int length, int frequency, int loops);
void pauseSound();
void unpauseSound();
void stopSound();

void setupInterrupts();
void interruptHandler();

typedef struct {
 int height;
 int width;
 int screenRow;
 int screenCol;
 int worldRow;
 int worldCol;
 int rdel;
 int cdel;
 int racc;
 int cacc;
 int maxHSpeed;
 int maxVSpeed;
 int stopRange;
 int aniCounter;
 int aniState;
 int prevAniState;
    int currFrame;
    int flash;
    int active;
    int direction;
    int cheat;
} PLAYER;

typedef struct {
 int height;
 int width;
 int screenRow;
 int screenCol;
 int worldRow;
 int worldCol;
 int rdel;
 int cdel;
 int racc;
 int cacc;
 int maxHSpeed;
 int maxVSpeed;
 int aniCounter;
 int aniState;
 unsigned short flip;
 unsigned short attr0;
    int currFrame;
    int active;
    int spawn;
} GHOST;

typedef struct {
 int height;
 int width;
 int screenRow;
 int screenCol;
 int worldRow;
 int worldCol;
 int active;
} BATTERY;


typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vbCount;
} SOUND;

extern OBJ_ATTR shadowOAM[128];
extern int vOff;
extern int hOff;
extern PLAYER luigi;
extern SOUND soundA;
extern SOUND soundB;
# 2 "game.c" 2
# 1 "myLib.h" 1
# 3 "game.c" 2
# 1 "game.h" 1
void initLevel1();
void initLevel2();
void updatePosition();
void updateScreenLocations();
void animateLuigi();
void updateOAM();
void animateBoo();
void animateLoo();
void animateHoo();
void updateGhost();
void updateGhost1();
void updateGhost2();
void updateFlashLight();
void updateBattery();
void collision();
void cheat();
void timer();

extern int numberOfGhosts;
# 4 "game.c" 2
# 1 "splash.h" 1
# 22 "splash.h"
extern const unsigned short splashTiles[32768];


extern const unsigned short splashMap[1024];


extern const unsigned short splashPal[256];
# 5 "game.c" 2
# 1 "luigi.h" 1
# 21 "luigi.h"
extern const unsigned short luigiTiles[16384];


extern const unsigned short luigiPal[256];
# 6 "game.c" 2
# 1 "bg1.h" 1
# 22 "bg1.h"
extern const unsigned short bg1Tiles[304];


extern const unsigned short bg1Map[2048];


extern const unsigned short bg1Pal[256];
# 7 "game.c" 2
# 1 "widgets.h" 1
# 22 "widgets.h"
extern const unsigned short widgetsTiles[16384];


extern const unsigned short widgetsMap[1024];


extern const unsigned short widgetsPal[256];
# 8 "game.c" 2
# 1 "jump.h" 1
# 20 "jump.h"
extern const unsigned char jump[6506];
# 9 "game.c" 2
# 1 "goodnight.h" 1
# 22 "goodnight.h"
extern const unsigned short goodnightTiles[15008];


extern const unsigned short goodnightMap[1024];


extern const unsigned short goodnightPal[256];
# 10 "game.c" 2
# 1 "win.h" 1
# 22 "win.h"
extern const unsigned short winTiles[10496];


extern const unsigned short winMap[1024];


extern const unsigned short winPal[256];
# 11 "game.c" 2
# 1 "/opt/devkitARM/arm-none-eabi/include/stdlib.h" 1 3
# 10 "/opt/devkitARM/arm-none-eabi/include/stdlib.h" 3
# 1 "/opt/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 11 "/opt/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 15 "/opt/devkitARM/arm-none-eabi/include/_ansi.h" 3
# 1 "/opt/devkitARM/arm-none-eabi/include/newlib.h" 1 3
# 16 "/opt/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 1 "/opt/devkitARM/arm-none-eabi/include/sys/config.h" 1 3



# 1 "/opt/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 5 "/opt/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 1 "/opt/devkitARM/arm-none-eabi/include/sys/features.h" 1 3
# 6 "/opt/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 17 "/opt/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 12 "/opt/devkitARM/arm-none-eabi/include/stdlib.h" 2 3




# 1 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 1 3 4
# 216 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 3 4

# 216 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 328 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 17 "/opt/devkitARM/arm-none-eabi/include/stdlib.h" 2 3

# 1 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 1 3
# 13 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 3
# 1 "/opt/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 14 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 1 3 4
# 149 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 15 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitARM/arm-none-eabi/include/sys/_types.h" 1 3
# 12 "/opt/devkitARM/arm-none-eabi/include/sys/_types.h" 3
# 1 "/opt/devkitARM/arm-none-eabi/include/machine/_types.h" 1 3






# 1 "/opt/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3
# 27 "/opt/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 41 "/opt/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 63 "/opt/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 89 "/opt/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 120 "/opt/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 146 "/opt/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 168 "/opt/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 186 "/opt/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 200 "/opt/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 8 "/opt/devkitARM/arm-none-eabi/include/machine/_types.h" 2 3
# 13 "/opt/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3
# 1 "/opt/devkitARM/arm-none-eabi/include/sys/lock.h" 1 3




# 1 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stdint.h" 3 4
# 1 "/opt/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 13 "/opt/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 14 "/opt/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int8_t int8_t ;
typedef __uint8_t uint8_t ;




typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int16_t int16_t ;
typedef __uint16_t uint16_t ;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int32_t int32_t ;
typedef __uint32_t uint32_t ;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int64_t int64_t ;
typedef __uint64_t uint64_t ;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 74 "/opt/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 84 "/opt/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 94 "/opt/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 104 "/opt/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 153 "/opt/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int intmax_t;
# 162 "/opt/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long unsigned int uintmax_t;






typedef __intptr_t intptr_t;
typedef __uintptr_t uintptr_t;
# 10 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stdint.h" 2 3 4
# 6 "/opt/devkitARM/arm-none-eabi/include/sys/lock.h" 2 3

typedef int32_t _LOCK_T;

struct __lock_t {
 _LOCK_T lock;
 uint32_t thread_tag;
 uint32_t counter;
};

typedef struct __lock_t _LOCK_RECURSIVE_T;

extern void __libc_lock_init(_LOCK_T *lock);
extern void __libc_lock_init_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_close(_LOCK_T *lock);
extern void __libc_lock_close_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_acquire(_LOCK_T *lock);
extern void __libc_lock_acquire_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_release(_LOCK_T *lock);
extern void __libc_lock_release_recursive(_LOCK_RECURSIVE_T *lock);


extern int __libc_lock_try_acquire(_LOCK_T *lock);
extern int __libc_lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock);
# 14 "/opt/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3


typedef long _off_t;



typedef int __dev_t;



typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



__extension__ typedef long long _off64_t;







typedef long _fpos_t;
# 55 "/opt/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef signed int _ssize_t;
# 67 "/opt/devkitARM/arm-none-eabi/include/sys/_types.h" 3
# 1 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 1 3 4
# 357 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 68 "/opt/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;




typedef void *_iconv_t;
# 16 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3






typedef unsigned long __ULong;
# 38 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 91 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 115 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 179 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (* _read) (struct _reent *, void *, char *, int)
                                          ;
  int (* _write) (struct _reent *, void *, const char *, int)

                                   ;
  _fpos_t (* _seek) (struct _reent *, void *, _fpos_t, int);
  int (* _close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 285 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 317 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 569 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];

  int _current_category;
  const char *_current_locale;

  int __sdidinit;

  void (* __cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;



  struct _atexit *_atexit;
  struct _atexit _atexit0;



  void (**(_sig_func))(int);




  struct _glue __sglue;
  __FILE __sf[3];
};
# 762 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);





  struct _reent * __getreent (void);
# 19 "/opt/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitARM/arm-none-eabi/include/sys/cdefs.h" 1 3
# 45 "/opt/devkitARM/arm-none-eabi/include/sys/cdefs.h" 3
# 1 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 1 3 4
# 46 "/opt/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3
# 20 "/opt/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitARM/arm-none-eabi/include/machine/stdlib.h" 1 3
# 21 "/opt/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 29 "/opt/devkitARM/arm-none-eabi/include/stdlib.h" 3


typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;




typedef struct
{
  long long int quot;
  long long int rem;
} lldiv_t;




typedef int (*__compar_fn_t) (const void *, const void *);







int __locale_mb_cur_max (void);



void abort (void) __attribute__ ((__noreturn__));
int abs (int);
int atexit (void (*__func)(void));
double atof (const char *__nptr);



int atoi (const char *__nptr);
int _atoi_r (struct _reent *, const char *__nptr);
long atol (const char *__nptr);
long _atol_r (struct _reent *, const char *__nptr);
void * bsearch (const void * __key, const void * __base, size_t __nmemb, size_t __size, __compar_fn_t _compar)



                                ;
void * calloc (size_t __nmemb, size_t __size) ;
div_t div (int __numer, int __denom);
void exit (int __status) __attribute__ ((__noreturn__));
void free (void *) ;
char * getenv (const char *__string);
char * _getenv_r (struct _reent *, const char *__string);
char * _findenv (const char *, int *);
char * _findenv_r (struct _reent *, const char *, int *);




long labs (long);
ldiv_t ldiv (long __numer, long __denom);
void * malloc (size_t __size) ;
int mblen (const char *, size_t);
int _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int mbtowc (wchar_t *restrict, const char *restrict, size_t);
int _mbtowc_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
int wctomb (char *, wchar_t);
int _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t mbstowcs (wchar_t *restrict, const char *restrict, size_t);
size_t _mbstowcs_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
size_t wcstombs (char *restrict, const wchar_t *restrict, size_t);
size_t _wcstombs_r (struct _reent *, char *restrict, const wchar_t *restrict, size_t, _mbstate_t *);
# 124 "/opt/devkitARM/arm-none-eabi/include/stdlib.h" 3
void qsort (void * __base, size_t __nmemb, size_t __size, __compar_fn_t _compar);
int rand (void);
void * realloc (void * __r, size_t __size) ;




void srand (unsigned __seed);
double strtod (const char *restrict __n, char **restrict __end_PTR);
double _strtod_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR);



float strtof (const char *restrict __n, char **restrict __end_PTR);







long strtol (const char *restrict __n, char **restrict __end_PTR, int __base);
long _strtol_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long strtoul (const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long _strtoul_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);

int system (const char *__string);
# 161 "/opt/devkitARM/arm-none-eabi/include/stdlib.h" 3
void _Exit (int __status) __attribute__ ((__noreturn__));
# 180 "/opt/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * __itoa (int, char *, int);
char * __utoa (unsigned, char *, int);
# 211 "/opt/devkitARM/arm-none-eabi/include/stdlib.h" 3
long long atoll (const char *__nptr);







long long llabs (long long);
lldiv_t lldiv (long long __numer, long long __denom);
long long strtoll (const char *restrict __n, char **restrict __end_PTR, int __base);







unsigned long long strtoull (const char *restrict __n, char **restrict __end_PTR, int __base);
# 246 "/opt/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);

void * _malloc_r (struct _reent *, size_t) ;
void * _calloc_r (struct _reent *, size_t, size_t) ;
void _free_r (struct _reent *, void *) ;
void * _realloc_r (struct _reent *, void *, size_t) ;
void _mstats_r (struct _reent *, char *);

int _system_r (struct _reent *, const char *);

void __eprintf (const char *, const char *, unsigned int, const char *);
# 279 "/opt/devkitARM/arm-none-eabi/include/stdlib.h" 3
extern long double strtold (const char *restrict, char **restrict);




# 12 "game.c" 2





# 16 "game.c"
int update;
int scale;
PLAYER luigi;
GHOST boo;
GHOST loo;
GHOST hoo;
int numberOfGhosts;
BATTERY battery[5];
int batteryLife;
int batteryCounter;
int level;
int volatile counter1;
int volatile counter2;
int volatile counter3;
int volatile counter4;
int volatile counter5;
int volatile counter6;
int timer1;
int timer2;

int numberOfBatteries;

enum {BOO = 0, LIGHT = 5, LUIGI = 6, BATTERIES = 7, BATTERY_BARS = 12, DOOR = 44, TENS = 45, ONES = 46};
enum {RIGHT, LEFT, DOWNR, DOWNL, JUMPR, JUMPL, PEACE, OUCH, IDLE};
enum {L, R};

void initLevel1() {
    *(volatile unsigned short*)0x4000008 = 1 << 2 | 29 << 8 | 0<<14;
    *(volatile unsigned short*)0x400000A = 0 << 2 | 30 << 8 | 1<<14;
 *(unsigned short *)0x4000000 = 0 | (1<<8) | (1<<9) | (1 << 12);

 loadPalette(bg1Pal);

    DMANow(3, bg1Tiles, &((charblock *)0x6000000)[0], 608/2);
    DMANow(3, bg1Map, &((screenblock *)0x6000000)[30], 4096/2);

    DMANow(3, widgetsTiles, &((charblock *)0x6000000)[1], 32768/2);
    DMANow(3, widgetsMap, &((screenblock *)0x6000000)[29], 2048/2);

 DMANow(3, luigiTiles, &((charblock *)0x6000000)[4], 32768/2);
 DMANow(3, luigiPal, ((unsigned short*)(0x5000200)), 512/2);

 vOff = 0;
 hOff = 0;

    level = 1;

 luigi.height = 23;
 luigi.width = 12;
 luigi.worldRow = ((80) << 8);
 luigi.worldCol = ((5) << 8);
 luigi.rdel = 0;
 luigi.cdel = 0;
 luigi.racc = 70;
    luigi.cacc = 15;
    luigi.stopRange = 5;
    luigi.maxHSpeed = ((2) << 8) - ((2) << 8)/4;
    luigi.maxVSpeed = ((5) << 8) + ((1) << 8)/2;
 luigi.aniCounter = 0;
 luigi.currFrame = 0;
 luigi.aniState = LEFT;
    luigi.flash = 0;
    luigi.direction = 1;
    luigi.active = 1;
    luigi.cheat = 0;

    boo.height = 25;
    boo.width = 30;
    boo.worldRow = ((160 - 40 - boo.width) << 8);
    boo.worldCol = ((200) << 8);
    boo.rdel = 0;
    boo.cdel = 0;
    boo.racc = 5;
    boo.cacc = 5;
    boo.maxHSpeed = ((1) << 8)/2;
    boo.maxVSpeed = ((1) << 8)/2;
    boo.aniCounter = 0;
    boo.aniState = LEFT;
    boo.currFrame = 0;
    boo.active = 1;
    boo.spawn = 0;

    loo.active = 0;
    loo.attr0 = (2 << 8);
    hoo.active = 0;
    hoo.attr0 = (2 << 8);

    batteryLife = 100;
    batteryCounter = 0;

    for(int i = 0; i < 5; i++) {
        battery[i].height = 16;
        battery[i].width = 8;
        battery[i].worldRow = 160 - 40 - battery[i].height;
        battery[i].worldCol = rand() % 512;
        battery[i].active = 1;
    }
    numberOfBatteries = (sizeof battery) / (sizeof battery[0]);
    timer1 = 0;
    timer2 = 10;
}

void initLevel2() {
    level = 2;

    timer1 = 0;
    timer2 = 10;

    vOff = 0;
    hOff = 0;

    luigi.height = 23;
    luigi.width = 12;
    luigi.worldRow = ((80) << 8);
    luigi.worldCol = ((5) << 8);
    luigi.rdel = 0;
    luigi.cdel = 0;
    luigi.racc = 70;
    luigi.cacc = 15;
    luigi.stopRange = 5;
    luigi.maxHSpeed = ((2) << 8) - ((2) << 8)/4;
    luigi.maxVSpeed = ((5) << 8) + ((1) << 8)/2;
    luigi.aniCounter = 0;
    luigi.currFrame = 0;
    luigi.aniState = LEFT;
    luigi.flash = 0;
    luigi.direction = 1;
    luigi.active = 1;
    luigi.cheat = 0;

    boo.height = 25;
    boo.width = 30;
    boo.worldRow = ((160 - 40 - boo.width) << 8);
    boo.worldCol = ((200) << 8);
    boo.rdel = 0;
    boo.cdel = 0;
    boo.racc = 5;
    boo.cacc = 5;
    boo.maxHSpeed = ((1) << 8)/3;
    boo.maxVSpeed = ((1) << 8)/3;
    boo.aniCounter = 0;
    boo.aniState = LEFT;
    boo.currFrame = 0;
    boo.active = 1;
    boo.spawn = 0;

    loo.height = 25;
    loo.width = 30;
    loo.worldRow = ((40 - boo.width) << 8);
    loo.worldCol = ((250) << 8);
    loo.rdel = 0;
    loo.cdel = 0;
    loo.racc = 6;
    loo.cacc = 6;
    loo.maxHSpeed = ((1) << 8)/3;
    loo.maxVSpeed = ((1) << 8)/3;
    loo.aniCounter = 0;
    loo.aniState = LEFT;
    loo.currFrame = 0;
    loo.active = 1;
    loo.spawn = 0;

    hoo.height = 25;
    hoo.width = 30;
    hoo.worldRow = ((40 - boo.width) << 8);
    hoo.worldCol = ((100) << 8);
    hoo.rdel = 0;
    hoo.cdel = 0;
    hoo.racc = 6;
    hoo.cacc = 6;
    hoo.maxHSpeed = ((1) << 8)/3;
    hoo.maxVSpeed = ((1) << 8)/3;
    hoo.aniCounter = 0;
    hoo.aniState = LEFT;
    hoo.currFrame = 0;
    hoo.active = 1;
    hoo.spawn = 0;

    batteryLife = 100;
    batteryCounter = 0;
}

void updatePosition() {
    if(luigi.active) {
        luigi.rdel += luigi.racc;

        luigi.worldRow += luigi.rdel;
        luigi.worldCol += luigi.cdel;

        int normal = 1;

        if(hOff < 512 - 240 && luigi.cdel > 10) {
         if(luigi.screenCol >= 200) scale = 2;
         else if(luigi.screenCol >= 90) scale = 1;
         else scale = 0;

         switch(scale) {
          case 0:
           hOff = hOff;
           break;
          case 1:
           hOff += 2;
           break;
          case 2:
           hOff += 3;
           break;
         }
        }
        if(hOff > 0 && luigi.cdel < -10) {
         if(luigi.screenCol <= 40) scale = 2;
         else if(luigi.screenCol <= 150) scale = 1;
         else scale = 0;

         switch(scale) {
          case 0:
           hOff = hOff;
           break;
          case 1:
           hOff -= 2;
           break;
          case 2:
           hOff -= 3;
           break;
         }
        }

        if(((luigi.worldRow) >> 8) >= 160 - 40 - 31 - 1)
        {
            luigi.worldRow = ((160 - 40 - 31 - 1) << 8);
            luigi.rdel = 0;
        }
        if(((luigi.worldRow) >> 8) <= 0)
        {
            luigi.worldRow = 0;
            luigi.rdel = -luigi.rdel;
        }

        if(((luigi.worldCol) >> 8) < 0)
        {
            luigi.worldCol = 0;
            luigi.cdel = -luigi.cdel;
        }

        if(((luigi.worldCol) >> 8) >= 512 - 2 - luigi.width)
        {
            luigi.worldCol = ((512 - 2 - luigi.width) << 8);
            luigi.cdel = -luigi.cdel;
        }

        if((~(*(volatile unsigned int *)0x04000130) & ((1<<7))))
        {
         if (luigi.rdel < -(luigi.stopRange) || luigi.rdel > luigi.stopRange) normal = 50;
         if(luigi.cdel < 0)
            {
                luigi.cdel += luigi.cacc/normal;
            }
            else if(luigi.cdel > 0)
            {
                luigi.cdel -= luigi.cacc/normal;
            }
            if(luigi.cdel < luigi.stopRange && luigi.cdel > -luigi.stopRange)
            {
                luigi.cdel = 0;
            }
        }
        else if((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0)))) && luigi.rdel > -luigi.stopRange && luigi.rdel < luigi.stopRange)
        {
            luigi.rdel = -luigi.maxVSpeed;
            playSoundB(jump, 6506 - 100, 11025, 0);
        }
        else if((~(*(volatile unsigned int *)0x04000130) & ((1<<5))))
        {
            luigi.direction = L;
            if(luigi.cdel > -luigi.maxHSpeed)
            {
                luigi.cdel -= luigi.cacc;
            }
        }
        else if((~(*(volatile unsigned int *)0x04000130) & ((1<<4))))
        {
            luigi.direction = R;
            if(luigi.cdel < luigi.maxHSpeed)
            {
                luigi.cdel += luigi.cacc;
            }
        }
        else
        {
         if (luigi.rdel < -(luigi.stopRange) || luigi.rdel > luigi.stopRange) normal = 50;
         if(luigi.cdel < 0)
            {
                luigi.cdel += luigi.cacc/normal;
            }
            else if(luigi.cdel > 0)
            {
                luigi.cdel -= luigi.cacc/normal;
            }
            if(luigi.cdel < luigi.stopRange && luigi.cdel > -luigi.stopRange)
            {
                luigi.cdel = 0;
            }
        }
    }
}

void updateGhost() {
    if(luigi.flash && batteryLife > 0 && ((luigi.worldCol) >> 8) + luigi.width + 100 >= ((boo.worldCol) >> 8)
        && ((boo.worldCol) >> 8) > ((luigi.worldCol) >> 8) && luigi.direction == R) {
        boo.active = 0;
        counter1 = 0;
        counter2 = 0;
    } else if(luigi.flash && batteryLife > 0 && ((luigi.worldCol) >> 8) - 100 <= ((boo.worldCol) >> 8) + boo.width
        && ((boo.worldCol) >> 8) < ((luigi.worldCol) >> 8) && luigi.direction == L) {
        boo.active = 0;
        counter1 = 0;
        counter2 = 0;
    } else if(luigi.cheat) {
        boo.active = 0;
    } else {
        if(counter1 % 500 == 0) {
            counter2++;
            counter1 = 0;
            if(counter2 % 30 == 0) {
                counter2 = 0;
                boo.active = 1;
            }
        } else {
            counter1++;
        }
        if(boo.active) {

            boo.worldRow += boo.rdel;
            boo.worldCol += boo.cdel;

            if(((luigi.worldRow) >> 8) > ((boo.worldRow) >> 8) + 14 && boo.rdel <= 0) {
                if(boo.rdel < boo.maxVSpeed) {
                    boo.rdel += boo.racc;
                }
            } else if(((luigi.worldRow) >> 8) + luigi.height - 8 < ((boo.worldRow) >> 8) && boo.rdel >= 0) {
                if(boo.rdel > -(boo.maxVSpeed)) {
                    boo.rdel -= boo.racc;
                }
            } else if(((luigi.worldRow) >> 8) > ((boo.worldRow) >> 8) + 18 && boo.rdel >= 0) {
                if(boo.rdel < boo.maxVSpeed) {
                    boo.rdel += boo.racc;
                }
            } else if(((luigi.worldRow) >> 8) + luigi.height - 8 < ((boo.worldRow) >> 8) && boo.rdel <= 0) {
                if(boo.rdel > -(boo.maxVSpeed)) {
                    boo.rdel -= boo.racc;
                }
            }
            if(((luigi.worldCol) >> 8) + luigi.width < ((boo.worldCol) >> 8) && boo.cdel > 0) {
                if(boo.cdel > -(boo.maxHSpeed)) {
                    boo.cdel -= boo.cacc;
                }
            } else if(((luigi.worldCol) >> 8) > ((boo.worldCol) >> 8) + boo.width && boo.cdel < 0){
                if(boo.cdel < boo.maxHSpeed) {
                    boo.cdel += boo.cacc;
                }
            } else if(((luigi.worldCol) >> 8) + luigi.width < ((boo.worldCol) >> 8) && boo.cdel <= 0) {
                if(boo.cdel > -(boo.maxHSpeed)) {
                    boo.cdel -= boo.cacc;
                }
            } else if(((luigi.worldCol) >> 8) > ((boo.worldCol) >> 8) + boo.width && boo.cdel >= 0) {
                if(boo.cdel < boo.maxHSpeed) {
                    boo.cdel += boo.cacc;
                }
            }

            boo.worldRow += boo.rdel;
            boo.worldCol += boo.cdel;
        }
    }
}

void updateGhost1() {
    if(luigi.flash && batteryLife > 0 && ((luigi.worldCol) >> 8) + luigi.width + 100 >= ((loo.worldCol) >> 8)
        && ((loo.worldCol) >> 8) > ((luigi.worldCol) >> 8) && luigi.direction == R) {
        loo.active = 0;
        counter3 = 0;
        counter4 = 0;
    } else if(luigi.flash && batteryLife > 0 && ((luigi.worldCol) >> 8) - 100 <= ((loo.worldCol) >> 8) + loo.width
        && ((loo.worldCol) >> 8) < ((luigi.worldCol) >> 8) && luigi.direction == L) {
        loo.active = 0;
        counter3 = 0;
        counter4 = 0;
    } else if(luigi.cheat) {
        loo.active = 0;
    } else {
        if(counter3 % 500 == 0) {
            counter4++;
            counter3 = 0;
            if(counter4 % 30 == 0) {
                counter4 = 0;
                loo.active = 1;
            }
        } else {
            counter3++;
        }
        if(loo.active) {

            loo.worldRow += loo.rdel;
            loo.worldCol += loo.cdel;

            if(((luigi.worldRow) >> 8) > ((loo.worldRow) >> 8) + 10 && loo.rdel <= 0) {
                if(loo.rdel < loo.maxVSpeed) {
                    loo.rdel += loo.racc;
                }
            } else if(((luigi.worldRow) >> 8) + luigi.height - 4 < ((loo.worldRow) >> 8) && loo.rdel >= 0) {
                if(loo.rdel > -(loo.maxVSpeed)) {
                    loo.rdel -= loo.racc;
                }
            } else if(((luigi.worldRow) >> 8) > ((loo.worldRow) >> 8) + 14 && loo.rdel >= 0) {
                if(loo.rdel < loo.maxVSpeed) {
                    loo.rdel += loo.racc;
                }
            } else if(((luigi.worldRow) >> 8) + luigi.height - 4 < ((loo.worldRow) >> 8) && loo.rdel <= 0) {
                if(loo.rdel > -(loo.maxVSpeed)) {
                    loo.rdel -= loo.racc;
                }
            }
            if(((luigi.worldCol) >> 8) + luigi.width < ((loo.worldCol) >> 8) && loo.cdel > 0) {
                if(loo.cdel > -(loo.maxHSpeed)) {
                    loo.cdel -= loo.cacc;
                }
            } else if(((luigi.worldCol) >> 8) > ((loo.worldCol) >> 8) + loo.width && loo.cdel < 0){
                if(loo.cdel < loo.maxHSpeed) {
                    loo.cdel += loo.cacc;
                }
            } else if(((luigi.worldCol) >> 8) + luigi.width < ((loo.worldCol) >> 8) && loo.cdel <= 0) {
                if(loo.cdel > -(loo.maxHSpeed)) {
                    loo.cdel -= loo.cacc;
                }
            } else if(((luigi.worldCol) >> 8) > ((loo.worldCol) >> 8) + loo.width && loo.cdel >= 0) {
                if(loo.cdel < loo.maxHSpeed) {
                    loo.cdel += loo.cacc;
                }
            }

            loo.worldRow += loo.rdel;
            loo.worldCol += loo.cdel;
        }
    }
}

void updateGhost2() {
    if(luigi.flash && batteryLife > 0 && ((luigi.worldCol) >> 8) + luigi.width + 100 >= ((hoo.worldCol) >> 8)
        && ((hoo.worldCol) >> 8) > ((luigi.worldCol) >> 8) && luigi.direction == R) {
        hoo.active = 0;
        counter5 = 0;
        counter6 = 0;
    } else if(luigi.flash && batteryLife > 0 && ((luigi.worldCol) >> 8) - 100 <= ((hoo.worldCol) >> 8) + hoo.width
        && ((hoo.worldCol) >> 8) < ((luigi.worldCol) >> 8) && luigi.direction == L) {
        hoo.active = 0;
        counter5 = 0;
        counter6 = 0;
    } else if(luigi.cheat) {
        hoo.active = 0;
    } else {
        if(counter5 % 500 == 0) {
            counter6++;
            counter5 = 0;
            if(counter6 % 30 == 0) {
                counter6 = 0;
                hoo.active = 1;
            }
        } else {
            counter5++;
        }
        if(hoo.active) {

            hoo.worldRow += hoo.rdel;
            hoo.worldCol += hoo.cdel;

            if(((luigi.worldRow) >> 8) > ((hoo.worldRow) >> 8) + 10 && hoo.rdel <= 0) {
                if(hoo.rdel < hoo.maxVSpeed) {
                    hoo.rdel += hoo.racc;
                }
            } else if(((luigi.worldRow) >> 8) + luigi.height - 4 < ((hoo.worldRow) >> 8) && hoo.rdel >= 0) {
                if(hoo.rdel > -(hoo.maxVSpeed)) {
                    hoo.rdel -= hoo.racc;
                }
            } else if(((luigi.worldRow) >> 8) > ((hoo.worldRow) >> 8) + 14 && hoo.rdel >= 0) {
                if(hoo.rdel < hoo.maxVSpeed) {
                    hoo.rdel += hoo.racc;
                }
            } else if(((luigi.worldRow) >> 8) + luigi.height - 4 < ((hoo.worldRow) >> 8) && hoo.rdel <= 0) {
                if(hoo.rdel > -(hoo.maxVSpeed)) {
                    hoo.rdel -= hoo.racc;
                }
            }
            if(((hoo.worldCol) >> 8) + hoo.width > ((luigi.worldCol) >> 8) + 70 && hoo.cdel >= 0) {
                if(hoo.cdel > -(hoo.maxHSpeed)) {
                    hoo.cdel -= hoo.cacc;
                }
            } else if(((hoo.worldCol) >> 8) < ((luigi.worldCol) >> 8) - 70 && hoo.cdel <= 0) {
                if(hoo.cdel < hoo.maxHSpeed) {
                    hoo.cdel += hoo.cacc;
                }
            } else if(((hoo.worldCol) >> 8) + hoo.width < 475 && hoo.cdel >= 0) {
                if(hoo.cdel < hoo.maxHSpeed) {
                    hoo.cdel += hoo.cacc;
                }
            } else if(((hoo.worldCol) >> 8) > 30 && hoo.cdel <= 0) {
                if(hoo.cdel > -(hoo.maxHSpeed)) {
                    hoo.cdel -= hoo.cacc;
                }
            }


            hoo.worldRow += hoo.rdel;
            hoo.worldCol += hoo.cdel;
        }
    }
}

void updateFlashLight() {
    if((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1)))) && luigi.flash == 0) {
        luigi.flash = 3;
    } else if((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1)))) && luigi.flash == 3) {
        luigi.flash = 0;
    }
}

void updateBattery() {
    if(batteryLife > 0 && luigi.flash == 3) {
        batteryCounter++;
        if(batteryCounter % 2 == 0) {
            batteryCounter = 0;
            batteryLife--;
        }
    }

}

void collision () {
    if(((luigi.worldRow) >> 8) + 8 <= ((boo.worldRow) >> 8) + 28
        && ((luigi.worldRow) >> 8) + 32 >= ((boo.worldRow) >> 8) + 12
        && ((luigi.worldCol) >> 8) <= ((boo.worldCol) >> 8) + 20
        && ((luigi.worldCol) >> 8) + luigi.width >= ((boo.worldCol + 12) >> 8)
        && boo.active) {
        luigi.active = 0;
        goToLose();
    }
    if(((luigi.worldRow) >> 8) + 8 <= ((loo.worldRow) >> 8) + 28
        && ((luigi.worldRow) >> 8) + 32 >= ((loo.worldRow) >> 8) + 12
        && ((luigi.worldCol) >> 8) <= ((loo.worldCol) >> 8) + 20
        && ((luigi.worldCol) >> 8) + luigi.width >= ((loo.worldCol + 12) >> 8)
        && loo.active) {
        luigi.active = 0;
        goToLose();
    }
    if(((luigi.worldRow) >> 8) + 8 <= ((hoo.worldRow) >> 8) + 28
        && ((luigi.worldRow) >> 8) + 32 >= ((hoo.worldRow) >> 8) + 12
        && ((luigi.worldCol) >> 8) <= ((hoo.worldCol) >> 8) + 20
        && ((luigi.worldCol) >> 8) + luigi.width >= ((hoo.worldCol + 12) >> 8)
        && hoo.active) {
        luigi.active = 0;
        goToLose();
    }
    for(int j = 0; j < numberOfBatteries; j++) {
        if(((luigi.worldRow) >> 8) + 8 <= battery[j].worldRow + battery[j].height
            && ((luigi.worldRow) >> 8) + 32 >= battery[j].worldRow
            && ((luigi.worldCol) >> 8) <= battery[j].worldCol + battery[j].width
            && ((luigi.worldCol) >> 8) + luigi.width >= battery[j].worldCol
            && battery[j].active) {
            battery[j].active = 0;
            batteryLife += 50;
            if(batteryLife > 100) batteryLife = 100;
        }
    }
    if ((~(*(volatile unsigned int *)0x04000130) & ((1<<6))) && ((luigi.worldCol) >> 8) >= 480 && ((luigi.worldCol) >> 8) <= 482 && level == 1) {
        goToLevel2();
    } else if ((~(*(volatile unsigned int *)0x04000130) & ((1<<6))) && ((luigi.worldCol) >> 8) >= 480 && ((luigi.worldCol) >> 8) <= 482 && level == 2) {
        goToWin();
    }
 }

void updateScreenLocations() {
 luigi.screenRow = ((luigi.worldRow) >> 8) - vOff;
 luigi.screenCol = ((luigi.worldCol) >> 8) - hOff;
    if(boo.active) {
        boo.screenRow = ((boo.worldRow) >> 8) - vOff;
        boo.screenCol = ((boo.worldCol) >> 8) - hOff;
    }
    if(loo.active) {
        loo.screenRow = ((loo.worldRow) >> 8) - vOff;
        loo.screenCol = ((loo.worldCol) >> 8) - hOff;
    }
    if(hoo.active) {
        hoo.screenRow = ((hoo.worldRow) >> 8) - vOff;
        hoo.screenCol = ((hoo.worldCol) >> 8) - hOff;
    }
    for(int i = 0; i < 5; i++) {
        if(battery[i].active) {
            battery[i].screenRow = battery[i].worldRow - vOff;
            battery[i].screenCol = battery[i].worldCol - hOff;
        }
    }
}

void animateLuigi() {
    if(luigi.active) {
        if(luigi.aniCounter % 5 == 0)
        {
      luigi.aniCounter = 0;
      if (luigi.currFrame == 2 || luigi.currFrame == 5) luigi.currFrame = luigi.flash;
      else luigi.currFrame++;
        }
        if((~(*(volatile unsigned int *)0x04000130) & ((1<<7)))) {
         if(luigi.prevAniState == RIGHT) luigi.aniState = DOWNR;
         else if(luigi.prevAniState == LEFT) luigi.aniState = DOWNL;
     }
     else if(luigi.rdel != 0) {
      if((~(*(volatile unsigned int *)0x04000130) & ((1<<0)))) {
       if(luigi.rdel != 0) {
        if(luigi.prevAniState == RIGHT) {
         luigi.aniState = JUMPR;
        } else if(luigi.prevAniState == LEFT) {
         luigi.aniState = JUMPL;
        }
       }
      }
      else if((~(*(volatile unsigned int *)0x04000130) & ((1<<5)))) {
       luigi.aniState = LEFT;
       luigi.prevAniState = LEFT;
      }
      else if((~(*(volatile unsigned int *)0x04000130) & ((1<<4)))) {
       luigi.aniState = RIGHT;
       luigi.prevAniState = RIGHT;
      }
         else {
          luigi.currFrame = luigi.flash;
                luigi.aniState = luigi.prevAniState;
      }
     }
     else if(luigi.rdel == 0) {
         if((~(*(volatile unsigned int *)0x04000130) & ((1<<5)))) {
       luigi.aniState = LEFT;
       luigi.prevAniState = LEFT;
      }
      else if((~(*(volatile unsigned int *)0x04000130) & ((1<<4)))) {
       luigi.aniState = RIGHT;
       luigi.prevAniState = RIGHT;
      }
         else {
          luigi.currFrame = luigi.flash;
                luigi.aniState = luigi.prevAniState;
      }
     }
     luigi.aniCounter++;
    }
}

void animateBoo() {
    if(boo.active) {
        if(boo.spawn == 0) {
            boo.attr0 = (0 << 8);
            if(boo.aniCounter % 2 == 0) {
                boo.aniCounter = 0;
                if(boo.currFrame == 0) {
                    boo.spawn = 1;
                    boo.currFrame = 0;
                } else {
                    boo.currFrame--;
                }
            }
            boo.aniCounter++;
        }
        if(boo.cdel < 0) {
            boo.flip = 0;
        } else if(boo.cdel > 0) {
            boo.flip = (1 << 12);
        }
    } else {
        boo.spawn = 0;
        if(boo.aniCounter % 2 == 0 && boo.attr0 == (0 << 8))
        {
            boo.aniCounter = 0;
            if(boo.currFrame == 7) {
                boo.attr0 = (2 << 8);
                boo.currFrame = 7;
            } else {
                boo.currFrame++;
            }
        }
        boo.aniCounter++;
    }
}

void animateLoo() {
    if(loo.active) {
        if(loo.spawn == 0) {
            loo.attr0 = (0 << 8);
            if(loo.aniCounter % 2 == 0) {
                loo.aniCounter = 0;
                if(loo.currFrame == 0) {
                    loo.spawn = 1;
                    loo.currFrame = 0;
                } else {
                    loo.currFrame--;
                }
            }
            loo.aniCounter++;
        }
        if(loo.cdel < 0) {
            loo.flip = 0;
        } else if(loo.cdel > 0) {
            loo.flip = (1 << 12);
        }
    } else {
        loo.spawn = 0;
        if(loo.aniCounter % 2 == 0 && loo.attr0 == (0 << 8))
        {
            loo.aniCounter = 0;
            if(loo.currFrame == 7) {
                loo.attr0 = (2 << 8);
                loo.currFrame = 7;
            } else {
                loo.currFrame++;
            }
        }
        loo.aniCounter++;
    }
}

void animateHoo() {
    if(hoo.active) {
        if(hoo.spawn == 0) {
            hoo.attr0 = (0 << 8);
            if(hoo.aniCounter % 2 == 0) {
                hoo.aniCounter = 0;
                if(hoo.currFrame == 0) {
                    hoo.spawn = 1;
                    hoo.currFrame = 0;
                } else {
                    hoo.currFrame--;
                }
            }
            hoo.aniCounter++;
        }
        if(hoo.cdel < 0) {
            hoo.flip = 0;
        } else if(hoo.cdel > 0) {
            hoo.flip = (1 << 12);
        }
    } else {
        hoo.spawn = 0;
        if(hoo.aniCounter % 2 == 0 && hoo.attr0 == (0 << 8))
        {
            hoo.aniCounter = 0;
            if(hoo.currFrame == 7) {
                hoo.attr0 = (2 << 8);
                hoo.currFrame = 7;
            } else {
                hoo.currFrame++;
            }
        }
        hoo.aniCounter++;
    }
}

void cheat() {
    if((!(~(oldButtons)&((1<<8))) && (~buttons & ((1<<8)))) && (!(~(oldButtons)&((1<<9))) && (~buttons & ((1<<9)))) && luigi.cheat == 0) {
        luigi.cheat = 1;
    } else if((!(~(oldButtons)&((1<<8))) && (~buttons & ((1<<8)))) && (!(~(oldButtons)&((1<<9))) && (~buttons & ((1<<9)))) && luigi.cheat) {
        luigi.cheat = 0;
    }
}

void timer() {
    if (timer2 == 0) {
        goToLose();
    } else if (timer1 % 150 == 0) {
        timer1 = 0;
        timer2--;
    }
    timer1++;
}

void updateOAM() {

    shadowOAM[0].attr0 = (0xFF & boo.screenRow) | boo.attr0;
    shadowOAM[0].attr1 = (0x1FF & boo.screenCol) | (2 << 14) | boo.flip;
    shadowOAM[0].attr2 = ((4 * 6)*32+(4 * boo.currFrame)) | ((2)<<12);

    shadowOAM[1].attr0 = (0xFF & loo.screenRow) | loo.attr0;
    shadowOAM[1].attr1 = (0x1FF & loo.screenCol) | (2 << 14) | loo.flip;
    shadowOAM[1].attr2 = ((4 * 6)*32+(4 * loo.currFrame)) | ((2)<<12);

    shadowOAM[2].attr0 = (0xFF & hoo.screenRow) | hoo.attr0;
    shadowOAM[2].attr1 = (0x1FF & hoo.screenCol) | (2 << 14) | hoo.flip;
    shadowOAM[2].attr2 = ((4 * 6)*32+(4 * hoo.currFrame)) | ((2)<<12);

    if (luigi.cheat) {
        shadowOAM[LUIGI].attr0 = (0xFF & luigi.screenRow) | (2 << 14);
        shadowOAM[LUIGI].attr1 = (0x1FF & luigi.screenCol) | (2 << 14);
        shadowOAM[LUIGI].attr2 = ((4)*32+(12)) | ((1)<<12);
    }

    else if(luigi.active) {
     shadowOAM[LUIGI].attr0 = (0xFF & luigi.screenRow) | (2 << 14);
     shadowOAM[LUIGI].attr1 = (0x1FF & luigi.screenCol) | (2 << 14);
     shadowOAM[LUIGI].attr2 = (4 * luigi.aniState)*32+(2 * luigi.currFrame);
    } else {
        shadowOAM[LUIGI].attr0 = (0xFF & luigi.screenRow) | (2 << 14);
        shadowOAM[LUIGI].attr1 = (0x1FF & luigi.screenCol) | (2 << 14);
        shadowOAM[LUIGI].attr2 = (0)*32+(12);
    }

    if(luigi.flash && batteryLife > 0 && luigi.prevAniState == RIGHT) {
        shadowOAM[LIGHT].attr0 = (0xFF & (luigi.screenRow + 10));
        shadowOAM[LIGHT].attr1 = (0x1FF & (luigi.screenCol + 13)) | (2 << 14);
        shadowOAM[LIGHT].attr2 = ((0)*32+(12)) | ((1)<<12);
    } else if(luigi.flash && batteryLife > 0 && luigi.prevAniState == LEFT) {
        shadowOAM[LIGHT].attr0 = (0xFF & (luigi.screenRow + 9));
        shadowOAM[LIGHT].attr1 = (0x1FF & (luigi.screenCol - 33)) | (2 << 14) | (1 << 12);
        shadowOAM[LIGHT].attr2 = ((0)*32+(12)) | ((1)<<12);
    } else {
        shadowOAM[LIGHT].attr0 = ((2 << 8));
    }

    for(int i = 0; i < numberOfBatteries; i++) {
        if(battery[i].active) {
            shadowOAM[BATTERIES + i].attr0 = (0xFF & battery[i].screenRow) | (2 << 14);
            shadowOAM[BATTERIES + i].attr1 = (0x1FF & battery[i].screenCol) | (2 << 14);
            shadowOAM[BATTERIES + i].attr2 = ((0)*32+(17)) | ((1)<<12);
        } else {
            shadowOAM[BATTERIES + i].attr0 = (2 << 8);
        }
    }


    for(int i = 0; i < 32; i++) {
        if(i * 3 < batteryLife) {
            shadowOAM[BATTERY_BARS + i].attr0 = (0xFF & 9);
            shadowOAM[BATTERY_BARS + i].attr1 = (0x1FF & (9 + 3 * i));
            shadowOAM[BATTERY_BARS + i].attr2 = ((0)*32+(24)) | ((1)<<12);
        } else {
            shadowOAM[BATTERY_BARS + i].attr0 = (2 << 8);
        }
    }

    shadowOAM[DOOR].attr0 = (0xFF & (160 - 72)) | (2 << 14);
    shadowOAM[DOOR].attr1 = (0x1FF & (480 - hOff)) | (2 << 14);
    shadowOAM[DOOR].attr2 = ((4)*32+(14));

    shadowOAM[TENS].attr0 = (0xFF & (10));
    shadowOAM[TENS].attr1 = (0x1FF & (215));
    shadowOAM[TENS].attr2 = ((28)*32+((timer2 / 10))) | ((2)<<12);;

    shadowOAM[ONES].attr0 = (0xFF & (10));
    shadowOAM[ONES].attr1 = (0x1FF & (221));
    shadowOAM[ONES].attr2 = ((28)*32+((timer2 % 10))) | ((2)<<12);;

}
