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
static const char *ng0 = "D:/Computer Organization/Verilog/characters_machine/id_fsm.v";
static unsigned int ng1[] = {0U, 0U};
static int ng2[] = {48, 0};
static int ng3[] = {57, 0};
static int ng4[] = {97, 0};
static int ng5[] = {122, 0};
static int ng6[] = {65, 0};
static int ng7[] = {90, 0};
static unsigned int ng8[] = {1U, 0U};
static unsigned int ng9[] = {2U, 0U};



static void Initial_33_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(33, ng0);

LAB2:    xsi_set_current_line(34, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t2, t1, 0, 0, 2, 0LL);

LAB1:    return;
}

static void Always_37_1(char *t0)
{
    char t11[8];
    char t15[8];
    char t29[8];
    char t33[8];
    char t41[8];
    char t81[8];
    char t86[8];
    char t87[8];
    char t101[8];
    char t105[8];
    char t113[8];
    char t144[8];
    char t152[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;
    char *t12;
    char *t13;
    char *t14;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    char *t27;
    char *t28;
    char *t30;
    char *t31;
    char *t32;
    char *t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    char *t45;
    char *t46;
    char *t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    char *t55;
    char *t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    int t65;
    int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    char *t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    char *t79;
    char *t80;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    char *t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    char *t94;
    char *t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    char *t99;
    char *t100;
    char *t102;
    char *t103;
    char *t104;
    char *t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    char *t112;
    unsigned int t114;
    unsigned int t115;
    unsigned int t116;
    char *t117;
    char *t118;
    char *t119;
    unsigned int t120;
    unsigned int t121;
    unsigned int t122;
    unsigned int t123;
    unsigned int t124;
    unsigned int t125;
    unsigned int t126;
    char *t127;
    char *t128;
    unsigned int t129;
    unsigned int t130;
    unsigned int t131;
    unsigned int t132;
    unsigned int t133;
    unsigned int t134;
    unsigned int t135;
    unsigned int t136;
    int t137;
    unsigned int t138;
    unsigned int t139;
    unsigned int t140;
    unsigned int t141;
    unsigned int t142;
    unsigned int t143;
    char *t145;
    unsigned int t146;
    unsigned int t147;
    unsigned int t148;
    unsigned int t149;
    unsigned int t150;
    char *t151;
    unsigned int t153;
    unsigned int t154;
    unsigned int t155;
    char *t156;
    char *t157;
    char *t158;
    unsigned int t159;
    unsigned int t160;
    unsigned int t161;
    unsigned int t162;
    unsigned int t163;
    unsigned int t164;
    unsigned int t165;
    char *t166;
    char *t167;
    unsigned int t168;
    unsigned int t169;
    unsigned int t170;
    int t171;
    unsigned int t172;
    unsigned int t173;
    unsigned int t174;
    int t175;
    unsigned int t176;
    unsigned int t177;
    unsigned int t178;
    unsigned int t179;
    char *t180;
    unsigned int t181;
    unsigned int t182;
    unsigned int t183;
    unsigned int t184;
    unsigned int t185;
    char *t186;
    char *t187;

LAB0:    t1 = (t0 + 2936U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 3504);
    *((int *)t2) = 1;
    t3 = (t0 + 2968);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(37, ng0);

LAB5:    xsi_set_current_line(38, ng0);
    t4 = (t0 + 1768);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);

LAB6:    t7 = ((char*)((ng1)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t7, 2);
    if (t8 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng8)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 2);
    if (t8 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng9)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 2);
    if (t8 == 1)
        goto LAB11;

LAB12:
LAB14:
LAB13:    xsi_set_current_line(72, ng0);

LAB304:    xsi_set_current_line(73, ng0);
    t2 = (t0 + 1768);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 2, 0LL);

LAB15:    goto LAB2;

LAB7:    xsi_set_current_line(39, ng0);

LAB16:    xsi_set_current_line(40, ng0);
    t9 = (t0 + 1048U);
    t10 = *((char **)t9);
    t9 = ((char*)((ng2)));
    memset(t11, 0, 8);
    t12 = (t10 + 4);
    if (*((unsigned int *)t12) != 0)
        goto LAB18;

LAB17:    t13 = (t9 + 4);
    if (*((unsigned int *)t13) != 0)
        goto LAB18;

LAB21:    if (*((unsigned int *)t10) < *((unsigned int *)t9))
        goto LAB20;

LAB19:    *((unsigned int *)t11) = 1;

LAB20:    memset(t15, 0, 8);
    t16 = (t11 + 4);
    t17 = *((unsigned int *)t16);
    t18 = (~(t17));
    t19 = *((unsigned int *)t11);
    t20 = (t19 & t18);
    t21 = (t20 & 1U);
    if (t21 != 0)
        goto LAB22;

LAB23:    if (*((unsigned int *)t16) != 0)
        goto LAB24;

LAB25:    t23 = (t15 + 4);
    t24 = *((unsigned int *)t15);
    t25 = *((unsigned int *)t23);
    t26 = (t24 || t25);
    if (t26 > 0)
        goto LAB26;

LAB27:    memcpy(t41, t15, 8);

LAB28:    t73 = (t41 + 4);
    t74 = *((unsigned int *)t73);
    t75 = (~(t74));
    t76 = *((unsigned int *)t41);
    t77 = (t76 & t75);
    t78 = (t77 != 0);
    if (t78 > 0)
        goto LAB41;

LAB42:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t11, 0, 8);
    t4 = (t3 + 4);
    if (*((unsigned int *)t4) != 0)
        goto LAB46;

LAB45:    t5 = (t2 + 4);
    if (*((unsigned int *)t5) != 0)
        goto LAB46;

LAB49:    if (*((unsigned int *)t3) < *((unsigned int *)t2))
        goto LAB48;

LAB47:    *((unsigned int *)t11) = 1;

LAB48:    memset(t15, 0, 8);
    t9 = (t11 + 4);
    t17 = *((unsigned int *)t9);
    t18 = (~(t17));
    t19 = *((unsigned int *)t11);
    t20 = (t19 & t18);
    t21 = (t20 & 1U);
    if (t21 != 0)
        goto LAB50;

LAB51:    if (*((unsigned int *)t9) != 0)
        goto LAB52;

LAB53:    t12 = (t15 + 4);
    t24 = *((unsigned int *)t15);
    t25 = *((unsigned int *)t12);
    t26 = (t24 || t25);
    if (t26 > 0)
        goto LAB54;

LAB55:    memcpy(t41, t15, 8);

LAB56:    memset(t81, 0, 8);
    t45 = (t41 + 4);
    t74 = *((unsigned int *)t45);
    t75 = (~(t74));
    t76 = *((unsigned int *)t41);
    t77 = (t76 & t75);
    t78 = (t77 & 1U);
    if (t78 != 0)
        goto LAB69;

LAB70:    if (*((unsigned int *)t45) != 0)
        goto LAB71;

LAB72:    t47 = (t81 + 4);
    t82 = *((unsigned int *)t81);
    t83 = (!(t82));
    t84 = *((unsigned int *)t47);
    t85 = (t83 || t84);
    if (t85 > 0)
        goto LAB73;

LAB74:    memcpy(t152, t81, 8);

