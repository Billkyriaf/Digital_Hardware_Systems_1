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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000001306487159_2964965119_init();
    work_m_00000000000478451405_1543028215_init();
    work_m_00000000002489813658_3203465003_init();
    work_m_00000000003173895870_0514299739_init();
    work_m_00000000001255828122_3538264565_init();
    work_m_00000000003170827407_0278921292_init();
    work_m_00000000001630362230_3476323984_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000001630362230_3476323984");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
