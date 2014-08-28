ffi = require("ffi")
ffi.cdef[[
typedef long unsigned int size_t;
typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;
typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;
typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;
typedef long int __quad_t;
typedef unsigned long int __u_quad_t;
typedef unsigned long int __dev_t;
typedef unsigned int __uid_t;
typedef unsigned int __gid_t;
typedef unsigned long int __ino_t;
typedef unsigned long int __ino64_t;
typedef unsigned int __mode_t;
typedef unsigned long int __nlink_t;
typedef long int __off_t;
typedef long int __off64_t;
typedef int __pid_t;
typedef struct { int __val[2]; } __fsid_t;
typedef long int __clock_t;
typedef unsigned long int __rlim_t;
typedef unsigned long int __rlim64_t;
typedef unsigned int __id_t;
typedef long int __time_t;
typedef unsigned int __useconds_t;
typedef long int __suseconds_t;
typedef int __daddr_t;
typedef int __key_t;
typedef int __clockid_t;
typedef void * __timer_t;
typedef long int __blksize_t;
typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;
typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;
typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;
typedef long int __fsword_t;
typedef long int __ssize_t;
typedef long int __syscall_slong_t;
typedef unsigned long int __syscall_ulong_t;
typedef __off64_t __loff_t;
typedef __quad_t *__qaddr_t;
typedef char *__caddr_t;
typedef long int __intptr_t;
typedef unsigned int __socklen_t;
struct _IO_FILE;
typedef struct _IO_FILE FILE;
typedef struct _IO_FILE __FILE;
typedef struct
{
  int __count;  union  {    unsigned int __wch;    char __wchb[4];  } __value;} __mbstate_t;
typedef struct
{
  __off_t __pos;  __mbstate_t __state;} _G_fpos_t;
typedef struct
{
  __off64_t __pos;  __mbstate_t __state;} _G_fpos64_t;
typedef __builtin_va_list __gnuc_va_list;
struct _IO_jump_t; struct _IO_FILE;
typedef void _IO_lock_t;
struct _IO_marker {
  struct _IO_marker *_next;  struct _IO_FILE *_sbuf;  int _pos;};
enum __codecvt_result
{
  __codecvt_ok,  __codecvt_partial,  __codecvt_error,  __codecvt_noconv};
struct _IO_FILE {
  int _flags;  char* _IO_read_ptr;  char* _IO_read_end;  char* _IO_read_base;  char* _IO_write_base;  char* _IO_write_ptr;  char* _IO_write_end;  char* _IO_buf_base;  char* _IO_buf_end;  char *_IO_save_base;  char *_IO_backup_base;  char *_IO_save_end;  struct _IO_marker *_markers;  struct _IO_FILE *_chain;  int _fileno;  int _flags2;  __off_t _old_offset;  unsigned short _cur_column;  signed char _vtable_offset;  char _shortbuf[1];  _IO_lock_t *_lock;  __off64_t _offset;  void *__pad1;  void *__pad2;  void *__pad3;  void *__pad4;  size_t __pad5;  int _mode;  char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];};
typedef struct _IO_FILE _IO_FILE;
struct _IO_FILE_plus;
extern struct _IO_FILE_plus _IO_2_1_stdin_;
extern struct _IO_FILE_plus _IO_2_1_stdout_;
extern struct _IO_FILE_plus _IO_2_1_stderr_;
typedef __ssize_t __io_read_fn (void *__cookie, char *__buf, size_t __nbytes);
typedef __ssize_t __io_write_fn (void *__cookie, const char *__buf,
     size_t __n);typedef int __io_seek_fn (void *__cookie, __off64_t *__pos, int __w);
typedef int __io_close_fn (void *__cookie);
extern int __underflow (_IO_FILE *);
extern int __uflow (_IO_FILE *);
extern int __overflow (_IO_FILE *, int);
extern int _IO_getc (_IO_FILE *__fp);
extern int _IO_putc (int __c, _IO_FILE *__fp);
extern int _IO_feof (_IO_FILE *__fp) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_ferror (_IO_FILE *__fp) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_peekc_locked (_IO_FILE *__fp);
extern void _IO_flockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
extern void _IO_funlockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_ftrylockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_vfscanf (_IO_FILE * __restrict, const char * __restrict,
   __gnuc_va_list, int *__restrict);extern int _IO_vfprintf (_IO_FILE *__restrict, const char *__restrict,
    __gnuc_va_list);extern __ssize_t _IO_padn (_IO_FILE *, int, __ssize_t);
extern size_t _IO_sgetn (_IO_FILE *, void *, size_t);
extern __off64_t _IO_seekoff (_IO_FILE *, __off64_t, int, int);
extern __off64_t _IO_seekpos (_IO_FILE *, __off64_t, int);
extern void _IO_free_backup_area (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
typedef __gnuc_va_list va_list;
typedef __off_t off_t;
typedef __ssize_t ssize_t;
typedef _G_fpos_t fpos_t;
extern struct _IO_FILE *stdin;
extern struct _IO_FILE *stdout;
extern struct _IO_FILE *stderr;
extern int remove (const char *__filename) __attribute__ ((__nothrow__ , __leaf__));
extern int rename (const char *__old, const char *__new) __attribute__ ((__nothrow__ , __leaf__));
extern int renameat (int __oldfd, const char *__old, int __newfd,
       const char *__new) __attribute__ ((__nothrow__ , __leaf__));extern FILE *tmpfile (void) ;
extern char *tmpnam (char *__s) __attribute__ ((__nothrow__ , __leaf__)) ;
extern char *tmpnam_r (char *__s) __attribute__ ((__nothrow__ , __leaf__)) ;
extern char *tempnam (const char *__dir, const char *__pfx)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;extern int fclose (FILE *__stream);
extern int fflush (FILE *__stream);
extern int fflush_unlocked (FILE *__stream);
extern FILE *fopen (const char *__restrict __filename,
      const char *__restrict __modes) ;extern FILE *freopen (const char *__restrict __filename,
        const char *__restrict __modes,        FILE *__restrict __stream) ;extern FILE *fdopen (int __fd, const char *__modes) __attribute__ ((__nothrow__ , __leaf__)) ;
extern FILE *fmemopen (void *__s, size_t __len, const char *__modes)
  __attribute__ ((__nothrow__ , __leaf__)) ;extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) __attribute__ ((__nothrow__ , __leaf__)) ;
extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));
extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
      int __modes, size_t __n) __attribute__ ((__nothrow__ , __leaf__));extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
         size_t __size) __attribute__ ((__nothrow__ , __leaf__));extern void setlinebuf (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
extern int fprintf (FILE *__restrict __stream,
      const char *__restrict __format, ...);extern int printf (const char *__restrict __format, ...);
extern int sprintf (char *__restrict __s,
      const char *__restrict __format, ...) __attribute__ ((__nothrow__));extern int vfprintf (FILE *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg);extern int vprintf (const char *__restrict __format, __gnuc_va_list __arg);
extern int vsprintf (char *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg) __attribute__ ((__nothrow__));extern int snprintf (char *__restrict __s, size_t __maxlen,
       const char *__restrict __format, ...)     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 4)));extern int vsnprintf (char *__restrict __s, size_t __maxlen,
        const char *__restrict __format, __gnuc_va_list __arg)     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 0)));extern int vdprintf (int __fd, const char *__restrict __fmt,
       __gnuc_va_list __arg)     __attribute__ ((__format__ (__printf__, 2, 0)));extern int dprintf (int __fd, const char *__restrict __fmt, ...)
     __attribute__ ((__format__ (__printf__, 2, 3)));extern int fscanf (FILE *__restrict __stream,
     const char *__restrict __format, ...) ;extern int scanf (const char *__restrict __format, ...) ;
extern int sscanf (const char *__restrict __s,
     const char *__restrict __format, ...) __attribute__ ((__nothrow__ , __leaf__));extern int fscanf (FILE *__restrict __stream, const char *__restrict __format, ...) __asm__ ("" "__isoc99_fscanf")
                               ;extern int scanf (const char *__restrict __format, ...) __asm__ ("" "__isoc99_scanf")
                              ;extern int sscanf (const char *__restrict __s, const char *__restrict __format, ...) __asm__ ("" "__isoc99_sscanf") __attribute__ ((__nothrow__ , __leaf__))
                      ;extern int vfscanf (FILE *__restrict __s, const char *__restrict __format,
      __gnuc_va_list __arg)     __attribute__ ((__format__ (__scanf__, 2, 0))) ;extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0))) ;extern int vsscanf (const char *__restrict __s,
      const char *__restrict __format, __gnuc_va_list __arg)     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format__ (__scanf__, 2, 0)));extern int vfscanf (FILE *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vfscanf")
     __attribute__ ((__format__ (__scanf__, 2, 0))) ;extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vscanf")
     __attribute__ ((__format__ (__scanf__, 1, 0))) ;extern int vsscanf (const char *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vsscanf") __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__format__ (__scanf__, 2, 0)));extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);
extern int getchar (void);
extern int getc_unlocked (FILE *__stream);
extern int getchar_unlocked (void);
extern int fgetc_unlocked (FILE *__stream);
extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);
extern int putchar (int __c);
extern int fputc_unlocked (int __c, FILE *__stream);
extern int putc_unlocked (int __c, FILE *__stream);
extern int putchar_unlocked (int __c);
extern int getw (FILE *__stream);
extern int putw (int __w, FILE *__stream);
extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
     ;extern char *gets (char *__s) __attribute__ ((__deprecated__));
extern __ssize_t __getdelim (char **__restrict __lineptr,
          size_t *__restrict __n, int __delimiter,          FILE *__restrict __stream) ;extern __ssize_t getdelim (char **__restrict __lineptr,
        size_t *__restrict __n, int __delimiter,        FILE *__restrict __stream) ;extern __ssize_t getline (char **__restrict __lineptr,
       size_t *__restrict __n,       FILE *__restrict __stream) ;extern int fputs (const char *__restrict __s, FILE *__restrict __stream);
extern int puts (const char *__s);
extern int ungetc (int __c, FILE *__stream);
extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream) ;extern size_t fwrite (const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s);extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
         size_t __n, FILE *__restrict __stream) ;extern size_t fwrite_unlocked (const void *__restrict __ptr, size_t __size,
          size_t __n, FILE *__restrict __stream);extern int fseek (FILE *__stream, long int __off, int __whence);