LAB75:    t180 = (t152 + 4);
    t181 = *((unsigned int *)t180);
    t182 = (~(t181));
    t183 = *((unsigned int *)t152);
    t184 = (t183 & t182);
    t185 = (t184 != 0);
    if (t185 > 0)
        goto LAB107;

LAB108:    xsi_set_current_line(46, ng0);

LAB111:    xsi_set_current_line(47, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);

LAB109:
LAB43:    goto LAB15;

LAB9:    xsi_set_current_line(50, ng0);

LAB112:    xsi_set_current_line(51, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng2)));
    memset(t11, 0, 8);
    t5 = (t4 + 4);
    if (*((unsigned int *)t5) != 0)
        goto LAB114;

LAB113:    t7 = (t3 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB114;

LAB117:    if (*((unsigned int *)t4) < *((unsigned int *)t3))
        goto LAB116;

LAB115:    *((unsigned int *)t11) = 1;

LAB116:    memset(t15, 0, 8);
    t10 = (t11 + 4);
    t17 = *((unsigned int *)t10);
    t18 = (~(t17));
    t19 = *((unsigned int *)t11);
    t20 = (t19 & t18);
    t21 = (t20 & 1U);
    if (t21 != 0)
        goto LAB118;

LAB119:    if (*((unsigned int *)t10) != 0)
        goto LAB120;

LAB121:    t13 = (t15 + 4);
    t24 = *((unsigned int *)t15);
    t25 = *((unsigned int *)t13);
    t26 = (t24 || t25);
    if (t26 > 0)
        goto LAB122;

LAB123:    memcpy(t41, t15, 8);

LAB124:    t46 = (t41 + 4);
    t74 = *((unsigned int *)t46);
    t75 = (~(t74));
    t76 = *((unsigned int *)t41);
    t77 = (t76 & t75);
    t78 = (t77 != 0);
    if (t78 > 0)
        goto LAB137;

LAB138:    xsi_set_current_line(54, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t11, 0, 8);
    t4 = (t3 + 4);
    if (*((unsigned int *)t4) != 0)
        goto LAB142;

LAB141:    t5 = (t2 + 4);
    if (*((unsigned int *)t5) != 0)
        goto LAB142;

LAB145:    if (*((unsigned int *)t3) < *((unsigned int *)t2))
        goto LAB144;

LAB143:    *((unsigned int *)t11) = 1;

LAB144:    memset(t15, 0, 8);
    t9 = (t11 + 4);
    t17 = *((unsigned int *)t9);
    t18 = (~(t17));
    t19 = *((unsigned int *)t11);
    t20 = (t19 & t18);
    t21 = (t20 & 1U);
    if (t21 != 0)
        goto LAB146;

LAB147:    if (*((unsigned int *)t9) != 0)
        goto LAB148;

LAB149:    t12 = (t15 + 4);
    t24 = *((unsigned int *)t15);
    t25 = *((unsigned int *)t12);
    t26 = (t24 || t25);
    if (t26 > 0)
        goto LAB150;

LAB151:    memcpy(t41, t15, 8);

LAB152:    memset(t81, 0, 8);
    t45 = (t41 + 4);
    t74 = *((unsigned int *)t45);
    t75 = (~(t74));
    t76 = *((unsigned int *)t41);
    t77 = (t76 & t75);
    t78 = (t77 & 1U);
    if (t78 != 0)
        goto LAB165;

LAB166:    if (*((unsigned int *)t45) != 0)
        goto LAB167;

LAB168:    t47 = (t81 + 4);
    t82 = *((unsigned int *)t81);
    t83 = (!(t82));
    t84 = *((unsigned int *)t47);
    t85 = (t83 || t84);
    if (t85 > 0)
        goto LAB169;

LAB170:    memcpy(t152, t81, 8);

LAB171:    t180 = (t152 + 4);
    t181 = *((unsigned int *)t180);
    t182 = (~(t181));
    t183 = *((unsigned int *)t152);
    t184 = (t183 & t182);
    t185 = (t184 != 0);
    if (t185 > 0)
        goto LAB203;

LAB204:    xsi_set_current_line(57, ng0);

LAB207:    xsi_set_current_line(58, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);

LAB205:
LAB139:    goto LAB15;

LAB11:    xsi_set_current_line(61, ng0);

LAB208:    xsi_set_current_line(62, ng0);
    t3 = (t0 + 1048U);
    t4 = *((char **)t3);
    t3 = ((char*)((ng2)));
    memset(t11, 0, 8);
    t5 = (t4 + 4);
    if (*((unsigned int *)t5) != 0)
        goto LAB210;

LAB209:    t7 = (t3 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB210;

LAB213:    if (*((unsigned int *)t4) < *((unsigned int *)t3))
        goto LAB212;

LAB211:    *((unsigned int *)t11) = 1;

LAB212:    memset(t15, 0, 8);
    t10 = (t11 + 4);
    t17 = *((unsigned int *)t10);
    t18 = (~(t17));
    t19 = *((unsigned int *)t11);
    t20 = (t19 & t18);
    t21 = (t20 & 1U);
    if (t21 != 0)
        goto LAB214;

LAB215:    if (*((unsigned int *)t10) != 0)
        goto LAB216;

LAB217:    t13 = (t15 + 4);
    t24 = *((unsigned int *)t15);
    t25 = *((unsigned int *)t13);
    t26 = (t24 || t25);
    if (t26 > 0)
        goto LAB218;

LAB219:    memcpy(t41, t15, 8);

LAB220:    t46 = (t41 + 4);
    t74 = *((unsigned int *)t46);
    t75 = (~(t74));
    t76 = *((unsigned int *)t41);
    t77 = (t76 & t75);
    t78 = (t77 != 0);
    if (t78 > 0)
        goto LAB233;

LAB234:    xsi_set_current_line(65, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t11, 0, 8);
    t4 = (t3 + 4);
    if (*((unsigned int *)t4) != 0)
        goto LAB238;

LAB237:    t5 = (t2 + 4);
    if (*((unsigned int *)t5) != 0)
        goto LAB238;

LAB241:    if (*((unsigned int *)t3) < *((unsigned int *)t2))
        goto LAB240;

LAB239:    *((unsigned int *)t11) = 1;

LAB240:    memset(t15, 0, 8);
    t9 = (t11 + 4);
    t17 = *((unsigned int *)t9);
    t18 = (~(t17));
    t19 = *((unsigned int *)t11);
    t20 = (t19 & t18);
    t21 = (t20 & 1U);
    if (t21 != 0)
        goto LAB242;

LAB243:    if (*((unsigned int *)t9) != 0)
        goto LAB244;

LAB245:    t12 = (t15 + 4);
    t24 = *((unsigned int *)t15);
    t25 = *((unsigned int *)t12);
    t26 = (t24 || t25);
    if (t26 > 0)
        goto LAB246;

LAB247:    memcpy(t41, t15, 8);

LAB248:    memset(t81, 0, 8);
    t45 = (t41 + 4);
    t74 = *((unsigned int *)t45);
    t75 = (~(t74));
    t76 = *((unsigned int *)t41);
    t77 = (t76 & t75);
    t78 = (t77 & 1U);
    if (t78 != 0)
        goto LAB261;

LAB262:    if (*((unsigned int *)t45) != 0)
        goto LAB263;

LAB264:    t47 = (t81 + 4);
    t82 = *((unsigned int *)t81);
    t83 = (!(t82));
    t84 = *((unsigned int *)t47);
    t85 = (t83 || t84);
    if (t85 > 0)
        goto LAB265;

LAB266:    memcpy(t152, t81, 8);

LAB267:    t180 = (t152 + 4);
    t181 = *((unsigned int *)t180);
    t182 = (~(t181));
    t183 = *((unsigned int *)t152);
    t184 = (t183 & t182);
    t185 = (t184 != 0);
    if (t185 > 0)
        goto LAB299;

LAB300:    xsi_set_current_line(68, ng0);

LAB303:    xsi_set_current_line(69, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 2, 0LL);

LAB301:
LAB235:    goto LAB15;

LAB18:    t14 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB20;

LAB22:    *((unsigned int *)t15) = 1;
    goto LAB25;

LAB24:    t22 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t22) = 1;
    goto LAB25;

LAB26:    t27 = (t0 + 1048U);
    t28 = *((char **)t27);
    t27 = ((char*)((ng3)));
    memset(t29, 0, 8);
    t30 = (t28 + 4);
    if (*((unsigned int *)t30) != 0)
        goto LAB30;

LAB29:    t31 = (t27 + 4);
    if (*((unsigned int *)t31) != 0)
        goto LAB30;

LAB33:    if (*((unsigned int *)t28) > *((unsigned int *)t27))
        goto LAB32;

LAB31:    *((unsigned int *)t29) = 1;

LAB32:    memset(t33, 0, 8);
    t34 = (t29 + 4);
    t35 = *((unsigned int *)t34);
    t36 = (~(t35));
    t37 = *((unsigned int *)t29);
    t38 = (t37 & t36);
    t39 = (t38 & 1U);
    if (t39 != 0)
        goto LAB34;

LAB35:    if (*((unsigned int *)t34) != 0)
        goto LAB36;

LAB37:    t42 = *((unsigned int *)t15);
    t43 = *((unsigned int *)t33);
    t44 = (t42 & t43);
    *((unsigned int *)t41) = t44;
    t45 = (t15 + 4);
    t46 = (t33 + 4);
    t47 = (t41 + 4);
    t48 = *((unsigned int *)t45);
    t49 = *((unsigned int *)t46);
    t50 = (t48 | t49);
    *((unsigned int *)t47) = t50;
    t51 = *((unsigned int *)t47);
    t52 = (t51 != 0);
    if (t52 == 1)
        goto LAB38;

LAB39:
LAB40:    goto LAB28;

LAB30:    t32 = (t29 + 4);
    *((unsigned int *)t29) = 1;
    *((unsigned int *)t32) = 1;
    goto LAB32;

LAB34:    *((unsigned int *)t33) = 1;
    goto LAB37;

LAB36:    t40 = (t33 + 4);
    *((unsigned int *)t33) = 1;
    *((unsigned int *)t40) = 1;
    goto LAB37;

LAB38:    t53 = *((unsigned int *)t41);
    t54 = *((unsigned int *)t47);
    *((unsigned int *)t41) = (t53 | t54);
    t55 = (t15 + 4);
    t56 = (t33 + 4);
    t57 = *((unsigned int *)t15);
    t58 = (~(t57));
    t59 = *((unsigned int *)t55);
    t60 = (~(t59));
    t61 = *((unsigned int *)t33);
    t62 = (~(t61));
    t63 = *((unsigned int *)t56);
    t64 = (~(t63));
    t65 = (t58 & t60);
    t66 = (t62 & t64);
    t67 = (~(t65));
    t68 = (~(t66));
    t69 = *((unsigned int *)t47);
    *((unsigned int *)t47) = (t69 & t67);
    t70 = *((unsigned int *)t47);
    *((unsigned int *)t47) = (t70 & t68);
    t71 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t71 & t67);
    t72 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t72 & t68);
    goto LAB40;

