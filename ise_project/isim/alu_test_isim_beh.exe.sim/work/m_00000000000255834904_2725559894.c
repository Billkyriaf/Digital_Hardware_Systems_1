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
static const char *ng0 = "E:/Uni/HW/Digital_Hardware_Systems_1/ise_project/src/modules/alu/alu.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static unsigned int ng3[] = {2U, 0U};
static unsigned int ng4[] = {3U, 0U};
static unsigned int ng5[] = {4U, 0U};
static unsigned int ng6[] = {8U, 0U};
static int ng7[] = {1, 0};
static int ng8[] = {31, 0};
static unsigned int ng9[] = {9U, 0U};
static unsigned int ng10[] = {10U, 0U};
static unsigned int ng11[] = {12U, 0U};
static int ng12[] = {0, 0};
static unsigned int ng13[] = {13U, 0U};
static unsigned int ng14[] = {0U, 4294967295U};



static void Always_44_0(char *t0)
{
    char t17[8];
    char t40[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    int t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t18;
    unsigned int t19;
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
    int t31;
    int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;
    char *t41;
    char *t42;

LAB0:    t1 = (t0 + 3328U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 3648);
    *((int *)t2) = 1;
    t3 = (t0 + 3360);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(44, ng0);

LAB5:    xsi_set_current_line(46, ng0);
    t4 = (t0 + 1688U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(46, ng0);

LAB9:    xsi_set_current_line(48, ng0);
    t11 = (t0 + 1368U);
    t12 = *((char **)t11);

LAB10:    t11 = ((char*)((ng1)));
    t13 = xsi_vlog_unsigned_case_compare(t12, 4, t11, 4);
    if (t13 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng2)));
    t13 = xsi_vlog_unsigned_case_compare(t12, 4, t2, 4);
    if (t13 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng3)));
    t13 = xsi_vlog_unsigned_case_compare(t12, 4, t2, 4);
    if (t13 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng4)));
    t13 = xsi_vlog_unsigned_case_compare(t12, 4, t2, 4);
    if (t13 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng5)));
    t13 = xsi_vlog_unsigned_case_compare(t12, 4, t2, 4);
    if (t13 == 1)
        goto LAB19;

LAB20:    t2 = ((char*)((ng6)));
    t13 = xsi_vlog_unsigned_case_compare(t12, 4, t2, 4);
    if (t13 == 1)
        goto LAB21;

LAB22:    t2 = ((char*)((ng9)));
    t13 = xsi_vlog_unsigned_case_compare(t12, 4, t2, 4);
    if (t13 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng10)));
    t13 = xsi_vlog_unsigned_case_compare(t12, 4, t2, 4);
    if (t13 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng11)));
    t13 = xsi_vlog_unsigned_case_compare(t12, 4, t2, 4);
    if (t13 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng13)));
    t13 = xsi_vlog_unsigned_case_compare(t12, 4, t2, 4);
    if (t13 == 1)
        goto LAB29;

LAB30:
LAB32:
LAB31:    xsi_set_current_line(70, ng0);
    t2 = ((char*)((ng14)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);

LAB33:    xsi_set_current_line(73, ng0);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 2248);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(76, ng0);
    t2 = (t0 + 2088);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t17, 0, 8);
    t11 = (t4 + 4);
    t14 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t5);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t14);
    t18 = (t9 ^ t10);
    t19 = (t8 | t18);
    t20 = *((unsigned int *)t11);
    t21 = *((unsigned int *)t14);
    t22 = (t20 | t21);
    t23 = (~(t22));
    t24 = (t19 & t23);
    if (t24 != 0)
        goto LAB54;

LAB51:    if (t22 != 0)
        goto LAB53;

LAB52:    *((unsigned int *)t17) = 1;

LAB54:    t16 = (t17 + 4);
    t25 = *((unsigned int *)t16);
    t26 = (~(t25));
    t27 = *((unsigned int *)t17);
    t28 = (t27 & t26);
    t29 = (t28 != 0);
    if (t29 > 0)
        goto LAB55;

LAB56:
LAB57:    goto LAB8;

LAB11:    xsi_set_current_line(49, ng0);
    t14 = (t0 + 1048U);
    t15 = *((char **)t14);
    t14 = (t0 + 1208U);
    t16 = *((char **)t14);
    memset(t17, 0, 8);
    xsi_vlog_unsigned_add(t17, 32, t15, 32, t16, 32);
    t14 = (t0 + 2088);
    xsi_vlogvar_assign_value(t14, t17, 0, 0, 32);
    goto LAB33;

LAB13:    xsi_set_current_line(50, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t5 = *((char **)t3);
    memset(t17, 0, 8);
    xsi_vlog_unsigned_minus(t17, 32, t4, 32, t5, 32);
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t17, 0, 0, 32);
    goto LAB33;

