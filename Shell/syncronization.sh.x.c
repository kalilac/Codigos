#if 0
	shc Version 3.8.9, Generic Script Compiler
	Copyright (c) 1994-2012 Francisco Rosales <frosal@fi.upm.es>

	shc -T -f syncronization.sh 
#endif

static  char data [] = 
#define      date_z	1
#define      date	((&data[0]))
	"\011"
#define      tst2_z	19
#define      tst2	((&data[5]))
	"\367\130\117\036\145\005\002\374\215\333\326\005\232\236\107\236"
	"\101\221\112\373\265\365\121\102\304\330\330"
#define      xecc_z	15
#define      xecc	((&data[28]))
	"\362\012\263\013\001\361\257\036\214\250\257\323\050\061\255"
#define      shll_z	10
#define      shll	((&data[44]))
	"\277\105\111\157\164\266\260\351\145\115\007\247"
#define      lsto_z	1
#define      lsto	((&data[55]))
	"\214"
#define      inlo_z	3
#define      inlo	((&data[56]))
	"\351\301\046"
#define      tst1_z	22
#define      tst1	((&data[60]))
	"\134\167\120\314\373\264\136\145\004\254\367\103\010\126\265\140"
	"\007\357\267\373\257\310\230\150"
#define      chk1_z	22
#define      chk1	((&data[84]))
	"\013\074\070\267\200\060\041\370\307\237\344\052\274\122\000\250"
	"\213\155\170\157\100\237\057\074"
#define      msg2_z	19
#define      msg2	((&data[108]))
	"\326\017\222\301\300\164\326\271\070\102\310\165\123\027\167\310"
	"\205\132\266\311\040"
#define      rlax_z	1
#define      rlax	((&data[128]))
	"\136"
#define      opts_z	1
#define      opts	((&data[129]))
	"\343"
#define      text_z	438
#define      text	((&data[171]))
	"\157\266\250\201\000\052\062\057\172\144\214\343\233\322\035\247"
	"\016\261\002\152\207\042\236\066\236\324\005\104\234\145\252\014"
	"\033\122\215\033\175\300\113\370\044\132\055\157\177\321\333\054"
	"\275\237\322\237\032\360\300\335\256\147\212\232\332\127\112\126"
	"\066\057\307\104\157\346\356\013\323\307\267\245\064\054\151\121"
	"\235\213\017\147\014\344\064\052\347\215\074\115\147\341\253\241"
	"\373\304\173\004\005\141\235\117\111\027\350\003\274\215\365\232"
	"\254\262\201\344\340\372\040\276\211\375\227\336\034\071\254\212"
	"\272\252\166\176\121\345\321\260\111\342\126\245\030\230\363\352"
	"\011\316\134\355\167\342\113\223\311\304\072\131\030\042\002\267"
	"\250\273\054\310\214\024\155\204\222\202\275\255\146\076\355\031"
	"\076\231\127\074\022\303\042\014\337\130\073\126\224\230\341\062"
	"\265\121\062\234\370\330\320\276\215\213\305\164\115\113\216\036"
	"\112\067\113\142\046\275\266\042\002\252\036\076\205\123\176\026"
	"\210\054\330\056\234\346\260\305\132\160\372\160\073\054\176\046"
	"\213\376\171\042\005\172\132\261\343\265\063\175\361\062\126\022"
	"\011\325\344\152\172\125\174\160\102\372\054\264\345\075\372\160"
	"\300\155\163\334\212\277\206\165\267\122\334\153\102\320\105\017"
	"\025\110\315\052\217\265\213\105\114\237\363\157\115\374\334\230"
	"\355\372\026\077\363\172\301\010\371\217\251\140\131\276\234\010"
	"\060\175\170\067\140\042\217\242\156\371\213\215\042\325\326\177"
	"\302\274\002\125\302\117\156\144\021\112\374\277\044\334\323\336"
	"\214\340\255\023\202\257\216\332\050\301\042\260\221\363\214\042"
	"\346\152\163\261\367\007\273\335\350\013\155\322\150\101\376\057"
	"\164\166\144\076\334\105\067\130\143\163\351\052\077\201\244\151"
	"\056\337\060\332\061\153\255\341\126\341\220\035\115\213\240\150"
	"\061\233\172\324\250\113\250\213\173\246\152\242\126\211\033\241"
	"\123\157\331\350\111\342\275\264\123\052\271\207\162\132\074\375"
	"\224\313\162\037\016\250\344\307\265\023\140\254\366\222\131\063"
	"\311\110\146\335\340\213\242\256\005\303\076\243\351\260\233\327"
	"\333\277\251\371\147\270\252\151\042\062\214\301\150\053\225\155"
	"\157\062\323\032\077\356\155\315\012\353\215\125\343\261\055\276"
	"\161\327\270\330\217\143\102\262\225\316"
#define      chk2_z	19
#define      chk2	((&data[656]))
	"\011\153\151\074\372\172\223\327\036\336\307\246\355\357\251\022"
	"\234\050\325\373\106\051\116\076\204\173\055"