LAB41:    xsi_set_current_line(40, ng0);

LAB44:    xsi_set_current_line(41, ng0);
    t79 = ((char*)((ng1)));
    t80 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t80, t79, 0, 0, 2, 0LL);
    goto LAB43;

LAB46:    t7 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB48;

LAB50:    *((unsigned int *)t15) = 1;
    goto LAB53;

LAB52:    t10 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t10) = 1;
    goto LAB53;

LAB54:    t13 = (t0 + 1048U);
    t14 = *((char **)t13);
    t13 = ((char*)((ng5)));
    memset(t29, 0, 8);
    t16 = (t14 + 4);
    if (*((unsigned int *)t16) != 0)
        goto LAB58;

LAB57:    t22 = (t13 + 4);
    if (*((unsigned int *)t22) != 0)
        goto LAB58;

LAB61:    if (*((unsigned int *)t14) > *((unsigned int *)t13))
        goto LAB60;

LAB59:    *((unsigned int *)t29) = 1;

LAB60:    memset(t33, 0, 8);
    t27 = (t29 + 4);
    t35 = *((unsigned int *)t27);
    t36 = (~(t35));
    t37 = *((unsigned int *)t29);
    t38 = (t37 & t36);
    t39 = (t38 & 1U);
    if (t39 != 0)
        goto LAB62;

LAB63:    if (*((unsigned int *)t27) != 0)
        goto LAB64;

LAB65:    t42 = *((unsigned int *)t15);
    t43 = *((unsigned int *)t33);
    t44 = (t42 & t43);
    *((unsigned int *)t41) = t44;
    t30 = (t15 + 4);
    t31 = (t33 + 4);
    t32 = (t41 + 4);
    t48 = *((unsigned int *)t30);
    t49 = *((unsigned int *)t31);
    t50 = (t48 | t49);
    *((unsigned int *)t32) = t50;
    t51 = *((unsigned int *)t32);
    t52 = (t51 != 0);
    if (t52 == 1)
        goto LAB66;

LAB67:
LAB68:    goto LAB56;

LAB58:    t23 = (t29 + 4);
    *((unsigned int *)t29) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB60;

LAB62:    *((unsigned int *)t33) = 1;
    goto LAB65;

LAB64:    t28 = (t33 + 4);
    *((unsigned int *)t33) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB65;

LAB66:    t53 = *((unsigned int *)t41);
    t54 = *((unsigned int *)t32);
    *((unsigned int *)t41) = (t53 | t54);
    t34 = (t15 + 4);
    t40 = (t33 + 4);
    t57 = *((unsigned int *)t15);
    t58 = (~(t57));
    t59 = *((unsigned int *)t34);
    t60 = (~(t59));
    t61 = *((unsigned int *)t33);
    t62 = (~(t61));
    t63 = *((unsigned int *)t40);
    t64 = (~(t63));
    t8 = (t58 & t60);
    t65 = (t62 & t64);
    t67 = (~(t8));
    t68 = (~(t65));
    t69 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t69 & t67);
    t70 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t70 & t68);
    t71 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t71 & t67);
    t72 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t72 & t68);
    goto LAB68;

LAB69:    *((unsigned int *)t81) = 1;
    goto LAB72;

LAB71:    t46 = (t81 + 4);
    *((unsigned int *)t81) = 1;
    *((unsigned int *)t46) = 1;
    goto LAB72;

LAB73:    t55 = (t0 + 1048U);
    t56 = *((char **)t55);
    t55 = ((char*)((ng6)));
    memset(t86, 0, 8);
    t73 = (t56 + 4);
    if (*((unsigned int *)t73) != 0)
        goto LAB77;