extern long int ftell (FILE *__stream) ;
extern void rewind (FILE *__stream);
extern int fseeko (FILE *__stream, __off_t __off, int __whence);
extern __off_t ftello (FILE *__stream) ;
extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos);
extern int fsetpos (FILE *__stream, const fpos_t *__pos);
extern void clearerr (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
extern int feof (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;
extern int ferror (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;
extern void clearerr_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
extern int feof_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;
extern int ferror_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;
extern void perror (const char *__s);
extern int sys_nerr;
extern const char *const sys_errlist[];
extern int fileno (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;
extern int fileno_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;
extern FILE *popen (const char *__command, const char *__modes) ;
extern int pclose (FILE *__stream);
extern char *ctermid (char *__s) __attribute__ ((__nothrow__ , __leaf__));
extern void flockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
extern int ftrylockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;
extern void funlockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
typedef signed char int8_t;
typedef short int int16_t;
typedef int int32_t;
typedef long int int64_t;
typedef unsigned char uint8_t;
typedef unsigned short int uint16_t;
typedef unsigned int uint32_t;
typedef unsigned long int uint64_t;
typedef signed char int_least8_t;
typedef short int int_least16_t;
typedef int int_least32_t;
typedef long int int_least64_t;
typedef unsigned char uint_least8_t;
typedef unsigned short int uint_least16_t;
typedef unsigned int uint_least32_t;
typedef unsigned long int uint_least64_t;
typedef signed char int_fast8_t;
typedef long int int_fast16_t;
typedef long int int_fast32_t;
typedef long int int_fast64_t;
typedef unsigned char uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long int uint_fast64_t;
typedef long int intptr_t;
typedef unsigned long int uintptr_t;
typedef long int intmax_t;
typedef unsigned long int uintmax_t;
typedef void * cmsg_bus_p;
typedef void * cmsg_context_p;
typedef void * cmsg_bind_p;
typedef void * cmsg_handle_p;
typedef void * cmsg_funnel_p;
typedef void
 (*cmsg_bind_callback_t)(  cmsg_bind_p inBind,  void * inRefCon,  cmsg_handle_p inMessage,  const char * inPayload );typedef void
 (*cmsg_context_message_notify_t)(  cmsg_context_p inContext,  void * refcon );int
cmsg_default_startup(
  int noDispatchThread);cmsg_bus_p
cmsg_bus_new();
void
cmsg_bus_free(
  cmsg_bus_p inBus);void
cmsg_bus_flush(
  cmsg_bus_p inBus);int
cmsg_bus_poll(
  cmsg_bus_p inBus,  uint32_t inTimeoutMS );int
cmsg_bus_start_dispatch_thread(
  cmsg_bus_p inBus );int
cmsg_bus_getsocket(
  cmsg_bus_p inBus);cmsg_context_p
cmsg_bus_getcontext(
  cmsg_bus_p inBus,  const char * inName );cmsg_funnel_p
cmsg_funnel_listen(
  cmsg_bus_p inBus,  const char * inAddress );cmsg_funnel_p
cmsg_funnel_connect(
  cmsg_bus_p inBus,  const char * inAddress );void
cmsg_funnel_free(
  cmsg_funnel_p f );int
cmsg_funnel_wait_ready(
 cmsg_funnel_p inFunnel, uint32_t inTimeoutMS );int
cmsg_funnel_wait_empty(
 cmsg_funnel_p inFunnel, uint32_t inTimeoutMS );cmsg_context_p
cmsg_context_new(
  cmsg_bus_p inBus,  const char * inContextName);void
cmsg_context_free(
  cmsg_context_p inContext);void
cmsg_context_reset(
  cmsg_context_p inContext);enum {
 CMSG_FLUSH_MANUAL = (1 << 0),};
void
cmsg_context_flush(
  cmsg_context_p inContext,  uint8_t flags);const char *
cmsg_context_getname(
  cmsg_context_p inContext);cmsg_bus_p
cmsg_context_getbus(
  cmsg_context_p inContext);enum {
 CMSG_CONTEXT_PURGED = (1 << 0), CMSG_CONTEXT_PRIVATE = (1 << 1), CMSG_CONTEXT_AUTOFLUSH = (1 << 2), CMSG_CONTEXT_NOFLUSH = (1 << 3), CMSG_CONTEXT_FUNNEL = (1 << 4), CMSG_CONTEXT_FLUSHING = (1 << 5),};
uint32_t
cmsg_context_getflags(
  cmsg_context_p inContext);void
cmsg_context_setflags(
  cmsg_context_p inContext,  uint32_t inFlags );void
cmsg_context_setnotify(
  cmsg_context_p inContext,  cmsg_context_message_notify_t inCallback,  void * inCallbackRefCon);cmsg_bind_p
cmsg_bind_register(
  cmsg_context_p inContext,  const char * inMessage,  cmsg_bind_callback_t inCallback,  void * inRefcon  );cmsg_context_p
cmsg_bind_getcontext(
  cmsg_bind_p inBind);const char *
cmsg_bind_getmessage(
  cmsg_bind_p inBind);cmsg_bind_callback_t
cmsg_bind_getcallback(
  cmsg_bind_p inBind);void *
cmsg_bind_getrefcon(
  cmsg_bind_p inBind);cmsg_handle_p
cmsg_message_register(
  cmsg_context_p inContext,  const char * inMessage );cmsg_handle_p
cmsg_context_getmessage(
  cmsg_context_p inContext,  const char * inMessage );cmsg_bind_p
cmsg_context_getbind(
  cmsg_context_p inContext,  const char * inBind );void
cmsg_message_send(
  cmsg_handle_p inHandle,  const char * inPayload );cmsg_context_p
cmsg_message_getcontext(
  cmsg_handle_p inHandle);const char *
cmsg_message_get(
  cmsg_handle_p inHandle);uint16_t
cmsg_message_get_flags(
  cmsg_handle_p inHandle);void
cmsg_message_set_flags(
  cmsg_handle_p inHandle,  uint16_t flags );typedef struct cmsg_hash_t {
 int count; uint32_t component[8];} cmsg_hash_t, * cmsg_hash_p;
int
cmsg_hash_message(
 const char * inMessage, cmsg_hash_p outHash);enum {
 CMSG_HASH_MATCH_EXACT = (1 << 0)};
int
cmsg_hash_ismatch(
 cmsg_hash_p hash, cmsg_hash_p cmp, uint8_t flags );void
cmsg_bind_gethash(
  cmsg_bind_p inBind,  cmsg_hash_p outHash);void
cmsg_message_gethash(
  cmsg_handle_p inHandle,  cmsg_hash_p outHash);const char *
cmsg_get_bindings(
  cmsg_bus_p inBus );typedef int wchar_t;
typedef enum
{
  P_ALL,  P_PID,  P_PGID} idtype_t;
static __inline unsigned int
__bswap_32 (unsigned int __bsx)
{
  return __builtin_bswap32 (__bsx);}
static __inline __uint64_t
__bswap_64 (__uint64_t __bsx)
{
  return __builtin_bswap64 (__bsx);}
union wait
  {    int w_status;    struct      { unsigned int __w_termsig:7; unsigned int __w_coredump:1; unsigned int __w_retcode:8; unsigned int:16;      } __wait_terminated;    struct      { unsigned int __w_stopval:8; unsigned int __w_stopsig:8; unsigned int:16;      } __wait_stopped;  };typedef union
  {    union wait *__uptr;    int *__iptr;  } __WAIT_STATUS __attribute__ ((__transparent_union__));typedef struct
  {    int quot;    int rem;  } div_t;typedef struct
  {    long int quot;    long int rem;  } ldiv_t;__extension__ typedef struct
  {    long long int quot;    long long int rem;  } lldiv_t;extern size_t __ctype_get_mb_cur_max (void) __attribute__ ((__nothrow__ , __leaf__)) ;
extern double atof (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;extern int atoi (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;extern long int atol (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;__extension__ extern long long int atoll (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;extern double strtod (const char *__restrict __nptr,
        char **__restrict __endptr)     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));extern float strtof (const char *__restrict __nptr,
       char **__restrict __endptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));extern long double strtold (const char *__restrict __nptr,
       char **__restrict __endptr)     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));extern long int strtol (const char *__restrict __nptr,
   char **__restrict __endptr, int __base)     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));extern unsigned long int strtoul (const char *__restrict __nptr,
      char **__restrict __endptr, int __base)     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));__extension__
extern long long int strtoq (const char *__restrict __nptr,
        char **__restrict __endptr, int __base)     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));__extension__
