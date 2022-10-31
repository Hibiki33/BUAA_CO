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
static const char *ng0 = "D:/Computer Organization/BUAA_CO/P4/grf.v";
static int ng1[] = {0, 0};
static int ng2[] = {31, 0};
static unsigned int ng3[] = {0U, 0U};
static int ng4[] = {1, 0};
static const char *ng5 = "@%h: $%d <= %h";



static void Initial_37_0(char *t0)
{
    char t5[8];
    char t14[8];
    char t15[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    unsigned int t26;
    int t27;
    char *t28;
    unsigned int t29;
    int t30;
    int t31;
    unsigned int t32;
    unsigned int t33;
    int t34;
    int t35;

LAB0:    xsi_set_current_line(37, ng0);

LAB2:    xsi_set_current_line(38, ng0);
    xsi_set_current_line(38, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 3048);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);

LAB3:    t1 = (t0 + 3048);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = ((char*)((ng2)));
    memset(t5, 0, 8);
    xsi_vlog_signed_leq(t5, 32, t3, 32, t4, 32);
    t6 = (t5 + 4);
    t7 = *((unsigned int *)t6);
    t8 = (~(t7));
    t9 = *((unsigned int *)t5);
    t10 = (t9 & t8);
    t11 = (t10 != 0);
    if (t11 > 0)
        goto LAB4;

LAB5:
LAB1:    return;
LAB4:    xsi_set_current_line(38, ng0);

LAB6:    xsi_set_current_line(39, ng0);
    t12 = ((char*)((ng3)));
    t13 = (t0 + 2888);
    t16 = (t0 + 2888);
    t17 = (t16 + 72U);
    t18 = *((char **)t17);
    t19 = (t0 + 2888);
    t20 = (t19 + 64U);
    t21 = *((char **)t20);
    t22 = (t0 + 3048);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    xsi_vlog_generic_convert_array_indices(t14, t15, t18, t21, 2, 1, t24, 32, 1);
    t25 = (t14 + 4);
    t26 = *((unsigned int *)t25);
    t27 = (!(t26));
    t28 = (t15 + 4);
    t29 = *((unsigned int *)t28);
    t30 = (!(t29));
    t31 = (t27 && t30);
    if (t31 == 1)
        goto LAB7;

LAB8:    xsi_set_current_line(38, ng0);
    t1 = (t0 + 3048);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = ((char*)((ng4)));
    memset(t5, 0, 8);
    xsi_vlog_signed_add(t5, 32, t3, 32, t4, 32);
    t6 = (t0 + 3048);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 32);
    goto LAB3;

LAB7:    t32 = *((unsigned int *)t14);
    t33 = *((unsigned int *)t15);
    t34 = (t32 - t33);
    t35 = (t34 + 1);
    xsi_vlogvar_wait_assign_value(t13, t12, 0, *((unsigned int *)t15), t35, 0LL);
    goto LAB8;

}

static void Always_43_1(char *t0)
{
    char t13[8];
    char t15[8];
    char t16[8];
    char t46[8];
    char t76[8];
    char t77[8];
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
    char *t14;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    unsigned int t27;
    int t28;
    char *t29;
    unsigned int t30;
    int t31;
    int t32;
    unsigned int t33;
    unsigned int t34;
    int t35;
    int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    char *t78;
    char *t79;
    char *t80;
    char *t81;
    char *t82;
    char *t83;
    char *t84;
    unsigned int t85;
    char *t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    int t90;
    int t91;

LAB0:    t1 = (t0 + 4216U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 5032);
    *((int *)t2) = 1;
    t3 = (t0 + 4248);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(43, ng0);

LAB5:    xsi_set_current_line(44, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(49, ng0);

LAB16:    xsi_set_current_line(50, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    memset(t13, 0, 8);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB17;

LAB18:    if (*((unsigned int *)t2) != 0)
        goto LAB19;

LAB20:    t5 = (t13 + 4);
    t27 = *((unsigned int *)t13);
    t30 = *((unsigned int *)t5);
    t33 = (t27 || t30);
    if (t33 > 0)
        goto LAB21;

LAB22:    memcpy(t46, t13, 8);

LAB23:    t24 = (t46 + 4);
    t71 = *((unsigned int *)t24);
    t72 = (~(t71));
    t73 = *((unsigned int *)t46);
    t74 = (t73 & t72);
    t75 = (t74 != 0);
    if (t75 > 0)
        goto LAB35;

LAB36:
LAB37:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(44, ng0);

LAB9:    xsi_set_current_line(45, ng0);
    xsi_set_current_line(45, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 3048);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 32);

LAB10:    t2 = (t0 + 3048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng2)));
    memset(t13, 0, 8);
    xsi_vlog_signed_leq(t13, 32, t4, 32, t5, 32);
    t11 = (t13 + 4);
    t6 = *((unsigned int *)t11);
    t7 = (~(t6));
    t8 = *((unsigned int *)t13);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB11;