LAB76:    t79 = (t55 + 4);
    if (*((unsigned int *)t79) != 0)
        goto LAB77;

LAB80:    if (*((unsigned int *)t56) < *((unsigned int *)t55))
        goto LAB79;

LAB78:    *((unsigned int *)t86) = 1;

LAB79:    memset(t87, 0, 8);
    t88 = (t86 + 4);
    t89 = *((unsigned int *)t88);
    t90 = (~(t89));
    t91 = *((unsigned int *)t86);
    t92 = (t91 & t90);
    t93 = (t92 & 1U);
    if (t93 != 0)
        goto LAB81;

LAB82:    if (*((unsigned int *)t88) != 0)
        goto LAB83;

LAB84:    t95 = (t87 + 4);
    t96 = *((unsigned int *)t87);
    t97 = *((unsigned int *)t95);
    t98 = (t96 || t97);
    if (t98 > 0)
        goto LAB85;

LAB86:    memcpy(t113, t87, 8);

LAB87:    memset(t144, 0, 8);
    t145 = (t113 + 4);
    t146 = *((unsigned int *)t145);
    t147 = (~(t146));
    t148 = *((unsigned int *)t113);
    t149 = (t148 & t147);
    t150 = (t149 & 1U);
    if (t150 != 0)
        goto LAB100;

LAB101:    if (*((unsigned int *)t145) != 0)
        goto LAB102;

LAB103:    t153 = *((unsigned int *)t81);
    t154 = *((unsigned int *)t144);
    t155 = (t153 | t154);
    *((unsigned int *)t152) = t155;
    t156 = (t81 + 4);
    t157 = (t144 + 4);
    t158 = (t152 + 4);
    t159 = *((unsigned int *)t156);
    t160 = *((unsigned int *)t157);
    t161 = (t159 | t160);
    *((unsigned int *)t158) = t161;
    t162 = *((unsigned int *)t158);
    t163 = (t162 != 0);
    if (t163 == 1)
        goto LAB104;

LAB105:
LAB106:    goto LAB75;

LAB77:    t80 = (t86 + 4);
    *((unsigned int *)t86) = 1;
    *((unsigned int *)t80) = 1;
    goto LAB79;

LAB81:    *((unsigned int *)t87) = 1;
    goto LAB84;

LAB83:    t94 = (t87 + 4);
    *((unsigned int *)t87) = 1;
    *((unsigned int *)t94) = 1;
    goto LAB84;

LAB85:    t99 = (t0 + 1048U);
    t100 = *((char **)t99);
    t99 = ((char*)((ng7)));
    memset(t101, 0, 8);
    t102 = (t100 + 4);
    if (*((unsigned int *)t102) != 0)
        goto LAB89;

LAB88:    t103 = (t99 + 4);
    if (*((unsigned int *)t103) != 0)
        goto LAB89;

LAB92:    if (*((unsigned int *)t100) > *((unsigned int *)t99))
        goto LAB91;

LAB90:    *((unsigned int *)t101) = 1;

LAB91:    memset(t105, 0, 8);
    t106 = (t101 + 4);
    t107 = *((unsigned int *)t106);
    t108 = (~(t107));
    t109 = *((unsigned int *)t101);
    t110 = (t109 & t108);
    t111 = (t110 & 1U);
    if (t111 != 0)
        goto LAB93;

LAB94:    if (*((unsigned int *)t106) != 0)
        goto LAB95;

LAB96:    t114 = *((unsigned int *)t87);
    t115 = *((unsigned int *)t105);
    t116 = (t114 & t115);
    *((unsigned int *)t113) = t116;
    t117 = (t87 + 4);
    t118 = (t105 + 4);
    t119 = (t113 + 4);
    t120 = *((unsigned int *)t117);
    t121 = *((unsigned int *)t118);
    t122 = (t120 | t121);
    *((unsigned int *)t119) = t122;
    t123 = *((unsigned int *)t119);
    t124 = (t123 != 0);
    if (t124 == 1)
        goto LAB97;

LAB98:
LAB99:    goto LAB87;

LAB89:    t104 = (t101 + 4);
    *((unsigned int *)t101) = 1;
    *((unsigned int *)t104) = 1;
    goto LAB91;

LAB93:    *((unsigned int *)t105) = 1;
    goto LAB96;

LAB95:    t112 = (t105 + 4);
    *((unsigned int *)t105) = 1;
    *((unsigned int *)t112) = 1;
    goto LAB96;

LAB97:    t125 = *((unsigned int *)t113);
    t126 = *((unsigned int *)t119);
    *((unsigned int *)t113) = (t125 | t126);
    t127 = (t87 + 4);
    t128 = (t105 + 4);
    t129 = *((unsigned int *)t87);
    t130 = (~(t129));
    t131 = *((unsigned int *)t127);
    t132 = (~(t131));
    t133 = *((unsigned int *)t105);
    t134 = (~(t133));
    t135 = *((unsigned int *)t128);
    t136 = (~(t135));
    t66 = (t130 & t132);
    t137 = (t134 & t136);
    t138 = (~(t66));
    t139 = (~(t137));
    t140 = *((unsigned int *)t119);
    *((unsigned int *)t119) = (t140 & t138);
    t141 = *((unsigned int *)t119);
    *((unsigned int *)t119) = (t141 & t139);
    t142 = *((unsigned int *)t113);
    *((unsigned int *)t113) = (t142 & t138);
    t143 = *((unsigned int *)t113);
    *((unsigned int *)t113) = (t143 & t139);
    goto LAB99;

LAB100:    *((unsigned int *)t144) = 1;
    goto LAB103;

LAB102:    t151 = (t144 + 4);
    *((unsigned int *)t144) = 1;
    *((unsigned int *)t151) = 1;
    goto LAB103;

LAB104:    t164 = *((unsigned int *)t152);
    t165 = *((unsigned int *)t158);
    *((unsigned int *)t152) = (t164 | t165);
    t166 = (t81 + 4);
    t167 = (t144 + 4);
    t168 = *((unsigned int *)t166);
    t169 = (~(t168));
    t170 = *((unsigned int *)t81);
    t171 = (t170 & t169);
    t172 = *((unsigned int *)t167);
    t173 = (~(t172));
    t174 = *((unsigned int *)t144);
    t175 = (t174 & t173);
    t176 = (~(t171));
    t177 = (~(t175));
    t178 = *((unsigned int *)t158);
    *((unsigned int *)t158) = (t178 & t176);
    t179 = *((unsigned int *)t158);
    *((unsigned int *)t158) = (t179 & t177);
    goto LAB106;

LAB107:    xsi_set_current_line(43, ng0);

LAB110:    xsi_set_current_line(44, ng0);
    t186 = ((char*)((ng8)));
    t187 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t187, t186, 0, 0, 2, 0LL);
    goto LAB109;

LAB114:    t9 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB116;

LAB118:    *((unsigned int *)t15) = 1;
    goto LAB121;

LAB120:    t12 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB121;

LAB122:    t14 = (t0 + 1048U);
    t16 = *((char **)t14);
    t14 = ((char*)((ng3)));
    memset(t29, 0, 8);
    t22 = (t16 + 4);
    if (*((unsigned int *)t22) != 0)
        goto LAB126;

LAB125:    t23 = (t14 + 4);
    if (*((unsigned int *)t23) != 0)
        goto LAB126;