LAB15:    xsi_set_current_line(51, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t5 = *((char **)t3);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t5);
    t8 = (t6 & t7);
    *((unsigned int *)t17) = t8;
    t3 = (t4 + 4);
    t11 = (t5 + 4);
    t14 = (t17 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t11);
    t18 = (t9 | t10);
    *((unsigned int *)t14) = t18;
    t19 = *((unsigned int *)t14);
    t20 = (t19 != 0);
    if (t20 == 1)
        goto LAB34;

LAB35:
LAB36:    t39 = (t0 + 2088);
    xsi_vlogvar_assign_value(t39, t17, 0, 0, 32);
    goto LAB33;

LAB17:    xsi_set_current_line(52, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = (t0 + 1208U);
    t5 = *((char **)t3);
    t6 = *((unsigned int *)t4);
    t7 = *((unsigned int *)t5);
    t8 = (t6 | t7);
    *((unsigned int *)t17) = t8;
    t3 = (t4 + 4);
    t11 = (t5 + 4);
    t14 = (t17 + 4);
    t9 = *((unsigned int *)t3);
    t10 = *((unsigned int *)t11);
    t18 = (t9 | t10);
    *((unsigned int *)t14) = t18;
    t19 = *((unsigned int *)t14);
    t20 = (t19 != 0);
    if (t20 == 1)
        goto LAB37;

LAB38:
LAB39:    t39 = (t0 + 2088);
    xsi_vlogvar_assign_value(t39, t17, 0, 0, 32);
    goto LAB33;

LAB19:    xsi_set_current_line(53, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    memset(t17, 0, 8);
    t3 = (t17 + 4);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    *((unsigned int *)t17) = t7;
    *((unsigned int *)t3) = 0;
    if (*((unsigned int *)t5) != 0)
        goto LAB41;

LAB40:    t19 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t19 & 4294967295U);
    t20 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t20 & 4294967295U);
    t11 = (t0 + 2088);
    xsi_vlogvar_assign_value(t11, t17, 0, 0, 32);
    goto LAB33;

LAB21:    xsi_set_current_line(54, ng0);

LAB42:    xsi_set_current_line(55, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng7)));
    memset(t17, 0, 8);
    xsi_vlog_unsigned_rshift(t17, 32, t4, 32, t3, 32);
    t5 = (t0 + 2088);
    xsi_vlogvar_assign_value(t5, t17, 0, 0, 32);
    xsi_set_current_line(56, ng0);
    t2 = (t0 + 2088);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t17, 0, 8);
    t5 = (t17 + 4);
    t11 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 30);
    t8 = (t7 & 1);
    *((unsigned int *)t17) = t8;
    t9 = *((unsigned int *)t11);
    t10 = (t9 >> 30);
    t18 = (t10 & 1);
    *((unsigned int *)t5) = t18;
    t14 = (t0 + 2088);
    t15 = (t0 + 2088);
    t16 = (t15 + 72U);
    t39 = *((char **)t16);
    t41 = ((char*)((ng8)));
    xsi_vlog_generic_convert_bit_index(t40, t39, 2, t41, 32, 1);
    t42 = (t40 + 4);
    t19 = *((unsigned int *)t42);
    t13 = (!(t19));
    if (t13 == 1)
        goto LAB43;

LAB44:    goto LAB33;

LAB23:    xsi_set_current_line(58, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng7)));
    memset(t17, 0, 8);
    xsi_vlog_unsigned_lshift(t17, 32, t4, 32, t3, 32);
    t5 = (t0 + 2088);
    xsi_vlogvar_assign_value(t5, t17, 0, 0, 32);
    goto LAB33;

LAB25:    xsi_set_current_line(59, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng7)));
    memset(t17, 0, 8);
    xsi_vlog_unsigned_rshift(t17, 32, t4, 32, t3, 32);
    t5 = (t0 + 2088);
    xsi_vlogvar_assign_value(t5, t17, 0, 0, 32);
    goto LAB33;

LAB27:    xsi_set_current_line(60, ng0);

LAB45:    xsi_set_current_line(61, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    memset(t17, 0, 8);
    t3 = (t17 + 4);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 31);
    t8 = (t7 & 1);
    *((unsigned int *)t17) = t8;
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 31);
    t18 = (t10 & 1);
    *((unsigned int *)t3) = t18;
    t11 = (t0 + 2408);
    xsi_vlogvar_assign_value(t11, t17, 0, 0, 1);
    xsi_set_current_line(62, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng7)));
    memset(t17, 0, 8);
    xsi_vlog_unsigned_lshift(t17, 32, t3, 32, t2, 32);
    t4 = (t0 + 2088);
    xsi_vlogvar_assign_value(t4, t17, 0, 0, 32);
    xsi_set_current_line(63, ng0);
    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2088);
    t11 = (t0 + 2088);
    t14 = (t11 + 72U);
    t15 = *((char **)t14);
    t16 = ((char*)((ng12)));
    xsi_vlog_generic_convert_bit_index(t17, t15, 2, t16, 32, 1);
    t39 = (t17 + 4);
    t6 = *((unsigned int *)t39);
    t13 = (!(t6));
    if (t13 == 1)
        goto LAB46;

