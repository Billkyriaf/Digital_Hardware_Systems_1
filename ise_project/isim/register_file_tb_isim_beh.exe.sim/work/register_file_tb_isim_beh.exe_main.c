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
    work_m_07949563976019306871_2964965119_init();
    work_m_11327391037204502221_1543028215_init();
    work_m_09827813043292572314_3203465003_init();
    work_m_07011630617514069694_0514299739_init();
    work_m_11299163026853882522_3538264565_init();
    work_m_03490521006961785999_0278921292_init();
    work_m_11690514249602128502_3476323984_init();
    work_m_16541823861846354283_2073120511_init();


    xsi_register_tops("work_m_11690514249602128502_3476323984");
    xsi_register_tops("work_m_16541823861846354283_2073120511");


    return xsi_run_simulation(argc, argv);

}