LAB129:    if (*((unsigned int *)t16) > *((unsigned int *)t14))
        goto LAB128;

LAB127:    *((unsigned int *)t29) = 1;

LAB128:    memset(t33, 0, 8);
    t28 = (t29 + 4);
    t35 = *((unsigned int *)t28);
    t36 = (~(t35));
    t37 = *((unsigned int *)t29);
    t38 = (t37 & t36);
    t39 = (t38 & 1U);
    if (t39 != 0)
        goto LAB130;

LAB131:    if (*((unsigned int *)t28) != 0)
        goto LAB132;

LAB133:    t42 = *((unsigned int *)t15);
    t43 = *((unsigned int *)t33);
    t44 = (t42 & t43);
    *((unsigned int *)t41) = t44;
    t31 = (t15 + 4);
    t32 = (t33 + 4);
    t34 = (t41 + 4);
    t48 = *((unsigned int *)t31);
    t49 = *((unsigned int *)t32);
    t50 = (t48 | t49);
    *((unsigned int *)t34) = t50;
    t51 = *((unsigned int *)t34);
    t52 = (t51 != 0);
    if (t52 == 1)
        goto LAB134;

LAB135:
LAB136:    goto LAB124;

LAB126:    t27 = (t29 + 4);
    *((unsigned int *)t29) = 1;
    *((unsigned int *)t27) = 1;
    goto LAB128;

LAB130:    *((unsigned int *)t33) = 1;
    goto LAB133;

LAB132:    t30 = (t33 + 4);
    *((unsigned int *)t33) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB133;

LAB134:    t53 = *((unsigned int *)t41);
    t54 = *((unsigned int *)t34);
    *((unsigned int *)t41) = (t53 | t54);
    t40 = (t15 + 4);
    t45 = (t33 + 4);
    t57 = *((unsigned int *)t15);
    t58 = (~(t57));
    t59 = *((unsigned int *)t40);
    t60 = (~(t59));
    t61 = *((unsigned int *)t33);
    t62 = (~(t61));
    t63 = *((unsigned int *)t45);
    t64 = (~(t63));
    t65 = (t58 & t60);
    t66 = (t62 & t64);
    t67 = (~(t65));
    t68 = (~(t66));
    t69 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t69 & t67);
    t70 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t70 & t68);
    t71 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t71 & t67);
    t72 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t72 & t68);
    goto LAB136;

LAB137:    xsi_set_current_line(51, ng0);

LAB140:    xsi_set_current_line(52, ng0);
    t47 = ((char*)((ng9)));
    t55 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t55, t47, 0, 0, 2, 0LL);
    goto LAB139;

LAB142:    t7 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB144;

LAB146:    *((unsigned int *)t15) = 1;
    goto LAB149;

LAB148:    t10 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t10) = 1;
    goto LAB149;

LAB150:    t13 = (t0 + 1048U);
    t14 = *((char **)t13);
    t13 = ((char*)((ng5)));
    memset(t29, 0, 8);
    t16 = (t14 + 4);
    if (*((unsigned int *)t16) != 0)
        goto LAB154;

LAB153:    t22 = (t13 + 4);
    if (*((unsigned int *)t22) != 0)
        goto LAB154;

LAB157:    if (*((unsigned int *)t14) > *((unsigned int *)t13))
        goto LAB156;

LAB155:    *((unsigned int *)t29) = 1;

LAB156:    memset(t33, 0, 8);
    t27 = (t29 + 4);
    t35 = *((unsigned int *)t27);
    t36 = (~(t35));
    t37 = *((unsigned int *)t29);
    t38 = (t37 & t36);
    t39 = (t38 & 1U);
    if (t39 != 0)
        goto LAB158;

LAB159:    if (*((unsigned int *)t27) != 0)
        goto LAB160;

LAB161:    t42 = *((unsigned int *)t15);
    t43 = *((unsigned int *)t33);
    t44 = (t42 & t43);
    *((unsigned int *)t41) = t44;
    t30 = (t15 + 4);
    t31 = (t33 + 4);
    t32 = (t41 + 4);
    t48 = *((unsigned int *)t30);
    t49 = *((unsigned int *)t31);
    t50 = (t48 | t49);
    *((unsigned int *)t32) = t50;
    t51 = *((unsigned int *)t32);
    t52 = (t51 != 0);
    if (t52 == 1)
        goto LAB162;

LAB163:
LAB164:    goto LAB152;

LAB154:    t23 = (t29 + 4);
    *((unsigned int *)t29) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB156;

LAB158:    *((unsigned int *)t33) = 1;
    goto LAB161;

LAB160:    t28 = (t33 + 4);
    *((unsigned int *)t33) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB161;

LAB162:    t53 = *((unsigned int *)t41);
    t54 = *((unsigned int *)t32);
    *((unsigned int *)t41) = (t53 | t54);
    t34 = (t15 + 4);
    t40 = (t33 + 4);
    t57 = *((unsigned int *)t15);
    t58 = (~(t57));
    t59 = *((unsigned int *)t34);
    t60 = (~(t59));
    t61 = *((unsigned int *)t33);
    t62 = (~(t61));
    t63 = *((unsigned int *)t40);
    t64 = (~(t63));
    t8 = (t58 & t60);
    t65 = (t62 & t64);
    t67 = (~(t8));
    t68 = (~(t65));
    t69 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t69 & t67);
    t70 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t70 & t68);
    t71 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t71 & t67);
    t72 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t72 & t68);
    goto LAB164;

LAB165:    *((unsigned int *)t81) = 1;
    goto LAB168;

LAB167:    t46 = (t81 + 4);
    *((unsigned int *)t81) = 1;
    *((unsigned int *)t46) = 1;
    goto LAB168;

LAB169:    t55 = (t0 + 1048U);
    t56 = *((char **)t55);
    t55 = ((char*)((ng6)));
    memset(t86, 0, 8);
    t73 = (t56 + 4);
    if (*((unsigned int *)t73) != 0)
        goto LAB173;

LAB172:    t79 = (t55 + 4);
    if (*((unsigned int *)t79) != 0)
        goto LAB173;

LAB176:    if (*((unsigned int *)t56) < *((unsigned int *)t55))
        goto LAB175;

LAB174:    *((unsigned int *)t86) = 1;

LAB175:    memset(t87, 0, 8);
    t88 = (t86 + 4);
    t89 = *((unsigned int *)t88);
    t90 = (~(t89));
    t91 = *((unsigned int *)t86);
    t92 = (t91 & t90);
    t93 = (t92 & 1U);
    if (t93 != 0)
        goto LAB177;

LAB178:    if (*((unsigned int *)t88) != 0)
        goto LAB179;

LAB180:    t95 = (t87 + 4);
    t96 = *((unsigned int *)t87);
    t97 = *((unsigned int *)t95);
    t98 = (t96 || t97);
    if (t98 > 0)
        goto LAB181;

LAB182:    memcpy(t113, t87, 8);

LAB183:    memset(t144, 0, 8);
    t145 = (t113 + 4);
    t146 = *((unsigned int *)t145);
    t147 = (~(t146));
    t148 = *((unsigned int *)t113);
    t149 = (t148 & t147);
    t150 = (t149 & 1U);
    if (t150 != 0)
        goto LAB196;

LAB197:    if (*((unsigned int *)t145) != 0)
        goto LAB198;