extern unsigned long long int strtouq (const char *__restrict __nptr,
           char **__restrict __endptr, int __base)     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));__extension__
extern long long int strtoll (const char *__restrict __nptr,
         char **__restrict __endptr, int __base)     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));__extension__
extern unsigned long long int strtoull (const char *__restrict __nptr,
     char **__restrict __endptr, int __base)     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));extern char *l64a (long int __n) __attribute__ ((__nothrow__ , __leaf__)) ;
extern long int a64l (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;
typedef __loff_t loff_t;
typedef __ino_t ino_t;
typedef __dev_t dev_t;
typedef __gid_t gid_t;
typedef __mode_t mode_t;
typedef __nlink_t nlink_t;
typedef __uid_t uid_t;
typedef __pid_t pid_t;
typedef __id_t id_t;
typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;
typedef __key_t key_t;
typedef __clock_t clock_t;
typedef __time_t time_t;
typedef __clockid_t clockid_t;
typedef __timer_t timer_t;
typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;
typedef unsigned int u_int8_t __attribute__ ((__mode__ (__QI__)));
typedef unsigned int u_int16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int u_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int u_int64_t __attribute__ ((__mode__ (__DI__)));
typedef int register_t __attribute__ ((__mode__ (__word__)));
typedef int __sig_atomic_t;
typedef struct
  {    unsigned long int __val[(1024 / (8 * sizeof (unsigned long int)))];  } __sigset_t;typedef __sigset_t sigset_t;
struct timespec
  {    __time_t tv_sec;    __syscall_slong_t tv_nsec;  };struct timeval
  {    __time_t tv_sec;    __suseconds_t tv_usec;  };typedef __suseconds_t suseconds_t;
typedef long int __fd_mask;
typedef struct
  {    __fd_mask __fds_bits[1024 / (8 * (int) sizeof (__fd_mask))];  } fd_set;typedef __fd_mask fd_mask;
extern int select (int __nfds, fd_set *__restrict __readfds,
     fd_set *__restrict __writefds,     fd_set *__restrict __exceptfds,     struct timeval *__restrict __timeout);extern int pselect (int __nfds, fd_set *__restrict __readfds,
      fd_set *__restrict __writefds,      fd_set *__restrict __exceptfds,      const struct timespec *__restrict __timeout,      const __sigset_t *__restrict __sigmask);__extension__
extern unsigned int gnu_dev_major (unsigned long long int __dev)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));__extension__
extern unsigned int gnu_dev_minor (unsigned long long int __dev)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));__extension__
extern unsigned long long int gnu_dev_makedev (unsigned int __major,
            unsigned int __minor)     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));typedef __blksize_t blksize_t;
typedef __blkcnt_t blkcnt_t;
typedef __fsblkcnt_t fsblkcnt_t;
typedef __fsfilcnt_t fsfilcnt_t;
typedef unsigned long int pthread_t;
union pthread_attr_t
{
  char __size[56];  long int __align;};
typedef union pthread_attr_t pthread_attr_t;
typedef struct __pthread_internal_list
{
  struct __pthread_internal_list *__prev;  struct __pthread_internal_list *__next;} __pthread_list_t;
typedef union
{
  struct __pthread_mutex_s  {    int __lock;    unsigned int __count;    int __owner;    unsigned int __nusers;    int __kind;    short __spins;    short __elision;    __pthread_list_t __list;  } __data;  char __size[40];  long int __align;} pthread_mutex_t;
typedef union
{
  char __size[4];  int __align;} pthread_mutexattr_t;
typedef union
{
  struct  {    int __lock;    unsigned int __futex;    __extension__ unsigned long long int __total_seq;    __extension__ unsigned long long int __wakeup_seq;    __extension__ unsigned long long int __woken_seq;    void *__mutex;    unsigned int __nwaiters;    unsigned int __broadcast_seq;  } __data;  char __size[48];  __extension__ long long int __align;} pthread_cond_t;
typedef union
{
  char __size[4];  int __align;} pthread_condattr_t;
typedef unsigned int pthread_key_t;
typedef int pthread_once_t;
typedef union
{
  struct  {    int __lock;    unsigned int __nr_readers;    unsigned int __readers_wakeup;    unsigned int __writer_wakeup;    unsigned int __nr_readers_queued;    unsigned int __nr_writers_queued;    int __writer;    int __shared;    unsigned long int __pad1;    unsigned long int __pad2;    unsigned int __flags;  } __data;  char __size[56];  long int __align;} pthread_rwlock_t;
typedef union
{
  char __size[8];  long int __align;} pthread_rwlockattr_t;
typedef volatile int pthread_spinlock_t;
typedef union
{
  char __size[32];  long int __align;} pthread_barrier_t;
typedef union
{
  char __size[4];  int __align;} pthread_barrierattr_t;
extern long int random (void) __attribute__ ((__nothrow__ , __leaf__));
extern void srandom (unsigned int __seed) __attribute__ ((__nothrow__ , __leaf__));
extern char *initstate (unsigned int __seed, char *__statebuf,
   size_t __statelen) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));extern char *setstate (char *__statebuf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
struct random_data
  {    int32_t *fptr;    int32_t *rptr;    int32_t *state;    int rand_type;    int rand_deg;    int rand_sep;    int32_t *end_ptr;  };extern int random_r (struct random_data *__restrict __buf,
       int32_t *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));extern int srandom_r (unsigned int __seed, struct random_data *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));extern int initstate_r (unsigned int __seed, char *__restrict __statebuf,
   size_t __statelen,   struct random_data *__restrict __buf)     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4)));extern int setstate_r (char *__restrict __statebuf,
         struct random_data *__restrict __buf)     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));extern int rand (void) __attribute__ ((__nothrow__ , __leaf__));
extern void srand (unsigned int __seed) __attribute__ ((__nothrow__ , __leaf__));
extern int rand_r (unsigned int *__seed) __attribute__ ((__nothrow__ , __leaf__));
extern double drand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern double erand48 (unsigned short int __xsubi[3]) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern long int lrand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern long int nrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));extern long int mrand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern long int jrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));extern void srand48 (long int __seedval) __attribute__ ((__nothrow__ , __leaf__));
extern unsigned short int *seed48 (unsigned short int __seed16v[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));extern void lcong48 (unsigned short int __param[7]) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
struct drand48_data
  {    unsigned short int __x[3];    unsigned short int __old_x[3];    unsigned short int __c;    unsigned short int __init;    __extension__ unsigned long long int __a;  };extern int drand48_r (struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));extern int erand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,        double *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));extern int lrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));extern int nrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,        long int *__restrict __result)     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));extern int mrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));extern int jrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,        long int *__restrict __result)     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));extern int srand48_r (long int __seedval, struct drand48_data *__buffer)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));extern int seed48_r (unsigned short int __seed16v[3],
       struct drand48_data *__buffer) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));extern int lcong48_r (unsigned short int __param[7],
        struct drand48_data *__buffer)     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));extern void *malloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;
extern void *calloc (size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;extern void *realloc (void *__ptr, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));extern void free (void *__ptr) __attribute__ ((__nothrow__ , __leaf__));
extern void cfree (void *__ptr) __attribute__ ((__nothrow__ , __leaf__));
extern void *alloca (size_t __size) __attribute__ ((__nothrow__ , __leaf__));
extern void *valloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;
extern int posix_memalign (void **__memptr, size_t __alignment, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;extern void abort (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
extern int atexit (void (*__func) (void)) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int on_exit (void (*__func) (int __status, void *__arg), void *__arg)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));extern void exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
extern void _Exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
extern char *getenv (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
extern int putenv (char *__string) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int setenv (const char *__name, const char *__value, int __replace)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));extern int unsetenv (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int clearenv (void) __attribute__ ((__nothrow__ , __leaf__));
extern char *mktemp (char *__template) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int mkstemp (char *__template) __attribute__ ((__nonnull__ (1))) ;
extern int mkstemps (char *__template, int __suffixlen) __attribute__ ((__nonnull__ (1))) ;
extern char *mkdtemp (char *__template) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
extern int system (const char *__command) ;
extern char *realpath (const char *__restrict __name,
         char *__restrict __resolved) __attribute__ ((__nothrow__ , __leaf__)) ;typedef int (*__compar_fn_t) (const void *, const void *);
extern void *bsearch (const void *__key, const void *__base,
        size_t __nmemb, size_t __size, __compar_fn_t __compar)     __attribute__ ((__nonnull__ (1, 2, 5))) ;extern void qsort (void *__base, size_t __nmemb, size_t __size,
     __compar_fn_t __compar) __attribute__ ((__nonnull__ (1, 4)));extern int abs (int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;
extern long int labs (long int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;
__extension__ extern long long int llabs (long long int __x)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;extern div_t div (int __numer, int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;extern ldiv_t ldiv (long int __numer, long int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;__extension__ extern lldiv_t lldiv (long long int __numer,
        long long int __denom)     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;extern char *ecvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) ;extern char *fcvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) ;extern char *gcvt (double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3))) ;extern char *qecvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) ;extern char *qfcvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) ;extern char *qgcvt (long double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3))) ;extern int ecvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,     size_t __len) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));extern int fcvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,     size_t __len) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));extern int qecvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,      char *__restrict __buf, size_t __len)     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));extern int qfcvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,      char *__restrict __buf, size_t __len)     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));extern int mblen (const char *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));
extern int mbtowc (wchar_t *__restrict __pwc,
     const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));extern int wctomb (char *__s, wchar_t __wchar) __attribute__ ((__nothrow__ , __leaf__));
