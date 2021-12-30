/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/vasilisk/Git/Digital_Hardware_Systems_1/ise_project/src/modules/help_modules/mux_32_1.v";
static int ng1[] = {32, 0};



static void Always_12_0(char *t0)
{
    char t4[8];
    char t12[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t13;

LAB0:    t1 = (t0 + 2792U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(12, ng0);
    t2 = (t0 + 3112);
    *((int *)t2) = 1;
    t3 = (t0 + 2824);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(12, ng0);

LAB5:    xsi_set_current_line(14, ng0);
    t5 = (t0 + 1320U);
    t6 = *((char **)t5);
    t5 = (t0 + 1280U);
    t7 = (t5 + 72U);
    t8 = *((char **)t7);
    t9 = (t0 + 1480U);
    t10 = *((char **)t9);
    t9 = (t0 + 472);
    t11 = *((char **)t9);
    memset(t12, 0, 8);
    xsi_vlog_unsigned_multiply(t12, 32, t10, 5, t11, 32);
    t9 = ((char*)((ng1)));
    xsi_vlog_get_indexed_partselect(t4, 32, t6, ((int*)(t8)), 2, t12, 32, 2, t9, 32, 1, 1);
    t13 = (t0 + 1880);
    xsi_vlogvar_assign_value(t13, t4, 0, 0, 32);
    goto LAB2;

}


extern void work_m_11299163026853882522_3538264565_init()
{
	static char *pe[] = {(void *)Always_12_0};
	xsi_register_didat("work_m_11299163026853882522_3538264565", "isim/register_file_tb_isim_beh.exe.sim/work/m_11299163026853882522_3538264565.didat");
	xsi_register_executes(pe);
}