LAB199:    t153 = *((unsigned int *)t81);
    t154 = *((unsigned int *)t144);
    t155 = (t153 | t154);
    *((unsigned int *)t152) = t155;
    t156 = (t81 + 4);
    t157 = (t144 + 4);
    t158 = (t152 + 4);
    t159 = *((unsigned int *)t156);
    t160 = *((unsigned int *)t157);
    t161 = (t159 | t160);
    *((unsigned int *)t158) = t161;
    t162 = *((unsigned int *)t158);
    t163 = (t162 != 0);
    if (t163 == 1)
        goto LAB200;

LAB201:
LAB202:    goto LAB171;

LAB173:    t80 = (t86 + 4);
    *((unsigned int *)t86) = 1;
    *((unsigned int *)t80) = 1;
    goto LAB175;

LAB177:    *((unsigned int *)t87) = 1;
    goto LAB180;

LAB179:    t94 = (t87 + 4);
    *((unsigned int *)t87) = 1;
    *((unsigned int *)t94) = 1;
    goto LAB180;

LAB181:    t99 = (t0 + 1048U);
    t100 = *((char **)t99);
    t99 = ((char*)((ng7)));
    memset(t101, 0, 8);
    t102 = (t100 + 4);
    if (*((unsigned int *)t102) != 0)
        goto LAB185;

LAB184:    t103 = (t99 + 4);
    if (*((unsigned int *)t103) != 0)
        goto LAB185;

LAB188:    if (*((unsigned int *)t100) > *((unsigned int *)t99))
        goto LAB187;

LAB186:    *((unsigned int *)t101) = 1;

LAB187:    memset(t105, 0, 8);
    t106 = (t101 + 4);
    t107 = *((unsigned int *)t106);
    t108 = (~(t107));
    t109 = *((unsigned int *)t101);
    t110 = (t109 & t108);
    t111 = (t110 & 1U);
    if (t111 != 0)
        goto LAB189;

LAB190:    if (*((unsigned int *)t106) != 0)
        goto LAB191;

LAB192:    t114 = *((unsigned int *)t87);
    t115 = *((unsigned int *)t105);
    t116 = (t114 & t115);
    *((unsigned int *)t113) = t116;
    t117 = (t87 + 4);
    t118 = (t105 + 4);
    t119 = (t113 + 4);
    t120 = *((unsigned int *)t117);
    t121 = *((unsigned int *)t118);
    t122 = (t120 | t121);
    *((unsigned int *)t119) = t122;
    t123 = *((unsigned int *)t119);
    t124 = (t123 != 0);
    if (t124 == 1)
        goto LAB193;

LAB194:
LAB195:    goto LAB183;

LAB185:    t104 = (t101 + 4);
    *((unsigned int *)t101) = 1;
    *((unsigned int *)t104) = 1;
    goto LAB187;

LAB189:    *((unsigned int *)t105) = 1;
    goto LAB192;

LAB191:    t112 = (t105 + 4);
    *((unsigned int *)t105) = 1;
    *((unsigned int *)t112) = 1;
    goto LAB192;

LAB193:    t125 = *((unsigned int *)t113);
    t126 = *((unsigned int *)t119);
    *((unsigned int *)t113) = (t125 | t126);
    t127 = (t87 + 4);
    t128 = (t105 + 4);
    t129 = *((unsigned int *)t87);
    t130 = (~(t129));
    t131 = *((unsigned int *)t127);
    t132 = (~(t131));
    t133 = *((unsigned int *)t105);
    t134 = (~(t133));
    t135 = *((unsigned int *)t128);
    t136 = (~(t135));
    t66 = (t130 & t132);
    t137 = (t134 & t136);
    t138 = (~(t66));
    t139 = (~(t137));
    t140 = *((unsigned int *)t119);
    *((unsigned int *)t119) = (t140 & t138);
    t141 = *((unsigned int *)t119);
    *((unsigned int *)t119) = (t141 & t139);
    t142 = *((unsigned int *)t113);
    *((unsigned int *)t113) = (t142 & t138);
    t143 = *((unsigned int *)t113);
    *((unsigned int *)t113) = (t143 & t139);
    goto LAB195;

LAB196:    *((unsigned int *)t144) = 1;
    goto LAB199;

LAB198:    t151 = (t144 + 4);
    *((unsigned int *)t144) = 1;
    *((unsigned int *)t151) = 1;
    goto LAB199;

LAB200:    t164 = *((unsigned int *)t152);
    t165 = *((unsigned int *)t158);
    *((unsigned int *)t152) = (t164 | t165);
    t166 = (t81 + 4);
    t167 = (t144 + 4);
    t168 = *((unsigned int *)t166);
    t169 = (~(t168));
    t170 = *((unsigned int *)t81);
    t171 = (t170 & t169);
    t172 = *((unsigned int *)t167);
    t173 = (~(t172));
    t174 = *((unsigned int *)t144);
    t175 = (t174 & t173);
    t176 = (~(t171));
    t177 = (~(t175));
    t178 = *((unsigned int *)t158);
    *((unsigned int *)t158) = (t178 & t176);
    t179 = *((unsigned int *)t158);
    *((unsigned int *)t158) = (t179 & t177);
    goto LAB202;

LAB203:    xsi_set_current_line(54, ng0);

LAB206:    xsi_set_current_line(55, ng0);
    t186 = ((char*)((ng8)));
    t187 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t187, t186, 0, 0, 2, 0LL);
    goto LAB205;

LAB210:    t9 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB212;

LAB214:    *((unsigned int *)t15) = 1;
    goto LAB217;

LAB216:    t12 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB217;

LAB218:    t14 = (t0 + 1048U);
    t16 = *((char **)t14);
    t14 = ((char*)((ng3)));
    memset(t29, 0, 8);
    t22 = (t16 + 4);
    if (*((unsigned int *)t22) != 0)
        goto LAB222;

LAB221:    t23 = (t14 + 4);
    if (*((unsigned int *)t23) != 0)
        goto LAB222;

LAB225:    if (*((unsigned int *)t16) > *((unsigned int *)t14))
        goto LAB224;

LAB223:    *((unsigned int *)t29) = 1;

LAB224:    memset(t33, 0, 8);
    t28 = (t29 + 4);
    t35 = *((unsigned int *)t28);
    t36 = (~(t35));
    t37 = *((unsigned int *)t29);
    t38 = (t37 & t36);
    t39 = (t38 & 1U);
    if (t39 != 0)
        goto LAB226;

LAB227:    if (*((unsigned int *)t28) != 0)
        goto LAB228;

LAB229:    t42 = *((unsigned int *)t15);
    t43 = *((unsigned int *)t33);
    t44 = (t42 & t43);
    *((unsigned int *)t41) = t44;
    t31 = (t15 + 4);
    t32 = (t33 + 4);
    t34 = (t41 + 4);
    t48 = *((unsigned int *)t31);
    t49 = *((unsigned int *)t32);
    t50 = (t48 | t49);
    *((unsigned int *)t34) = t50;
    t51 = *((unsigned int *)t34);
    t52 = (t51 != 0);
    if (t52 == 1)
        goto LAB230;

LAB231:
LAB232:    goto LAB220;

LAB222:    t27 = (t29 + 4);
    *((unsigned int *)t29) = 1;
    *((unsigned int *)t27) = 1;
    goto LAB224;