extern size_t mbstowcs (wchar_t *__restrict __pwcs,
   const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));extern size_t wcstombs (char *__restrict __s,
   const wchar_t *__restrict __pwcs, size_t __n)     __attribute__ ((__nothrow__ , __leaf__));extern int rpmatch (const char *__response) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
extern int getsubopt (char **__restrict __optionp,
        char *const *__restrict __tokens,        char **__restrict __valuep)     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2, 3))) ;extern int getloadavg (double __loadavg[], int __nelem)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));int talloc_version_major(void);
int talloc_version_minor(void);
typedef void TALLOC_CTX;
void *_talloc(const void *context, size_t size);
void *talloc_init(const char *fmt, ...) __attribute__ ((format (__printf__, 1, 2)));
int _talloc_free(void *ptr, const char *location);
void talloc_free_children(void *ptr);
void _talloc_set_destructor(const void *ptr, int (*_destructor)(void *));
void *_talloc_steal_loc(const void *new_ctx, const void *ptr, const char *location);
const char *talloc_set_name(const void *ptr, const char *fmt, ...) __attribute__ ((format (__printf__, 2, 3)));
void *_talloc_move(const void *new_ctx, const void *pptr);
void talloc_set_name_const(const void *ptr, const char *name);
void *talloc_named(const void *context, size_t size,
     const char *fmt, ...) __attribute__ ((format (__printf__, 3, 4)));void *talloc_named_const(const void *context, size_t size, const char *name);
void *_talloc_zero(const void *ctx, size_t size, const char *name);
const char *talloc_get_name(const void *ptr);
void *talloc_check_name(const void *ptr, const char *name);
void *talloc_parent(const void *ptr);
const char *talloc_parent_name(const void *ptr);
size_t talloc_total_size(const void *ptr);
size_t talloc_total_blocks(const void *ptr);
void *_talloc_memdup(const void *t, const void *p, size_t size, const char *name);
void *_talloc_get_type_abort(const void *ptr, const char *name, const char *location);
void *talloc_find_parent_byname(const void *ctx, const char *name);
void *talloc_pool(const void *context, size_t size);
void *_talloc_pooled_object(const void *ctx,
       size_t type_size,       const char *type_name,       unsigned num_subobjects,       size_t total_subobjects_size);int talloc_increase_ref_count(const void *ptr);
size_t talloc_reference_count(const void *ptr);
void *_talloc_reference_loc(const void *context, const void *ptr, const char *location);
int talloc_unlink(const void *context, void *ptr);
void *talloc_autofree_context(void);
size_t talloc_get_size(const void *ctx);
void talloc_show_parents(const void *context, FILE *file);
int talloc_is_parent(const void *context, const void *ptr);
void *talloc_reparent(const void *old_parent, const void *new_parent, const void *ptr);
void *_talloc_array(const void *ctx, size_t el_size, unsigned count, const char *name);
void *_talloc_zero_array(const void *ctx,
    size_t el_size,    unsigned count,    const char *name);void *_talloc_realloc_array(const void *ctx, void *ptr, size_t el_size, unsigned count, const char *name);
void *_talloc_realloc(const void *context, void *ptr, size_t size, const char *name);
void *talloc_realloc_fn(const void *context, void *ptr, size_t size);
char *talloc_strdup(const void *t, const char *p);
char *talloc_strdup_append(char *s, const char *a);
char *talloc_strdup_append_buffer(char *s, const char *a);
char *talloc_strndup(const void *t, const char *p, size_t n);
char *talloc_strndup_append(char *s, const char *a, size_t n);
char *talloc_strndup_append_buffer(char *s, const char *a, size_t n);
char *talloc_vasprintf(const void *t, const char *fmt, va_list ap) __attribute__ ((format (__printf__, 2, 0)));
char *talloc_vasprintf_append(char *s, const char *fmt, va_list ap) __attribute__ ((format (__printf__, 2, 0)));
char *talloc_vasprintf_append_buffer(char *s, const char *fmt, va_list ap) __attribute__ ((format (__printf__, 2, 0)));
char *talloc_asprintf(const void *t, const char *fmt, ...) __attribute__ ((format (__printf__, 2, 3)));
char *talloc_asprintf_append(char *s, const char *fmt, ...) __attribute__ ((format (__printf__, 2, 3)));
char *talloc_asprintf_append_buffer(char *s, const char *fmt, ...) __attribute__ ((format (__printf__, 2, 3)));
void talloc_report_depth_cb(const void *ptr, int depth, int max_depth,
       void (*callback)(const void *ptr,          int depth, int max_depth,          int is_ref,          void *private_data),       void *private_data);void talloc_report_depth_file(const void *ptr, int depth, int max_depth, FILE *f);
void talloc_report_full(const void *ptr, FILE *f);
void talloc_report(const void *ptr, FILE *f);
void talloc_enable_null_tracking(void);
void talloc_enable_null_tracking_no_autofree(void);
void talloc_disable_null_tracking(void);
void talloc_enable_leak_report(void);
void talloc_enable_leak_report_full(void);
void talloc_set_abort_fn(void (*abort_fn)(const char *reason));
void talloc_set_log_fn(void (*log_fn)(const char *message));
void talloc_set_log_stderr(void);
int talloc_set_memlimit(const void *ctx, size_t max_size);
typedef int32_t c2_coord_t;
enum {
 X = 0, Y,};
typedef union c2_pt_t {
 struct {  c2_coord_t x, y; }; c2_coord_t v[2];} c2_pt_t, *c2_pt_p;
typedef struct c2_segment_t {
 c2_pt_t a, b;} c2_segment_t, *c2_segment_p;
typedef union c2_rect_t {
 struct {  c2_pt_t tl, br; }; c2_coord_t v[4]; struct {  c2_coord_t l,t,r,b; };} c2_rect_t, *c2_rect_p;
int
c2_rect_contains_rect(
  c2_rect_p r1,  c2_rect_p r2 );int
c2_rect_clip_segment(
  c2_rect_p r,  c2_segment_p s,  c2_segment_p o,  char * outEdges );int
c2_rect_clip_rect(
  c2_rect_p r,  c2_rect_p s,  c2_rect_p o );int
c2_rect_intersect_rect(
  c2_rect_p s,  c2_rect_p r );enum {
 out_Left = (1 << 0), out_Top = (1 << 1), out_Right = (1 << 2), out_Bottom = (1 << 3),};
enum {
 corner_TopLeft = out_Left, corner_TopRight = out_Top, corner_BottomRight = out_Right, corner_BottomLeft = out_Bottom,};
uint8_t
c2_rect_get_out_code(
  c2_rect_p r,  c2_pt_p p );void
c2_rect_clip_pt(
  c2_rect_p r,  c2_pt_p p );uint8_t
c2_rect_get_next_edge(
  uint8_t inEdge,  int inCW );uint8_t
c2_rect_is_on_edge(
  c2_rect_p r,  c2_pt_p p );int
c2_rect_get_edge(
  c2_rect_p r,  uint8_t inEdge,  c2_segment_p outEdge );int
c2_rect_get_corner(
  c2_rect_p r,  uint8_t inCorner,  c2_pt_p outCorner,  int inCW );const char *
c2_rect_as_str(
  c2_rect_p r );static inline __attribute__((unused)) void
c2_pt_offset(
  c2_pt_p p,  c2_coord_t inX,  c2_coord_t inY){
 p->x += inX; p->y += inY;}
static inline __attribute__((unused)) int
c2_pt_equal(
  c2_pt_p p1,  c2_pt_p p2){
 return p1->v[0] == p2->v[0] && p2->v[1] == p2->v[1];}
static inline __attribute__((unused)) void
c2_pt_scale(
  c2_pt_p p,  float inFactor ){
 p->v[X] *= inFactor; p->v[Y] *= inFactor;}
static inline __attribute__((unused)) c2_segment_p
c2_segment_set(
  c2_segment_p s,  c2_coord_t x1,  c2_coord_t y1,  c2_coord_t x2,  c2_coord_t y2 ){
 s->a.v[X] = ((x1 < x2) ? x1 : x2); s->a.v[Y] = ((y1 < y2) ? y1 : y2); s->b.v[X] = ((x1 > x2) ? x1 : x2); s->b.v[Y] = ((y1 > y2) ? y1 : y2); return s;}
static inline __attribute__((unused)) int
c2_segment_equal(
 c2_segment_p s1, c2_segment_p s2){
 return (c2_pt_equal(&s1->a, &s2->a) && c2_pt_equal(&s1->b, &s2->b)) ||  (c2_pt_equal(&s1->a, &s2->b) && c2_pt_equal(&s1->b, &s2->a));}
static inline __attribute__((unused)) int
c2_segment_isempty(
  c2_segment_p s){
 return c2_pt_equal(&s->a, &s->b);}
static inline __attribute__((unused)) void
c2_segment_offset(
  c2_segment_p s,  c2_coord_t inX,  c2_coord_t inY ){
 c2_pt_offset(&s->a, inX, inY); c2_pt_offset(&s->b, inX, inY);}
static inline __attribute__((unused)) void
c2_segment_scale(
  c2_segment_p s,  double inFactor ){
 c2_pt_scale(&s->a, inFactor); c2_pt_scale(&s->b, inFactor);}