LAB12:    goto LAB8;

LAB11:    xsi_set_current_line(45, ng0);

LAB13:    xsi_set_current_line(46, ng0);
    t12 = ((char*)((ng3)));
    t14 = (t0 + 2888);
    t17 = (t0 + 2888);
    t18 = (t17 + 72U);
    t19 = *((char **)t18);
    t20 = (t0 + 2888);
    t21 = (t20 + 64U);
    t22 = *((char **)t21);
    t23 = (t0 + 3048);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    xsi_vlog_generic_convert_array_indices(t15, t16, t19, t22, 2, 1, t25, 32, 1);
    t26 = (t15 + 4);
    t27 = *((unsigned int *)t26);
    t28 = (!(t27));
    t29 = (t16 + 4);
    t30 = *((unsigned int *)t29);
    t31 = (!(t30));
    t32 = (t28 && t31);
    if (t32 == 1)
        goto LAB14;

LAB15:    xsi_set_current_line(45, ng0);
    t2 = (t0 + 3048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t13, 0, 8);
    xsi_vlog_signed_add(t13, 32, t4, 32, t5, 32);
    t11 = (t0 + 3048);
    xsi_vlogvar_assign_value(t11, t13, 0, 0, 32);
    goto LAB10;

LAB14:    t33 = *((unsigned int *)t15);
    t34 = *((unsigned int *)t16);
    t35 = (t33 - t34);
    t36 = (t35 + 1);
    xsi_vlogvar_wait_assign_value(t14, t12, 0, *((unsigned int *)t16), t36, 0LL);
    goto LAB15;

LAB17:    *((unsigned int *)t13) = 1;
    goto LAB20;

LAB19:    t4 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t4) = 1;
    goto LAB20;

LAB21:    t11 = (t0 + 1848U);
    t12 = *((char **)t11);
    memset(t15, 0, 8);
    t11 = (t12 + 4);
    t34 = *((unsigned int *)t11);
    t37 = (~(t34));
    t38 = *((unsigned int *)t12);
    t39 = (t38 & t37);
    t40 = (t39 & 31U);
    if (t40 != 0)
        goto LAB27;

LAB25:    if (*((unsigned int *)t11) == 0)
        goto LAB24;

LAB26:    t14 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t14) = 1;

LAB27:    memset(t16, 0, 8);
    t17 = (t15 + 4);
    t41 = *((unsigned int *)t17);
    t42 = (~(t41));
    t43 = *((unsigned int *)t15);
    t44 = (t43 & t42);
    t45 = (t44 & 1U);
    if (t45 != 0)
        goto LAB28;

LAB29:    if (*((unsigned int *)t17) != 0)
        goto LAB30;

LAB31:    t47 = *((unsigned int *)t13);
    t48 = *((unsigned int *)t16);
    t49 = (t47 & t48);
    *((unsigned int *)t46) = t49;
    t19 = (t13 + 4);
    t20 = (t16 + 4);
    t21 = (t46 + 4);
    t50 = *((unsigned int *)t19);
    t51 = *((unsigned int *)t20);
    t52 = (t50 | t51);
    *((unsigned int *)t21) = t52;
    t53 = *((unsigned int *)t21);
    t54 = (t53 != 0);
    if (t54 == 1)
        goto LAB32;

LAB33:
LAB34:    goto LAB23;

LAB24:    *((unsigned int *)t15) = 1;
    goto LAB27;

LAB28:    *((unsigned int *)t16) = 1;
    goto LAB31;

LAB30:    t18 = (t16 + 4);
    *((unsigned int *)t16) = 1;
    *((unsigned int *)t18) = 1;
    goto LAB31;