LAB226:    *((unsigned int *)t33) = 1;
    goto LAB229;

LAB228:    t30 = (t33 + 4);
    *((unsigned int *)t33) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB229;

LAB230:    t53 = *((unsigned int *)t41);
    t54 = *((unsigned int *)t34);
    *((unsigned int *)t41) = (t53 | t54);
    t40 = (t15 + 4);
    t45 = (t33 + 4);
    t57 = *((unsigned int *)t15);
    t58 = (~(t57));
    t59 = *((unsigned int *)t40);
    t60 = (~(t59));
    t61 = *((unsigned int *)t33);
    t62 = (~(t61));
    t63 = *((unsigned int *)t45);
    t64 = (~(t63));
    t65 = (t58 & t60);
    t66 = (t62 & t64);
    t67 = (~(t65));
    t68 = (~(t66));
    t69 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t69 & t67);
    t70 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t70 & t68);
    t71 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t71 & t67);
    t72 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t72 & t68);
    goto LAB232;

LAB233:    xsi_set_current_line(62, ng0);

LAB236:    xsi_set_current_line(63, ng0);
    t47 = ((char*)((ng9)));
    t55 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t55, t47, 0, 0, 2, 0LL);
    goto LAB235;

LAB238:    t7 = (t11 + 4);
    *((unsigned int *)t11) = 1;
    *((unsigned int *)t7) = 1;
    goto LAB240;

LAB242:    *((unsigned int *)t15) = 1;
    goto LAB245;

LAB244:    t10 = (t15 + 4);
    *((unsigned int *)t15) = 1;
    *((unsigned int *)t10) = 1;
    goto LAB245;

LAB246:    t13 = (t0 + 1048U);
    t14 = *((char **)t13);
    t13 = ((char*)((ng5)));
    memset(t29, 0, 8);
    t16 = (t14 + 4);
    if (*((unsigned int *)t16) != 0)
        goto LAB250;

LAB249:    t22 = (t13 + 4);
    if (*((unsigned int *)t22) != 0)
        goto LAB250;

LAB253:    if (*((unsigned int *)t14) > *((unsigned int *)t13))
        goto LAB252;

LAB251:    *((unsigned int *)t29) = 1;

LAB252:    memset(t33, 0, 8);
    t27 = (t29 + 4);
    t35 = *((unsigned int *)t27);
    t36 = (~(t35));
    t37 = *((unsigned int *)t29);
    t38 = (t37 & t36);
    t39 = (t38 & 1U);
    if (t39 != 0)
        goto LAB254;

LAB255:    if (*((unsigned int *)t27) != 0)
        goto LAB256;

LAB257:    t42 = *((unsigned int *)t15);
    t43 = *((unsigned int *)t33);
    t44 = (t42 & t43);
    *((unsigned int *)t41) = t44;
    t30 = (t15 + 4);
    t31 = (t33 + 4);
    t32 = (t41 + 4);
    t48 = *((unsigned int *)t30);
    t49 = *((unsigned int *)t31);
    t50 = (t48 | t49);
    *((unsigned int *)t32) = t50;
    t51 = *((unsigned int *)t32);
    t52 = (t51 != 0);
    if (t52 == 1)
        goto LAB258;

LAB259:
LAB260:    goto LAB248;

LAB250:    t23 = (t29 + 4);
    *((unsigned int *)t29) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB252;

LAB254:    *((unsigned int *)t33) = 1;
    goto LAB257;

LAB256:    t28 = (t33 + 4);
    *((unsigned int *)t33) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB257;

LAB258:    t53 = *((unsigned int *)t41);
    t54 = *((unsigned int *)t32);
    *((unsigned int *)t41) = (t53 | t54);
    t34 = (t15 + 4);
    t40 = (t33 + 4);
    t57 = *((unsigned int *)t15);
    t58 = (~(t57));
    t59 = *((unsigned int *)t34);
    t60 = (~(t59));
    t61 = *((unsigned int *)t33);
    t62 = (~(t61));
    t63 = *((unsigned int *)t40);
    t64 = (~(t63));
    t8 = (t58 & t60);
    t65 = (t62 & t64);
    t67 = (~(t8));
    t68 = (~(t65));
    t69 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t69 & t67);
    t70 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t70 & t68);
    t71 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t71 & t67);
    t72 = *((unsigned int *)t41);
    *((unsigned int *)t41) = (t72 & t68);
    goto LAB260;

LAB261:    *((unsigned int *)t81) = 1;
    goto LAB264;

LAB263:    t46 = (t81 + 4);
    *((unsigned int *)t81) = 1;
    *((unsigned int *)t46) = 1;
    goto LAB264;

LAB265:    t55 = (t0 + 1048U);
    t56 = *((char **)t55);
    t55 = ((char*)((ng6)));
    memset(t86, 0, 8);
    t73 = (t56 + 4);
    if (*((unsigned int *)t73) != 0)
        goto LAB269;

LAB268:    t79 = (t55 + 4);
    if (*((unsigned int *)t79) != 0)
        goto LAB269;

LAB272:    if (*((unsigned int *)t56) < *((unsigned int *)t55))
        goto LAB271;

LAB270:    *((unsigned int *)t86) = 1;

LAB271:    memset(t87, 0, 8);
    t88 = (t86 + 4);
    t89 = *((unsigned int *)t88);
    t90 = (~(t89));
    t91 = *((unsigned int *)t86);
    t92 = (t91 & t90);
    t93 = (t92 & 1U);
    if (t93 != 0)
        goto LAB273;

LAB274:    if (*((unsigned int *)t88) != 0)
        goto LAB275;

LAB276:    t95 = (t87 + 4);
    t96 = *((unsigned int *)t87);
    t97 = *((unsigned int *)t95);
    t98 = (t96 || t97);
    if (t98 > 0)
        goto LAB277;

LAB278:    memcpy(t113, t87, 8);

LAB279:    memset(t144, 0, 8);
    t145 = (t113 + 4);
    t146 = *((unsigned int *)t145);
    t147 = (~(t146));
    t148 = *((unsigned int *)t113);
    t149 = (t148 & t147);
    t150 = (t149 & 1U);
    if (t150 != 0)
        goto LAB292;

LAB293:    if (*((unsigned int *)t145) != 0)
        goto LAB294;

LAB295:    t153 = *((unsigned int *)t81);
    t154 = *((unsigned int *)t144);
    t155 = (t153 | t154);
    *((unsigned int *)t152) = t155;
    t156 = (t81 + 4);
    t157 = (t144 + 4);
    t158 = (t152 + 4);
    t159 = *((unsigned int *)t156);
    t160 = *((unsigned int *)t157);
    t161 = (t159 | t160);
    *((unsigned int *)t158) = t161;
    t162 = *((unsigned int *)t158);
    t163 = (t162 != 0);
    if (t163 == 1)
        goto LAB296;

LAB297:
LAB298:    goto LAB267;

LAB269:    t80 = (t86 + 4);
    *((unsigned int *)t86) = 1;
    *((unsigned int *)t80) = 1;
    goto LAB271;

LAB273:    *((unsigned int *)t87) = 1;
    goto LAB276;

LAB275:    t94 = (t87 + 4);
    *((unsigned int *)t87) = 1;
    *((unsigned int *)t94) = 1;
    goto LAB276;