static inline __attribute__((unused)) c2_rect_p
c2_rect_set(
  c2_rect_p r,  c2_coord_t x1,  c2_coord_t y1,  c2_coord_t x2,  c2_coord_t y2 ){
 r->tl.v[X] = ((x1 < x2) ? x1 : x2); r->tl.v[Y] = ((y1 < y2) ? y1 : y2); r->br.v[X] = ((x1 > x2) ? x1 : x2); r->br.v[Y] = ((y1 > y2) ? y1 : y2); return r;}
static inline __attribute__((unused)) int
c2_rect_isempty(
  c2_rect_p r){
 return c2_pt_equal(&r->tl, &r->br);}
static inline __attribute__((unused)) int
c2_rect_equal(
  c2_rect_p r,  c2_rect_p o){
 return c2_pt_equal(&r->tl, &o->tl) && c2_pt_equal(&r->br, &o->br);}
static inline __attribute__((unused)) c2_coord_t
c2_rect_height(
  c2_rect_p r){
 return r->br.v[Y] - r->tl.v[Y];}
static inline __attribute__((unused)) c2_coord_t
c2_rect_width(
  c2_rect_p r){
 return r->br.v[X] - r->tl.v[X];}
static inline __attribute__((unused)) void
c2_rect_offset(
  c2_rect_p r,  c2_coord_t inX,  c2_coord_t inY){
 c2_pt_offset(&r->tl, inX, inY); c2_pt_offset(&r->br, inX, inY);}
static inline __attribute__((unused)) void
c2_rect_inset(
  c2_rect_p r,  c2_coord_t inX,  c2_coord_t inY){
 c2_pt_offset(&r->tl, inX, inY); c2_pt_offset(&r->br, -inX, -inY);}
static inline __attribute__((unused)) void
c2_rect_scale(
  c2_rect_p r,  double inFactor ){
 c2_pt_scale(&r->tl, inFactor); c2_pt_scale(&r->br, inFactor);}
static inline __attribute__((unused)) int
c2_rect_contains_pt(
  c2_rect_p r,  c2_pt_p p ){
 return (p->v[X] >= r->tl.v[X] && p->v[X] <= r->br.v[X]) &&   (p->v[Y] >= r->tl.v[Y] && p->v[Y] <= r->br.v[Y]);}
extern void *memcpy (void *__restrict __dest, const void *__restrict __src,
       size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));extern void *memmove (void *__dest, const void *__src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));extern void *memccpy (void *__restrict __dest, const void *__restrict __src,
        int __c, size_t __n)     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));extern void *memset (void *__s, int __c, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int memcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));extern void *memchr (const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));extern char *strcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));extern char *strncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));extern char *strcat (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));extern char *strncat (char *__restrict __dest, const char *__restrict __src,
        size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));extern int strcmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));extern int strncmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));extern int strcoll (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));extern size_t strxfrm (char *__restrict __dest,
         const char *__restrict __src, size_t __n)     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));typedef struct __locale_struct
{
  struct __locale_data *__locales[13];  const unsigned short int *__ctype_b;  const int *__ctype_tolower;  const int *__ctype_toupper;  const char *__names[13];} *__locale_t;
typedef __locale_t locale_t;
extern int strcoll_l (const char *__s1, const char *__s2, __locale_t __l)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));extern size_t strxfrm_l (char *__dest, const char *__src, size_t __n,
    __locale_t __l) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4)));extern char *strdup (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));extern char *strndup (const char *__string, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));extern char *strchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));extern char *strrchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));extern size_t strcspn (const char *__s, const char *__reject)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));extern size_t strspn (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));extern char *strpbrk (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));extern char *strstr (const char *__haystack, const char *__needle)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));extern char *strtok (char *__restrict __s, const char *__restrict __delim)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));extern char *__strtok_r (char *__restrict __s,
    const char *__restrict __delim,    char **__restrict __save_ptr)     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));extern char *strtok_r (char *__restrict __s, const char *__restrict __delim,
         char **__restrict __save_ptr)     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));extern size_t strlen (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));extern size_t strnlen (const char *__string, size_t __maxlen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));extern char *strerror (int __errnum) __attribute__ ((__nothrow__ , __leaf__));
extern int strerror_r (int __errnum, char *__buf, size_t __buflen) __asm__ ("" "__xpg_strerror_r") __attribute__ ((__nothrow__ , __leaf__))
                        __attribute__ ((__nonnull__ (2)));extern char *strerror_l (int __errnum, __locale_t __l) __attribute__ ((__nothrow__ , __leaf__));
extern void __bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern void bcopy (const void *__src, void *__dest, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));extern void bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern int bcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));extern char *index (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));extern char *rindex (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));extern int ffs (int __i) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
extern int strcasecmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));extern int strncasecmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));extern char *strsep (char **__restrict __stringp,
       const char *__restrict __delim)     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));extern char *strsignal (int __sig) __attribute__ ((__nothrow__ , __leaf__));
extern char *__stpcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));extern char *stpcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));extern char *__stpncpy (char *__restrict __dest,
   const char *__restrict __src, size_t __n)     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));extern char *stpncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));typedef void * cnode_p;
typedef int64_t cnode_int_t;
typedef float cnode_float_t;
typedef int cnode_bool_t;
enum {
 CNODE_NULL = 0, CNODE_STRING, CNODE_INT, CNODE_FLOAT, CNODE_BOOL, CNODE_ARRAY, CNODE_DICT, CNODE_PTR,};
cnode_p
cnode_new(
  cnode_p inParent,  const char *inKey);int
cnode_value_is_equal(
  cnode_p a,  cnode_p b );cnode_p
cnode_new_dict(
  cnode_p inParent,  const char *inKey);cnode_p
cnode_new_array(
  cnode_p inParent,  const char *inKey);cnode_p
cnode_new_string(
  cnode_p inParent,  const char *inKey,  const char *inVal );cnode_p
cnode_new_string_len(
  cnode_p inParent,  const char *inKey,  const char *inVal,  size_t inLen);cnode_p
cnode_new_string_nocopy(
  cnode_p inParent,  const char *inKey,  const char *inVal );cnode_p
cnode_set_string(
  cnode_p inNode,  const char *inVal );cnode_p
cnode_set_string_len(
  cnode_p inNode,  const char *inVal,  size_t inLen );const char *
cnode_get_string(
  cnode_p inNode,  const char * inDefault );const char *
cnode_to_string(
 cnode_p inNode, const char * inDefault );cnode_p
cnode_concat_string(
  cnode_p inNode,  const char *inVal );cnode_p
cnode_concat_string_len(
  cnode_p inNode,  const char *inVal,  size_t inLen );cnode_p
cnode_new_ptr(
  cnode_p inParent,  const char *inKey,  void *inVal );cnode_p
cnode_set_ptr(
  cnode_p inNode,  void * inVal );void *
cnode_get_ptr(
  cnode_p inNode,  void * inDefault );cnode_p
cnode_new_bool(
  cnode_p inParent,  const char *inKey,  int inVal );cnode_p
cnode_set_bool(
  cnode_p inNode,  int inVal );int
cnode_get_bool(
  cnode_p inNode,  int inDefault );int
cnode_to_bool(
 cnode_p inNode, int inDefault );cnode_p
cnode_new_int(
  cnode_p inParent,  const char *inKey,  cnode_int_t inVal );cnode_p
cnode_set_int(
  cnode_p inNode,  cnode_int_t inVal );cnode_int_t
cnode_get_int(
  cnode_p inNode,  cnode_int_t inDefault );cnode_int_t
cnode_add_int(
  cnode_p inNode,  cnode_int_t inOffset );cnode_int_t
cnode_to_int(
 cnode_p inNode, cnode_int_t inDefault );cnode_p
cnode_new_float(
  cnode_p inParent,  const char *inKey,  float inVal );cnode_p
cnode_set_float(
  cnode_p inNode,  float inVal );float
cnode_get_float(
  cnode_p inNode,  float inDefault );float
cnode_to_float(
 cnode_p inNode, float inDefault );cnode_p
cnode_set_value(
  cnode_p inNode,  cnode_p inValue );void
cnode_delete(
  cnode_p inNode );void
cnode_clear(
  cnode_p inNode );void
cnode_detach(
  cnode_p inNode );cnode_p
cnode_to_array(
 cnode_p inNode );cnode_p
cnode_add_string(
  cnode_p n,  const char *s );uint8_t
cnode_get_type(
  cnode_p inNode );size_t
cnode_count_subnodes(
  cnode_p inNode );cnode_p
cnode_get_subnode(
  cnode_p inNode,  int inIndex );cnode_p
cnode_get_subnode_named(
  cnode_p inNode,  const char * name );int
cnode_get_dirty(
  cnode_p inNode );cnode_p
cnode_get_root(
  cnode_p inNode);void
cnode_set_dirty(
  cnode_p inNode,  int inDirty);void
cnode_set_lazy(
  cnode_p inNode,  int inLazy);int
cnode_get_lazy(
  cnode_p inNode );void
cnode_set_lock(
  cnode_p inNode,  int inLock);int
cnode_get_lock(
  cnode_p inNode );cnode_p
cnode_next(
  cnode_p inNode );cnode_p
cnode_get_parent(
  cnode_p inNode );void
cnode_set_key(
  cnode_p inNode,  const char *inKey );const char *
cnode_get_key(
  cnode_p inNode);cnode_p
cnode_add(
 cnode_p inParent, cnode_p inNode );enum {
 CNODE_LOOKUP_CREATE = (1 << 0),};
cnode_p
cnode_lookup(
  cnode_p inNode,  const char * inKey,  uint16_t inFlags );const char *