LAB32:    t55 = *((unsigned int *)t46);
    t56 = *((unsigned int *)t21);
    *((unsigned int *)t46) = (t55 | t56);
    t22 = (t13 + 4);
    t23 = (t16 + 4);
    t57 = *((unsigned int *)t13);
    t58 = (~(t57));
    t59 = *((unsigned int *)t22);
    t60 = (~(t59));
    t61 = *((unsigned int *)t16);
    t62 = (~(t61));
    t63 = *((unsigned int *)t23);
    t64 = (~(t63));
    t28 = (t58 & t60);
    t31 = (t62 & t64);
    t65 = (~(t28));
    t66 = (~(t31));
    t67 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t67 & t65);
    t68 = *((unsigned int *)t21);
    *((unsigned int *)t21) = (t68 & t66);
    t69 = *((unsigned int *)t46);
    *((unsigned int *)t46) = (t69 & t65);
    t70 = *((unsigned int *)t46);
    *((unsigned int *)t46) = (t70 & t66);
    goto LAB34;

LAB35:    xsi_set_current_line(50, ng0);

LAB38:    xsi_set_current_line(51, ng0);
    t25 = (t0 + 2008U);
    t26 = *((char **)t25);
    t25 = (t0 + 2888);
    t29 = (t0 + 2888);
    t78 = (t29 + 72U);
    t79 = *((char **)t78);
    t80 = (t0 + 2888);
    t81 = (t80 + 64U);
    t82 = *((char **)t81);
    t83 = (t0 + 1848U);
    t84 = *((char **)t83);
    xsi_vlog_generic_convert_array_indices(t76, t77, t79, t82, 2, 1, t84, 5, 2);
    t83 = (t76 + 4);
    t85 = *((unsigned int *)t83);
    t32 = (!(t85));
    t86 = (t77 + 4);
    t87 = *((unsigned int *)t86);
    t35 = (!(t87));
    t36 = (t32 && t35);
    if (t36 == 1)
        goto LAB39;

LAB40:    xsi_set_current_line(52, ng0);
    t2 = (t0 + 2168U);
    t3 = *((char **)t2);
    t2 = (t0 + 1848U);
    t4 = *((char **)t2);
    t2 = (t0 + 2008U);
    t5 = *((char **)t2);
    xsi_vlogfile_write(1, 0, 0, ng5, 4, t0, (char)118, t3, 32, (char)118, t4, 5, (char)118, t5, 32);
    goto LAB37;

LAB39:    t88 = *((unsigned int *)t76);
    t89 = *((unsigned int *)t77);
    t90 = (t88 - t89);
    t91 = (t90 + 1);
    xsi_vlogvar_wait_assign_value(t25, t26, 0, *((unsigned int *)t77), t91, 0LL);
    goto LAB40;

}

static void Cont_57_2(char *t0)
{
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    t1 = (t0 + 4464U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(57, ng0);
    t2 = (t0 + 2888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t0 + 2888);
    t7 = (t6 + 72U);
    t8 = *((char **)t7);
    t9 = (t0 + 2888);
    t10 = (t9 + 64U);
    t11 = *((char **)t10);
    t12 = (t0 + 1528U);
    t13 = *((char **)t12);
    xsi_vlog_generic_get_array_select_value(t5, 32, t4, t8, t11, 2, 1, t13, 5, 2);
    t12 = (t0 + 5144);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t5, 8);
    xsi_driver_vfirst_trans(t12, 0, 31);
    t18 = (t0 + 5048);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Cont_58_3(char *t0)
{
    char t5[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    t1 = (t0 + 4712U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(58, ng0);
    t2 = (t0 + 2888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t6 = (t0 + 2888);
    t7 = (t6 + 72U);
    t8 = *((char **)t7);
    t9 = (t0 + 2888);
    t10 = (t9 + 64U);
    t11 = *((char **)t10);
    t12 = (t0 + 1688U);
    t13 = *((char **)t12);
    xsi_vlog_generic_get_array_select_value(t5, 32, t4, t8, t11, 2, 1, t13, 5, 2);
    t12 = (t0 + 5208);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t5, 8);
    xsi_driver_vfirst_trans(t12, 0, 31);
    t18 = (t0 + 5064);
    *((int *)t18) = 1;

LAB1:    return;
}


extern void work_m_00000000003691626377_4127636709_init()
{
	static char *pe[] = {(void *)Initial_37_0,(void *)Always_43_1,(void *)Cont_57_2,(void *)Cont_58_3};
	xsi_register_didat("work_m_00000000003691626377_4127636709", "isim/tb_isim_beh.exe.sim/work/m_00000000003691626377_4127636709.didat");
	xsi_register_executes(pe);
}
