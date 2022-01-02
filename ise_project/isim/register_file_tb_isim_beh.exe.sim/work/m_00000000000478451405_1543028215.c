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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "E:/Uni/HW/Digital_Hardware_Systems_1/ise_project/src/modules/help_modules/decoder_5_32.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};



static void Always_29_0(char *t0)
{
    char t7[8];
    char t18[8];
    char t41[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    char *t40;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t48;
    unsigned int t49;
    int t50;

LAB0:    t1 = (t0 + 2800U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(29, ng0);
    t2 = (t0 + 3120);
    *((int *)t2) = 1;
    t3 = (t0 + 2832);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(29, ng0);

LAB5:    xsi_set_current_line(32, ng0);
    xsi_set_current_line(32, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 1880);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 32);

LAB6:    t2 = (t0 + 1880);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 472);
    t6 = *((char **)t5);
    memset(t7, 0, 8);
    xsi_vlog_signed_less(t7, 32, t4, 32, t6, 32);
    t5 = (t7 + 4);
    t8 = *((unsigned int *)t5);
    t9 = (~(t8));
    t10 = *((unsigned int *)t7);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB7;

LAB8:    goto LAB2;

LAB7:    xsi_set_current_line(32, ng0);

LAB9:    xsi_set_current_line(34, ng0);
    t13 = (t0 + 1880);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t0 + 1320U);
    t17 = *((char **)t16);
    memset(t18, 0, 8);
    t16 = (t15 + 4);
    t19 = (t17 + 4);
    t20 = *((unsigned int *)t15);
    t21 = *((unsigned int *)t17);
    t22 = (t20 ^ t21);
    t23 = *((unsigned int *)t16);
    t24 = *((unsigned int *)t19);
    t25 = (t23 ^ t24);
    t26 = (t22 | t25);
    t27 = *((unsigned int *)t16);
    t28 = *((unsigned int *)t19);
    t29 = (t27 | t28);
    t30 = (~(t29));
    t31 = (t26 & t30);
    if (t31 != 0)
        goto LAB13;

LAB10:    if (t29 != 0)
        goto LAB12;

LAB11:    *((unsigned int *)t18) = 1;

LAB13:    t33 = (t18 + 4);
    t34 = *((unsigned int *)t33);
    t35 = (~(t34));
    t36 = *((unsigned int *)t18);
    t37 = (t36 & t35);
    t38 = (t37 != 0);
    if (t38 > 0)
        goto LAB14;

LAB15:    xsi_set_current_line(36, ng0);

LAB20:    xsi_set_current_line(37, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1720);
    t4 = (t0 + 1720);
    t5 = (t4 + 72U);
    t6 = *((char **)t5);
    t13 = (t0 + 1880);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    xsi_vlog_generic_convert_bit_index(t7, t6, 2, t15, 32, 1);
    t16 = (t7 + 4);
    t8 = *((unsigned int *)t16);
    t50 = (!(t8));
    if (t50 == 1)
        goto LAB21;

LAB22:
LAB16:    xsi_set_current_line(32, ng0);
    t2 = (t0 + 1880);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t7, 0, 8);
    xsi_vlog_signed_add(t7, 32, t4, 32, t5, 32);
    t6 = (t0 + 1880);
    xsi_vlogvar_assign_value(t6, t7, 0, 0, 32);
    goto LAB6;

LAB12:    t32 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t32) = 1;
    goto LAB13;

LAB14:    xsi_set_current_line(34, ng0);

LAB17:    xsi_set_current_line(35, ng0);
    t39 = ((char*)((ng2)));
    t40 = (t0 + 1720);
    t42 = (t0 + 1720);
    t43 = (t42 + 72U);
    t44 = *((char **)t43);
    t45 = (t0 + 1880);
    t46 = (t45 + 56U);
    t47 = *((char **)t46);
    xsi_vlog_generic_convert_bit_index(t41, t44, 2, t47, 32, 1);
    t48 = (t41 + 4);
    t49 = *((unsigned int *)t48);
    t50 = (!(t49));
    if (t50 == 1)
        goto LAB18;

LAB19:    goto LAB16;

LAB18:    xsi_vlogvar_assign_value(t40, t39, 0, *((unsigned int *)t41), 1);
    goto LAB19;

LAB21:    xsi_vlogvar_assign_value(t3, t2, 0, *((unsigned int *)t7), 1);
    goto LAB22;

}


extern void work_m_00000000000478451405_1543028215_init()
{
	static char *pe[] = {(void *)Always_29_0};
	xsi_register_didat("work_m_00000000000478451405_1543028215", "isim/register_file_tb_isim_beh.exe.sim/work/m_00000000000478451405_1543028215.didat");
	xsi_register_executes(pe);
}
