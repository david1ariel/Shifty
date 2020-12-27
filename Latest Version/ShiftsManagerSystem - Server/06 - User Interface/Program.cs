using Microsoft.EntityFrameworkCore.Query.Internal;
using Microsoft.VisualBasic;
using System;
using System.Collections.Generic;
using System.Linq;

namespace CtrlShift
{
    class Program
    {
        private static readonly TomediaShiftsManagementContext DB = new TomediaShiftsManagementContext();
        private static readonly EmployeesLogic employeesLogic = new EmployeesLogic(DB);
        private static readonly ShiftsLogic shiftsLogic = new ShiftsLogic(DB);
                
        static void Main(string[] args)
        {
            //try
            //{
            //    Random random = new Random();

            //    List<PastShiftModel> shifts = shiftsLogic.GetAllPastShifts();

            //    Console.WriteLine($"{1,10}{2,10}{3,10}", );

            //    foreach (var item in shifts)
            //    {
            //        Console.WriteLine($)
            //    }

            //}
            //catch (Exception ex)
            //{
            //    Console.WriteLine(ex.Message);
            //}

        }
    }
}