cnode_lookup_string(
  cnode_p inNode,  const char * inPath,  const char * inDefault );int
cnode_lookup_bool(
  cnode_p inNode,  const char * inPath,  int inDefault );cnode_int_t
cnode_lookup_int(
  cnode_p inNode,  const char * inPath,  cnode_int_t inDefault );float
cnode_lookup_float(
  cnode_p inNode,  const char * inPath,  float inDefault );enum {
 CNODE_JSON_JS = (1 << 0), CNODE_JSON_HUMAN = (1 << 1), CNODE_JSON_ANON = (1 << 2),};
char *
cnode_json(
  cnode_p inNode,  uint16_t inFlags );cnode_p
cnode_from_json(
  const char * json,  uint16_t inFlags );cnode_p
cnode_override(
  cnode_p root,  cnode_p overrride );typedef int (*cnode_traverse_match_p)(
  cnode_p node,  void * param );int
cnode_traverse_tree(
  cnode_p node,  const char * key,  cnode_p value,  cnode_traverse_match_p match,  void * param );typedef struct c_str_t {
 uint32_t hash : 16, rom : 1, alloc : 1; char * str;} c_str_t, *c_str_p;
c_str_p
c_str_new(
  const char * copy);c_str_p
c_str_new_sprintf(
  const char * format,  ... );c_str_p
c_str_new_copy(
  c_str_p copy);void
c_str_free(
  c_str_p str);c_str_p
c_str_set(
  c_str_p str,  c_str_p copy );c_str_p
c_str_set_str(
  c_str_p str,  const char * copy );c_str_p
c_str_set_str_len(
  c_str_p str,  const char * copy,  size_t len);c_str_p
c_str_sprintf(
  c_str_p str,  const char * format,  ... );c_str_p
c_str_add_str(
  c_str_p str,  const char * copy );c_str_p
c_str_add_sprintf(
  c_str_p str,  const char * format,  ... );c_str_p
c_str_clear(
  c_str_p str);c_str_p
c_str_alloc(
  c_str_p str,  size_t size );int
c_str_cmp(
  c_str_p s1,  c_str_p s2 );static inline
char *
c_str_get(
  c_str_p str ){
 return str ? str->str : ((void *)0);}
uint16_t
c_str_get_hash(
  c_str_p str );enum {
 C_STR_REPLACE_ONCE = (1 << 0), C_STR_REPLACE_CASE = (1 << 1),};
int
c_str_replace(
  c_str_p str,  const char * keyword,  const char * replace,  uint8_t flags );enum {
 UI_STYLE_ALIGN_CENTER = 0, UI_STYLE_ALIGN_LEFT, UI_STYLE_ALIGN_TOP, UI_STYLE_ALIGN_RIGHT, UI_STYLE_ALIGN_BOTTOM,};
typedef union ui_color_t {
 struct {  uint8_t r,g,b,a; }; uint32_t value; uint8_t v[4];} ui_color_t, *ui_color_p;
typedef union ui_style_flags_t {
 struct {  uint32_t dirty : 1,    backColor : 1,    foreColor : 1,    fontSize : 1,    fontBold : 1,    font : 1,    textAlign : 1,    verticalAlign : 1,    background: 1,    border : 1,    borderColor : 1,    borderRadius : 1; }; uint32_t flags;} ui_style_flags_t;
typedef struct ui_style_t {
 ui_style_flags_t flags; ui_color_t backColor; ui_color_t foreColor; ui_color_t borderColor; c_str_p font; c_str_p background; uint32_t fontSize : 8,    fontBold : 1; uint32_t border : 4,    borderRadius: 8; uint32_t textAlign : 3,    verticalAlign : 3;} ui_style_t, *ui_style_p;
void
ui_style_init(
  ui_style_p st);void
ui_style_clear(
  ui_style_p st);int
ui_style_load(
  ui_style_p s,  cnode_p node);int
ui_style_apply(
  ui_style_p d,  ui_style_p s );cnode_p
ui_style_to_node(
  ui_style_p s );uint32_t
ui_style_get_hash(
  ui_style_p s );enum {
 UI_OBJECT_GENERIC = 0, UI_OBJECT_ROOT, UI_OBJECT_RECT, UI_OBJECT_OFFSCREEN, UI_OBJECT_FOCUSABLE, UI_OBJECT_EDITABLE, UI_OBJECT_PAGE,};
struct ui_object_t;
enum { ui_object_array_page_size = 16 }; typedef struct ui_object_t* ui_object_array_element_t; typedef uint32_t ui_object_array_count_t; typedef struct ui_object_array_t { volatile ui_object_array_count_t count; volatile ui_object_array_count_t size; ui_object_array_element_t * e; } ui_object_array_t, *ui_object_array_p;;
static __attribute__ ((unused)) inline void ui_object_array_free( ui_object_array_p a) { if (!a) return; if (a->e) free(a->e); a->count = a->size = 0; a->e = ((void *)0);}static __attribute__ ((unused)) inline void ui_object_array_clear( ui_object_array_p a) { if (!a) return; a->count = 0;}static __attribute__ ((unused)) inline void ui_object_array_realloc( ui_object_array_p a, ui_object_array_count_t size) { if (!a || a->size == size) return; if (size == 0) { if (a->e) free(a->e); a->e = ((void *)0); } else a->e = realloc(a->e, size * sizeof(ui_object_array_element_t)); a->size = size; }static __attribute__ ((unused)) inline void ui_object_array_trim( ui_object_array_p a) { if (!a) return; ui_object_array_count_t n = a->count + ui_object_array_page_size; n -= (n % ui_object_array_page_size); if (n != a->size) ui_object_array_realloc(a, n);}static __attribute__ ((unused)) inline ui_object_array_element_t * ui_object_array_get_ptr( ui_object_array_p a, ui_object_array_count_t index) { if (!a) return ((void *)0); if (index > a->count) index = a->count; return index < a->count ? a->e + index : ((void *)0);}static __attribute__ ((unused)) inline ui_object_array_count_t ui_object_array_add( ui_object_array_p a, ui_object_array_element_t e) { if (!a) return 0; if (a->count + 1 >= a->size) ui_object_array_realloc(a, a->size + ui_object_array_page_size); a->e[a->count++] = e; return a->count;}static __attribute__ ((unused)) inline ui_object_array_count_t ui_object_array_push( ui_object_array_p a, ui_object_array_element_t e) { return ui_object_array_add(a, e);}static __attribute__ ((unused)) inline int ui_object_array_pop( ui_object_array_p a, ui_object_array_element_t *e) { if (a->count) { *e = a->e[--a->count]; return 1; } return 0;}static __attribute__ ((unused)) inline ui_object_array_count_t ui_object_array_insert( ui_object_array_p a, ui_object_array_count_t index, ui_object_array_element_t * e, ui_object_array_count_t count) { if (!a) return 0; if (index > a->count) index = a->count; if (a->count + count >= a->size) ui_object_array_realloc(a, (((a->count + count) / ui_object_array_page_size)+1) * ui_object_array_page_size); if (index < a->count) memmove(&a->e[index + count], &a->e[index], (a->count - index + count) * sizeof(ui_object_array_element_t)); memmove(&a->e[index], e, count * sizeof(ui_object_array_element_t)); a->count += count; return a->count;}static __attribute__ ((unused)) inline ui_object_array_count_t ui_object_array_delete( ui_object_array_p a, ui_object_array_count_t index, ui_object_array_count_t count) { if (!a) return 0; if (index > a->count) index = a->count; if (index + count > a->count) count = a->count - index; if (count && a->count - index) { memmove(&a->e[index], &a->e[index + count], (a->count - index - count) * sizeof(ui_object_array_element_t)); } a->count -= count; return a->count;};
enum { string_array_page_size = 4 }; typedef const char * string_array_element_t; typedef uint32_t string_array_count_t; typedef struct string_array_t { volatile string_array_count_t count; volatile string_array_count_t size; string_array_element_t * e; } string_array_t, *string_array_p;;
static __attribute__ ((unused)) inline void string_array_free( string_array_p a) { if (!a) return; if (a->e) free(a->e); a->count = a->size = 0; a->e = ((void *)0);}static __attribute__ ((unused)) inline void string_array_clear( string_array_p a) { if (!a) return; a->count = 0;}static __attribute__ ((unused)) inline void string_array_realloc( string_array_p a, string_array_count_t size) { if (!a || a->size == size) return; if (size == 0) { if (a->e) free(a->e); a->e = ((void *)0); } else a->e = realloc(a->e, size * sizeof(string_array_element_t)); a->size = size; }static __attribute__ ((unused)) inline void string_array_trim( string_array_p a) { if (!a) return; string_array_count_t n = a->count + string_array_page_size; n -= (n % string_array_page_size); if (n != a->size) string_array_realloc(a, n);}static __attribute__ ((unused)) inline string_array_element_t * string_array_get_ptr( string_array_p a, string_array_count_t index) { if (!a) return ((void *)0); if (index > a->count) index = a->count; return index < a->count ? a->e + index : ((void *)0);}static __attribute__ ((unused)) inline string_array_count_t string_array_add( string_array_p a, string_array_element_t e) { if (!a) return 0; if (a->count + 1 >= a->size) string_array_realloc(a, a->size + string_array_page_size); a->e[a->count++] = e; return a->count;}static __attribute__ ((unused)) inline string_array_count_t string_array_push( string_array_p a, string_array_element_t e) { return string_array_add(a, e);}static __attribute__ ((unused)) inline int string_array_pop( string_array_p a, string_array_element_t *e) { if (a->count) { *e = a->e[--a->count]; return 1; } return 0;}static __attribute__ ((unused)) inline string_array_count_t string_array_insert( string_array_p a, string_array_count_t index, string_array_element_t * e, string_array_count_t count) { if (!a) return 0; if (index > a->count) index = a->count; if (a->count + count >= a->size) string_array_realloc(a, (((a->count + count) / string_array_page_size)+1) * string_array_page_size); if (index < a->count) memmove(&a->e[index + count], &a->e[index], (a->count - index + count) * sizeof(string_array_element_t)); memmove(&a->e[index], e, count * sizeof(string_array_element_t)); a->count += count; return a->count;}static __attribute__ ((unused)) inline string_array_count_t string_array_delete( string_array_p a, string_array_count_t index, string_array_count_t count) { if (!a) return 0; if (index > a->count) index = a->count; if (index + count > a->count) count = a->count - index; if (count && a->count - index) { memmove(&a->e[index], &a->e[index + count], (a->count - index - count) * sizeof(string_array_element_t)); } a->count -= count; return a->count;};
typedef union ui_object_flags_t {
 struct {  uint32_t hidden : 1,     dirty : 1; }; uint32_t value;} ui_object_flags_t, *ui_object_flags_p;