#define      pswd_z	256
#define      pswd	((&data[697]))
	"\334\325\215\300\207\273\177\371\222\067\322\041\233\024\323\061"
	"\343\107\244\126\130\324\256\123\073\257\033\153\220\267\276\137"
	"\201\375\201\352\217\011\333\007\047\305\013\253\262\235\002\126"
	"\317\247\255\050\173\134\173\267\014\226\043\234\115\342\374\317"
	"\340\175\271\157\207\225\166\256\132\202\132\014\040\135\143\360"
	"\004\021\030\200\155\223\067\171\052\133\026\170\075\022\107\035"
	"\220\001\214\027\226\003\306\360\206\041\374\247\176\140\227\203"
	"\161\257\004\336\103\074\130\155\227\157\346\324\202\055\361\022"
	"\056\176\052\305\202\360\265\011\022\262\260\221\022\107\024\203"
	"\367\031\142\072\125\273\250\354\052\216\301\254\274\263\277\353"
	"\062\351\260\264\332\145\276\354\027\156\175\052\266\222\256\256"
	"\253\021\350\000\314\221\355\367\040\256\244\334\141\143\307\224"
	"\115\170\110\047\335\006\024\365\165\222\040\054\044\316\332\317"
	"\337\303\320\254\124\276\244\165\154\110\121\316\254\031\142\372"
	"\222\253\041\157\262\066\145\050\310\206\124\354\124\056\274\064"
	"\362\215\341\107\113\205\274\270\316\015\207\173\047\351\165\271"
	"\225\227\051\110\315\217\160\226\025\304\202\152\363\077\237\345"
	"\315\200\057\335\120\233\107\214\332\313\007\007\275\120\077\232"
#define      msg1_z	42
#define      msg1	((&data[975]))
	"\255\210\331\246\032\021\170\074\017\057\332\275\373\160\363\145"
	"\301\146\274\032\075\101\201\177\215\271\321\360\302\137\130\276"
	"\167\303\156\033\021\023\023\052\073\120\105\026\202\177\375\123"
	"\322\363\254\215\020"/* End of data[] */;
#define      hide_z	4096
#define DEBUGEXEC	0	/* Define as 1 to debug execvp calls */
#define TRACEABLE	1	/* Define as 1 to enable ptrace the executable */

/* rtc.c */

#include <sys/stat.h>
#include <sys/types.h>

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

/* 'Alleged RC4' */

static unsigned char stte[256], indx, jndx, kndx;

/*
 * Reset arc4 stte. 
 */
void stte_0(void)
{
	indx = jndx = kndx = 0;
	do {
		stte[indx] = indx;
	} while (++indx);
}

/*
 * Set key. Can be used more than once. 
 */
void key(void * str, int len)
{
	unsigned char tmp, * ptr = (unsigned char *)str;
	while (len > 0) {
		do {
			tmp = stte[indx];
			kndx += tmp;
			kndx += ptr[(int)indx % len];
			stte[indx] = stte[kndx];
			stte[kndx] = tmp;
		} while (++indx);
		ptr += 256;
		len -= 256;
	}
}

/*
 * Crypt data. 
 */
void arc4(void * str, int len)
{
	unsigned char tmp, * ptr = (unsigned char *)str;
	while (len > 0) {
		indx++;
		tmp = stte[indx];
		jndx += tmp;
		stte[indx] = stte[jndx];
		stte[jndx] = tmp;
		tmp += stte[indx];
		*ptr ^= stte[tmp];
		ptr++;
		len--;
	}
}

/* End of ARC4 */

/*
 * Key with file invariants. 
 */
int key_with_file(char * file)
{
	struct stat statf[1];
	struct stat control[1];

	if (stat(file, statf) < 0)
		return -1;

	/* Turn on stable fields */
	memset(control, 0, sizeof(control));
	control->st_ino = statf->st_ino;
	control->st_dev = statf->st_dev;
	control->st_rdev = statf->st_rdev;
	control->st_uid = statf->st_uid;
	control->st_gid = statf->st_gid;
	control->st_size = statf->st_size;
	control->st_mtime = statf->st_mtime;
	control->st_ctime = statf->st_ctime;
	key(control, sizeof(control));
	return 0;
}

#if DEBUGEXEC
void debugexec(char * sh11, int argc, char ** argv)
{
	int i;
	fprintf(stderr, "shll=%s\n", sh11 ? sh11 : "<null>");
	fprintf(stderr, "argc=%d\n", argc);
	if (!argv) {
		fprintf(stderr, "argv=<null>\n");
	} else { 
		for (i = 0; i <= argc ; i++)
			fprintf(stderr, "argv[%d]=%.60s\n", i, argv[i] ? argv[i] : "<null>");
	}
}
#endif /* DEBUGEXEC */

void rmarg(char ** argv, char * arg)
{
	for (; argv && *argv && *argv != arg; argv++);
	for (; argv && *argv; argv++)
		*argv = argv[1];
}