LAB47:    goto LAB33;

LAB29:    xsi_set_current_line(65, ng0);

LAB48:    xsi_set_current_line(66, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    memset(t17, 0, 8);
    t3 = (t17 + 4);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 0);
    t8 = (t7 & 1);
    *((unsigned int *)t17) = t8;
    t9 = *((unsigned int *)t5);
    t10 = (t9 >> 0);
    t18 = (t10 & 1);
    *((unsigned int *)t3) = t18;
    t11 = (t0 + 2408);
    xsi_vlogvar_assign_value(t11, t17, 0, 0, 1);
    xsi_set_current_line(67, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng7)));
    memset(t17, 0, 8);
    xsi_vlog_unsigned_rshift(t17, 32, t3, 32, t2, 32);
    t4 = (t0 + 2088);
    xsi_vlogvar_assign_value(t4, t17, 0, 0, 32);
    xsi_set_current_line(68, ng0);
    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2088);
    t11 = (t0 + 2088);
    t14 = (t11 + 72U);
    t15 = *((char **)t14);
    t16 = ((char*)((ng8)));
    xsi_vlog_generic_convert_bit_index(t17, t15, 2, t16, 32, 1);
    t39 = (t17 + 4);
    t6 = *((unsigned int *)t39);
    t13 = (!(t6));
    if (t13 == 1)
        goto LAB49;

LAB50:    goto LAB33;

LAB34:    t21 = *((unsigned int *)t17);
    t22 = *((unsigned int *)t14);
    *((unsigned int *)t17) = (t21 | t22);
    t15 = (t4 + 4);
    t16 = (t5 + 4);
    t23 = *((unsigned int *)t4);
    t24 = (~(t23));
    t25 = *((unsigned int *)t15);
    t26 = (~(t25));
    t27 = *((unsigned int *)t5);
    t28 = (~(t27));
    t29 = *((unsigned int *)t16);
    t30 = (~(t29));
    t31 = (t24 & t26);
    t32 = (t28 & t30);
    t33 = (~(t31));
    t34 = (~(t32));
    t35 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t35 & t33);
    t36 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t36 & t34);
    t37 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t37 & t33);
    t38 = *((unsigned int *)t17);
    *((unsigned int *)t17) = (t38 & t34);
    goto LAB36;

LAB37:    t21 = *((unsigned int *)t17);
    t22 = *((unsigned int *)t14);
    *((unsigned int *)t17) = (t21 | t22);
    t15 = (t4 + 4);
    t16 = (t5 + 4);
    t23 = *((unsigned int *)t15);
    t24 = (~(t23));
    t25 = *((unsigned int *)t4);
    t31 = (t25 & t24);
    t26 = *((unsigned int *)t16);
    t27 = (~(t26));
    t28 = *((unsigned int *)t5);
    t32 = (t28 & t27);
    t29 = (~(t31));
    t30 = (~(t32));
    t33 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t33 & t29);
    t34 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t34 & t30);
    goto LAB39;

LAB41:    t8 = *((unsigned int *)t17);
    t9 = *((unsigned int *)t5);
    *((unsigned int *)t17) = (t8 | t9);
    t10 = *((unsigned int *)t3);
    t18 = *((unsigned int *)t5);
    *((unsigned int *)t3) = (t10 | t18);
    goto LAB40;

LAB43:    xsi_vlogvar_assign_value(t14, t17, 0, *((unsigned int *)t40), 1);
    goto LAB44;

LAB46:    xsi_vlogvar_assign_value(t5, t4, 0, *((unsigned int *)t17), 1);
    goto LAB47;

LAB49:    xsi_vlogvar_assign_value(t5, t4, 0, *((unsigned int *)t17), 1);
    goto LAB50;

LAB53:    t15 = (t17 + 4);
    *((unsigned int *)t17) = 1;
    *((unsigned int *)t15) = 1;
    goto LAB54;

LAB55:    xsi_set_current_line(76, ng0);

LAB58:    xsi_set_current_line(77, ng0);
    t39 = ((char*)((ng7)));
    t41 = (t0 + 2248);
    xsi_vlogvar_assign_value(t41, t39, 0, 0, 1);
    goto LAB57;

}


extern void work_m_00000000000255834904_2725559894_init()
{
	static char *pe[] = {(void *)Always_44_0};
	xsi_register_didat("work_m_00000000000255834904_2725559894", "isim/alu_test_isim_beh.exe.sim/work/m_00000000000255834904_2725559894.didat");
	xsi_register_executes(pe);
}