typedef struct ui_object_t {
 struct ui_object_t * parent; ui_object_flags_t flags; uint32_t kind; c2_rect_t bounds; c2_pt_t origin; ui_object_array_p sub; c_str_p text; string_array_t class; cnode_p node; ui_style_t style;} ui_object_t, *ui_object_p;
ui_object_p
ui_object_create(
  ui_object_p parent,  uint32_t kind,  cnode_p node);void
ui_object_dispose(
  ui_object_p o );void
ui_object_class_set(
  ui_object_p o,  const char * classname );int
ui_object_has_class(
  ui_object_p o,  const char * classname );void
ui_object_add_class(
 ui_object_p o, const char * classname );void
ui_object_remove_class(
 ui_object_p o, const char * classname );char *
ui_object_class_get(
  ui_object_p o );ui_object_p
ui_object_find(
  ui_object_p o,  const char *class_or_id );cnode_p
ui_object_get_style_node(
  ui_object_p o );cnode_p
ui_object_get_font_node(
  ui_object_p o );void
ui_object_sub_add(
  ui_object_p o,  ui_object_p s);size_t
ui_object_sub_count(
  ui_object_p o );void
ui_object_detach(
  ui_object_p o);ui_object_p
ui_object_get_root(
  ui_object_p o);void
ui_object_dirty(
  ui_object_p o,  _Bool dirty);void
ui_object_set_visible(
  ui_object_p o,  _Bool visible);void
ui_object_set_bounds(
  ui_object_p o,  c2_rect_p bounds);void
ui_object_get_bounds(
  ui_object_p o,  ui_object_p relative,  c2_rect_p bounds);void
ui_object_set_style(
  ui_object_p o,  struct ui_style_t * style );struct ui_focus_t;
void
ui_object_set_focus(
  struct ui_object_t *o,  struct ui_focus_t * s,  _Bool focus);struct ui_style_t *
ui_object_get_style(
  ui_object_p o );void
ui_object_set_text(
  ui_object_p o,  const char * text );const char *
ui_object_get_text(
  ui_object_p o );void
ui_object_prepare(
  ui_object_p o );struct ui_context_t;
void
ui_object_draw(
  ui_object_p o,  struct ui_context_t * c );void
ui_object_draw_sub(
  ui_object_p o,  struct ui_context_t * c );struct ui_t;
struct ui_event_t;
struct ui_context_t;
struct ui_t *
ui_new(
  cnode_p base_node );struct ui_t *
ui_get();
void
ui_dispose(
  struct ui_t * ui);struct ui_object_t *
ui_page_load(
  struct ui_t * ui,  const char * name,  _Bool stack);struct ui_object_t *
ui_get_current_page(
  struct ui_t * ui );int
ui_get_size(
  struct ui_t * ui,  int * outWidth,  int * outHeight);void
ui_page_pop(
  struct ui_t * ui);int
ui_page_redraw(
  struct ui_t * ui,  struct ui_context_t * ctx );int
ui_page_event(
  struct ui_t * ui,  struct ui_event_t * ev );typedef struct c_evaluator_t {
 float control[32 * 2]; int order; double inv_tab[32]; float * ys; int ycount;} c_evaluator_t, *c_evaluator_p;
c_evaluator_p
c_ev_new(
  int inStepY );c_evaluator_p
c_ev_fromstring(
  const char * inString,  int inStepY );void
c_ev_free(
  c_evaluator_p inEv );float *
c_ev_get_y(
  c_evaluator_p inEv,  double t );float *
c_ev_eval(
  c_evaluator_p inEv,  float * out,  double t );int
c_ev_insert(
  c_evaluator_p inEv,  float * cp );float *
c_ev_getcontrol(
  c_evaluator_p inEv,  int index );char *
c_ev_get_string(
  c_evaluator_p inEv,  char * buffer,  size_t size);void
c_ev_set_string(
  c_evaluator_p inEv,  const char * inString );typedef struct list_head {
 struct list_head * next; struct list_head * prev;} list_head_t, *list_head_p;
static inline void INIT_LIST_HEAD(struct list_head *list)
{
 list->next = list; list->prev = list;}
static inline void __list_add(struct list_head *new,
         struct list_head *prev,         struct list_head *next){
 next->prev = new; new->next = next; new->prev = prev; prev->next = new;}
static inline void list_add(struct list_head *new, struct list_head *head)
{
 __list_add(new, head, head->next);}
static inline void list_add_tail(struct list_head *new, struct list_head *head)
{
 __list_add(new, head->prev, head);}
static inline void __list_del(struct list_head * prev, struct list_head * next)
{
 next->prev = prev; prev->next = next;}
static inline void __list_del_entry(struct list_head *entry)
{
 __list_del(entry->prev, entry->next);}
static inline void list_del(struct list_head *entry)
{
 __list_del(entry->prev, entry->next); entry->next = ((void *)0); entry->prev = ((void *)0);}
static inline void list_replace(struct list_head *old,
    struct list_head *new){
 new->next = old->next; new->next->prev = new; new->prev = old->prev; new->prev->next = new;}
static inline void list_replace_init(struct list_head *old,
     struct list_head *new){
 list_replace(old, new); INIT_LIST_HEAD(old);}
static inline void list_del_init(struct list_head *entry)
{
 __list_del_entry(entry); INIT_LIST_HEAD(entry);}
static inline void list_move(struct list_head *list, struct list_head *head)
{
 __list_del_entry(list); list_add(list, head);}
static inline void list_move_tail(struct list_head *list,
      struct list_head *head){
 __list_del_entry(list); list_add_tail(list, head);}
static inline int list_is_last(const struct list_head *list,
    const struct list_head *head){
 return list->next == head;}
static inline int list_empty(const struct list_head *head)
{
 return head->next == head;}
static inline int list_empty_careful(const struct list_head *head)
{
 struct list_head *next = head->next; return (next == head) && (next == head->prev);}
static inline void list_rotate_left(struct list_head *head)
{
 struct list_head *first; if (!list_empty(head)) {  first = head->next;  list_move_tail(first, head); }}
static inline int list_is_singular(const struct list_head *head)
{
 return !list_empty(head) && (head->next == head->prev);}
static inline void __list_cut_position(struct list_head *list,
  struct list_head *head, struct list_head *entry){
 struct list_head *new_first = entry->next; list->next = head->next; list->next->prev = list; list->prev = entry; entry->next = list; head->next = new_first; new_first->prev = head;}
static inline void list_cut_position(struct list_head *list,
  struct list_head *head, struct list_head *entry){
 if (list_empty(head))  return; if (list_is_singular(head) &&  (head->next != entry && head != entry))  return; if (entry == head)  INIT_LIST_HEAD(list); else  __list_cut_position(list, head, entry);}
static inline void __list_splice(const struct list_head *list,
     struct list_head *prev,     struct list_head *next){
 struct list_head *first = list->next; struct list_head *last = list->prev; first->prev = prev; prev->next = first; last->next = next; next->prev = last;}
static inline void list_splice(const struct list_head *list,
    struct list_head *head){
 if (!list_empty(list))  __list_splice(list, head, head->next);}
static inline void list_splice_tail(struct list_head *list,
    struct list_head *head){
 if (!list_empty(list))  __list_splice(list, head->prev, head);}
static inline void list_splice_init(struct list_head *list,
        struct list_head *head){
 if (!list_empty(list)) {  __list_splice(list, head, head->next);  INIT_LIST_HEAD(list); }}
static inline void list_splice_tail_init(struct list_head *list,
      struct list_head *head){
 if (!list_empty(list)) {  __list_splice(list, head->prev, head);  INIT_LIST_HEAD(list); }}
enum {
 C_TIME_RES = 100, C_TIME_SECOND = 10000, C_TIME_MS = (C_TIME_SECOND/1000),};
typedef uint64_t c_time_t;
c_time_t
c_time_get_stamp(
  c_time_t * base );typedef struct ui_transition_field_t {
 c2_pt_t position; c2_pt_t origin; c2_pt_t size; float alpha;} ui_transition_field_t, *ui_transition_field_p;