int chkenv(int argc)
{
	char buff[512];
	unsigned long mask, m;
	int l, a, c;
	char * string;
	extern char ** environ;

	mask  = (unsigned long)&chkenv;
	mask ^= (unsigned long)getpid() * ~mask;
	sprintf(buff, "x%lx", mask);
	string = getenv(buff);
#if DEBUGEXEC
	fprintf(stderr, "getenv(%s)=%s\n", buff, string ? string : "<null>");
#endif
	l = strlen(buff);
	if (!string) {
		/* 1st */
		sprintf(&buff[l], "=%lu %d", mask, argc);
		putenv(strdup(buff));
		return 0;
	}
	c = sscanf(string, "%lu %d%c", &m, &a, buff);
	if (c == 2 && m == mask) {
		/* 3rd */
		rmarg(environ, &string[-l - 1]);
		return 1 + (argc - a);
	}
	return -1;
}

#if !TRACEABLE

#define _LINUX_SOURCE_COMPAT
#include <sys/ptrace.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <fcntl.h>
#include <signal.h>
#include <stdio.h>
#include <unistd.h>

#if !defined(PTRACE_ATTACH) && defined(PT_ATTACH)
#	define PTRACE_ATTACH	PT_ATTACH
#endif
void untraceable(char * argv0)
{
	char proc[80];
	int pid, mine;

	switch(pid = fork()) {
	case  0:
		pid = getppid();
		/* For problematic SunOS ptrace */
#if defined(__FreeBSD__)
		sprintf(proc, "/proc/%d/mem", (int)pid);
#else
		sprintf(proc, "/proc/%d/as",  (int)pid);
#endif
		close(0);
		mine = !open(proc, O_RDWR|O_EXCL);
		if (!mine && errno != EBUSY)
			mine = !ptrace(PTRACE_ATTACH, pid, 0, 0);
		if (mine) {
			kill(pid, SIGCONT);
		} else {
			perror(argv0);
			kill(pid, SIGKILL);
		}
		_exit(mine);
	case -1:
		break;
	default:
		if (pid == waitpid(pid, 0, 0))
			return;
	}
	perror(argv0);
	_exit(1);
}
#endif /* !TRACEABLE */

char * xsh(int argc, char ** argv)
{
	char * scrpt;
	int ret, i, j;
	char ** varg;
	char * me = getenv("_");
	if (me == NULL) { me = argv[0]; }

	stte_0();
	 key(pswd, pswd_z);
	arc4(msg1, msg1_z);
	arc4(date, date_z);
	if (date[0] && (atoll(date)<time(NULL)))
		return msg1;
	arc4(shll, shll_z);
	arc4(inlo, inlo_z);
	arc4(xecc, xecc_z);
	arc4(lsto, lsto_z);
	arc4(tst1, tst1_z);
	 key(tst1, tst1_z);
	arc4(chk1, chk1_z);
	if ((chk1_z != tst1_z) || memcmp(tst1, chk1, tst1_z))
		return tst1;
	ret = chkenv(argc);
	arc4(msg2, msg2_z);
	if (ret < 0)
		return msg2;
	varg = (char **)calloc(argc + 10, sizeof(char *));
	if (!varg)
		return 0;
	if (ret) {
		arc4(rlax, rlax_z);
		if (!rlax[0] && key_with_file(shll))
			return shll;
		arc4(opts, opts_z);
		arc4(text, text_z);
		arc4(tst2, tst2_z);
		 key(tst2, tst2_z);
		arc4(chk2, chk2_z);
		if ((chk2_z != tst2_z) || memcmp(tst2, chk2, tst2_z))
			return tst2;
		/* Prepend hide_z spaces to script text to hide it. */
		scrpt = malloc(hide_z + text_z);
		if (!scrpt)
			return 0;
		memset(scrpt, (int) ' ', hide_z);
		memcpy(&scrpt[hide_z], text, text_z);
	} else {			/* Reexecute */
		if (*xecc) {
			scrpt = malloc(512);
			if (!scrpt)
				return 0;
			sprintf(scrpt, xecc, me);
		} else {
			scrpt = me;
		}
	}
	j = 0;
	varg[j++] = argv[0];		/* My own name at execution */
	if (ret && *opts)
		varg[j++] = opts;	/* Options on 1st line of code */
	if (*inlo)
		varg[j++] = inlo;	/* Option introducing inline code */
	varg[j++] = scrpt;		/* The script itself */
	if (*lsto)
		varg[j++] = lsto;	/* Option meaning last option */
	i = (ret > 1) ? ret : 0;	/* Args numbering correction */
	while (i < argc)
		varg[j++] = argv[i++];	/* Main run-time arguments */
	varg[j] = 0;			/* NULL terminated array */
#if DEBUGEXEC
	debugexec(shll, j, varg);
#endif
	execvp(shll, varg);
	return shll;
}

int main(int argc, char ** argv)
{
#if DEBUGEXEC
	debugexec("main", argc, argv);
#endif
#if !TRACEABLE
	untraceable(argv[0]);
#endif
	argv[1] = xsh(argc, argv);
	fprintf(stderr, "%s%s%s: %s\n", argv[0],
		errno ? ": " : "",
		errno ? strerror(errno) : "",
		argv[1] ? argv[1] : "<null>"
	);
	return 1;
}