LAB277:    t99 = (t0 + 1048U);
    t100 = *((char **)t99);
    t99 = ((char*)((ng7)));
    memset(t101, 0, 8);
    t102 = (t100 + 4);
    if (*((unsigned int *)t102) != 0)
        goto LAB281;

LAB280:    t103 = (t99 + 4);
    if (*((unsigned int *)t103) != 0)
        goto LAB281;

LAB284:    if (*((unsigned int *)t100) > *((unsigned int *)t99))
        goto LAB283;

LAB282:    *((unsigned int *)t101) = 1;

LAB283:    memset(t105, 0, 8);
    t106 = (t101 + 4);
    t107 = *((unsigned int *)t106);
    t108 = (~(t107));
    t109 = *((unsigned int *)t101);
    t110 = (t109 & t108);
    t111 = (t110 & 1U);
    if (t111 != 0)
        goto LAB285;

LAB286:    if (*((unsigned int *)t106) != 0)
        goto LAB287;

LAB288:    t114 = *((unsigned int *)t87);
    t115 = *((unsigned int *)t105);
    t116 = (t114 & t115);
    *((unsigned int *)t113) = t116;
    t117 = (t87 + 4);
    t118 = (t105 + 4);
    t119 = (t113 + 4);
    t120 = *((unsigned int *)t117);
    t121 = *((unsigned int *)t118);
    t122 = (t120 | t121);
    *((unsigned int *)t119) = t122;
    t123 = *((unsigned int *)t119);
    t124 = (t123 != 0);
    if (t124 == 1)
        goto LAB289;

LAB290:
LAB291:    goto LAB279;

LAB281:    t104 = (t101 + 4);
    *((unsigned int *)t101) = 1;
    *((unsigned int *)t104) = 1;
    goto LAB283;

LAB285:    *((unsigned int *)t105) = 1;
    goto LAB288;

LAB287:    t112 = (t105 + 4);
    *((unsigned int *)t105) = 1;
    *((unsigned int *)t112) = 1;
    goto LAB288;

LAB289:    t125 = *((unsigned int *)t113);
    t126 = *((unsigned int *)t119);
    *((unsigned int *)t113) = (t125 | t126);
    t127 = (t87 + 4);
    t128 = (t105 + 4);
    t129 = *((unsigned int *)t87);
    t130 = (~(t129));
    t131 = *((unsigned int *)t127);
    t132 = (~(t131));
    t133 = *((unsigned int *)t105);
    t134 = (~(t133));
    t135 = *((unsigned int *)t128);
    t136 = (~(t135));
    t66 = (t130 & t132);
    t137 = (t134 & t136);
    t138 = (~(t66));
    t139 = (~(t137));
    t140 = *((unsigned int *)t119);
    *((unsigned int *)t119) = (t140 & t138);
    t141 = *((unsigned int *)t119);
    *((unsigned int *)t119) = (t141 & t139);
    t142 = *((unsigned int *)t113);
    *((unsigned int *)t113) = (t142 & t138);
    t143 = *((unsigned int *)t113);
    *((unsigned int *)t113) = (t143 & t139);
    goto LAB291;

LAB292:    *((unsigned int *)t144) = 1;
    goto LAB295;

LAB294:    t151 = (t144 + 4);
    *((unsigned int *)t144) = 1;
    *((unsigned int *)t151) = 1;
    goto LAB295;

LAB296:    t164 = *((unsigned int *)t152);
    t165 = *((unsigned int *)t158);
    *((unsigned int *)t152) = (t164 | t165);
    t166 = (t81 + 4);
    t167 = (t144 + 4);
    t168 = *((unsigned int *)t166);
    t169 = (~(t168));
    t170 = *((unsigned int *)t81);
    t171 = (t170 & t169);
    t172 = *((unsigned int *)t167);
    t173 = (~(t172));
    t174 = *((unsigned int *)t144);
    t175 = (t174 & t173);
    t176 = (~(t171));
    t177 = (~(t175));
    t178 = *((unsigned int *)t158);
    *((unsigned int *)t158) = (t178 & t176);
    t179 = *((unsigned int *)t158);
    *((unsigned int *)t158) = (t179 & t177);
    goto LAB298;

LAB299:    xsi_set_current_line(65, ng0);

LAB302:    xsi_set_current_line(66, ng0);
    t186 = ((char*)((ng8)));
    t187 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t187, t186, 0, 0, 2, 0LL);
    goto LAB301;

}

static void Cont_78_2(char *t0)
{
    char t3[8];
    char t4[8];
    char t8[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    char *t51;
    unsigned int t52;
    unsigned int t53;
    char *t54;

LAB0:    t1 = (t0 + 3184U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(78, ng0);
    t2 = (t0 + 1768);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng9)));
    memset(t8, 0, 8);
    t9 = (t6 + 4);
    t10 = (t7 + 4);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = *((unsigned int *)t9);
    t15 = *((unsigned int *)t10);
    t16 = (t14 ^ t15);
    t17 = (t13 | t16);
    t18 = *((unsigned int *)t9);
    t19 = *((unsigned int *)t10);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB7;

LAB4:    if (t20 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t8) = 1;

LAB7:    memset(t4, 0, 8);
    t24 = (t8 + 4);
    t25 = *((unsigned int *)t24);
    t26 = (~(t25));
    t27 = *((unsigned int *)t8);
    t28 = (t27 & t26);
    t29 = (t28 & 1U);
    if (t29 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t24) != 0)
        goto LAB10;

LAB11:    t31 = (t4 + 4);
    t32 = *((unsigned int *)t4);
    t33 = *((unsigned int *)t31);
    t34 = (t32 || t33);
    if (t34 > 0)
        goto LAB12;

LAB13:    t36 = *((unsigned int *)t4);
    t37 = (~(t36));
    t38 = *((unsigned int *)t31);
    t39 = (t37 || t38);
    if (t39 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t31) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t40, 8);

LAB20:    t41 = (t0 + 3600);
    t42 = (t41 + 56U);
    t43 = *((char **)t42);
    t44 = (t43 + 56U);
    t45 = *((char **)t44);
    memset(t45, 0, 8);
    t46 = 1U;
    t47 = t46;
    t48 = (t3 + 4);
    t49 = *((unsigned int *)t3);
    t46 = (t46 & t49);
    t50 = *((unsigned int *)t48);
    t47 = (t47 & t50);
    t51 = (t45 + 4);
    t52 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t52 | t46);
    t53 = *((unsigned int *)t51);
    *((unsigned int *)t51) = (t53 | t47);
    xsi_driver_vfirst_trans(t41, 0, 0);
    t54 = (t0 + 3520);
    *((int *)t54) = 1;

LAB1:    return;
LAB6:    t23 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t30 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB11;

LAB12:    t35 = ((char*)((ng8)));
    goto LAB13;

LAB14:    t40 = ((char*)((ng1)));
    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 1, t35, 1, t40, 1);
    goto LAB20;

LAB18:    memcpy(t3, t35, 8);
    goto LAB20;

}


extern void work_m_00000000000583518236_2100687796_init()
{
	static char *pe[] = {(void *)Initial_33_0,(void *)Always_37_1,(void *)Cont_78_2};
	xsi_register_didat("work_m_00000000000583518236_2100687796", "isim/tb_isim_beh.exe.sim/work/m_00000000000583518236_2100687796.didat");
	xsi_register_executes(pe);
}