typedef struct ui_transition_target_t {
 ui_object_p target; void * param; union {  struct {   uint32_t position : 1,      origin : 1,      size : 1,      alpha : 1;  };  uint32_t value; } flags; ui_transition_field_t from, to; ui_transition_field_t now;} ui_transition_target_t, *ui_transition_target_p;
enum { ui_trans_target_array_page_size = 4 }; typedef ui_transition_target_t ui_trans_target_array_element_t; typedef uint32_t ui_trans_target_array_count_t; typedef struct ui_trans_target_array_t { volatile ui_trans_target_array_count_t count; volatile ui_trans_target_array_count_t size; ui_trans_target_array_element_t * e; } ui_trans_target_array_t, *ui_trans_target_array_p;;
static __attribute__ ((unused)) inline void ui_trans_target_array_free( ui_trans_target_array_p a) { if (!a) return; if (a->e) free(a->e); a->count = a->size = 0; a->e = ((void *)0);}static __attribute__ ((unused)) inline void ui_trans_target_array_clear( ui_trans_target_array_p a) { if (!a) return; a->count = 0;}static __attribute__ ((unused)) inline void ui_trans_target_array_realloc( ui_trans_target_array_p a, ui_trans_target_array_count_t size) { if (!a || a->size == size) return; if (size == 0) { if (a->e) free(a->e); a->e = ((void *)0); } else a->e = realloc(a->e, size * sizeof(ui_trans_target_array_element_t)); a->size = size; }static __attribute__ ((unused)) inline void ui_trans_target_array_trim( ui_trans_target_array_p a) { if (!a) return; ui_trans_target_array_count_t n = a->count + ui_trans_target_array_page_size; n -= (n % ui_trans_target_array_page_size); if (n != a->size) ui_trans_target_array_realloc(a, n);}static __attribute__ ((unused)) inline ui_trans_target_array_element_t * ui_trans_target_array_get_ptr( ui_trans_target_array_p a, ui_trans_target_array_count_t index) { if (!a) return ((void *)0); if (index > a->count) index = a->count; return index < a->count ? a->e + index : ((void *)0);}static __attribute__ ((unused)) inline ui_trans_target_array_count_t ui_trans_target_array_add( ui_trans_target_array_p a, ui_trans_target_array_element_t e) { if (!a) return 0; if (a->count + 1 >= a->size) ui_trans_target_array_realloc(a, a->size + ui_trans_target_array_page_size); a->e[a->count++] = e; return a->count;}static __attribute__ ((unused)) inline ui_trans_target_array_count_t ui_trans_target_array_push( ui_trans_target_array_p a, ui_trans_target_array_element_t e) { return ui_trans_target_array_add(a, e);}static __attribute__ ((unused)) inline int ui_trans_target_array_pop( ui_trans_target_array_p a, ui_trans_target_array_element_t *e) { if (a->count) { *e = a->e[--a->count]; return 1; } return 0;}static __attribute__ ((unused)) inline ui_trans_target_array_count_t ui_trans_target_array_insert( ui_trans_target_array_p a, ui_trans_target_array_count_t index, ui_trans_target_array_element_t * e, ui_trans_target_array_count_t count) { if (!a) return 0; if (index > a->count) index = a->count; if (a->count + count >= a->size) ui_trans_target_array_realloc(a, (((a->count + count) / ui_trans_target_array_page_size)+1) * ui_trans_target_array_page_size); if (index < a->count) memmove(&a->e[index + count], &a->e[index], (a->count - index + count) * sizeof(ui_trans_target_array_element_t)); memmove(&a->e[index], e, count * sizeof(ui_trans_target_array_element_t)); a->count += count; return a->count;}static __attribute__ ((unused)) inline ui_trans_target_array_count_t ui_trans_target_array_delete( ui_trans_target_array_p a, ui_trans_target_array_count_t index, ui_trans_target_array_count_t count) { if (!a) return 0; if (index > a->count) index = a->count; if (index + count > a->count) count = a->count - index; if (count && a->count - index) { memmove(&a->e[index], &a->e[index + count], (a->count - index - count) * sizeof(ui_trans_target_array_element_t)); } a->count -= count; return a->count;};
enum {
 TRANSITION_INIT = 0, TRANSITION_START, TRANSITION_RUN, TRANSISION_DONE,};
struct ui_transition_t;
typedef void (*ui_trans_callback_p) (
  int state,  struct ui_transition_t * t,  void * param );typedef struct ui_transition_t {
 list_head_t queue; c_evaluator_p evaluator; c_time_t start, end; int state; ui_trans_callback_p callback; void * callback_param; ui_trans_target_array_t target;} ui_transition_t, *ui_transition_p;
typedef struct ui_transision_queue_t {
 c_time_t timeBase; list_head_t queue;} ui_transision_queue_t, *ui_transision_queue_p;
void
ui_transision_queue_init(
  ui_transision_queue_p q );void
ui_transision_queue_free(
  ui_transision_queue_p q );void
ui_transision_queue_evaluate(
  ui_transision_queue_p q );ui_transition_p
ui_transition_new(
  ui_transision_queue_p queue,  const char * transition,  c_time_t duration );void
ui_transition_set_callback(
  ui_transition_p t,  ui_trans_callback_p callback,  void * param );void
ui_transistion_dispose(
  ui_transition_p t );int
ui_transision_evaluate(
  ui_transition_p t,  c_time_t now );struct ui_t;
void
ui_set_form_values(
  struct ui_t * ui,  cnode_p values );cnode_p
ui_get_form_values(
  struct ui_t * ui );enum {
 C_SIGNAL_END0 = 0, C_SIGNAL_END1};
typedef struct c_signal_t {
 int fd[2]; c_time_t base; struct {  c_time_t signaled, picked; } stamp[2];} c_signal_t, *c_signal_p;
c_signal_p
c_signal_new();
void
c_signal_free(
  c_signal_p s);void
c_signal(
  c_signal_p s,  int end,  uint8_t what );uint8_t
c_signal_wait(
  c_signal_p s,  int end,  c_time_t inTimeout );uint8_t
c_signal_get(
  c_signal_p s,  int end);void
c_signal_flush(
  c_signal_p s,  int end);typedef uint64_t c_pq_rank_t;
typedef struct c_pq_elem_t {
 list_head_t queue; c_pq_rank_t rank;} c_pq_elem_t, *c_pq_elem_p;
typedef struct c_pq_t {
 list_head_t pending; list_head_t free;} c_pq_t, *c_pq_p;
void
c_pq_init(
  c_pq_p q);void
c_pq_add_free(
  c_pq_p q,  c_pq_elem_p e );c_pq_elem_p
c_pq_detach_free(
  c_pq_p q );void
c_pq_insert_pending(
  c_pq_p q,  c_pq_elem_p e );c_pq_elem_p
c_pq_get_pending(
  c_pq_p q );typedef int (*c_pq_iter_cb)(
  c_pq_p q,  void * param,  c_pq_elem_p e);void
c_pq_iterate_pending(
  c_pq_p q,  c_pq_iter_cb cb,  void * param );void
c_pq_detach(
  c_pq_p q,  c_pq_elem_p e );typedef uint32_t c_runloop_task_id_t;
typedef c_time_t (*c_runloop_timer_p)(void * param);
typedef void (*c_runloop_task_p)(void * param);
typedef void (*c_runloop_done_p)(void * param);
typedef struct c_runloop_call_t {
 c_runloop_task_id_t tid; c_pq_elem_t queue; c_runloop_task_p task; c_runloop_timer_p timer; c_runloop_done_p done; void * param; c_time_t when;} c_runloop_call_t, *c_runloop_call_p;
enum { c_runloop_fifo_overflow_f = (1 << 0) }; enum { c_runloop_fifo_fifo_size = (32) }; typedef struct c_runloop_fifo_t { c_runloop_call_t buffer[c_runloop_fifo_fifo_size]; uint16_t read; uint16_t write; uint8_t flags; } c_runloop_fifo_t;
typedef struct c_runloop_t {
 int verbose : 2; c_time_t timebase; c_signal_p signal; c_pq_t timers; c_runloop_call_t timer_store[64]; c_runloop_fifo_t fifo;} c_runloop_t, *c_runloop_p;
void
c_runloop_init(
  c_runloop_p loop);void
c_runloop_free(
  c_runloop_p loop);int
c_runloop_get_fd(
  c_runloop_p loop);int
c_runloop_has_timers(
  c_runloop_p loop);c_runloop_task_id_t
c_runloop_schedule(
  c_runloop_p loop,  c_runloop_task_p task,  c_runloop_timer_p timer,  c_runloop_done_p done,  void * param,  c_time_t howlong );c_runloop_task_id_t
c_runloop_schedule_timer(
  c_runloop_p loop,  c_runloop_timer_p timer,  c_runloop_done_p done,  void * param,  c_time_t howlong );int
c_runloop_schedule_task(
  c_runloop_p loop,  c_runloop_task_p task,  void * param );void
c_runloop_cancel(
  c_runloop_p loop,  c_runloop_timer_p timer );void
c_runloop_cancel_id(
  c_runloop_p loop,  c_runloop_task_id_t tid );void
c_runloop_run(
  c_runloop_p loop );enum {
 ASYNC_SYSTEM_START = 0, ASYNC_SYSTEM_LINE, ASYNC_SYSTEM_DONE, ASYNC_SYSTEM_ERROR,};
typedef void (*async_system_cb)(
  int kind,  const char * line );int
async_system(
  const char * cmd,  async_system_cb cb );struct c_runloop_t;
struct c_runloop_t *
txui_get_runloop();
cnode_p preset_cnode(void);
]]
