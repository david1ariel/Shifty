using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Security.Cryptography.X509Certificates;
using System.Text;

namespace CtrlShift
{
    public class DataHandler
    {
        private static readonly TomediaShiftsManagementContext DB = new TomediaShiftsManagementContext();
        private static readonly EmployeesLogic employeesLogic = new EmployeesLogic(DB);
        private static readonly ShiftsLogic shiftsLogic = new ShiftsLogic(DB);

        private static List<PastShiftModel> shifts = shiftsLogic.GetAllPastShifts();

        public static List<List<PastShiftModel>> shiftsToDisplay = new List<List<PastShiftModel>>();
        public static List<PastShiftModel> tempShifts = new List<PastShiftModel>();
        public static List<PastShiftModel> result = new List<PastShiftModel>();

        public static List<List<PastShiftModel>> makeShifts2DList()
            
        {
            double todayDay = (double)DateTime.Now.DayOfWeek;
            DateTime startDate = DateTime.Now.AddDays((double)-todayDay-21);
            DateTime maxDate = (DateTime)shifts.Max(s => s.Ended);

            tempShifts = shifts.Where(s => s.Started >= startDate && s.Ended >= startDate.AddDays(21)).ToList();

            int maxTypeId = (int)tempShifts.Max(s => s.ShiftTypeId);
            int maxEmployeeId = (int)tempShifts.Max(s => s.EmployeeId);
            for (int i = 1; i <= maxTypeId*maxEmployeeId; i++)
            {
                result = shifts.Where(s => s.ShiftTypeId == i).ToList<PastShiftModel>();
                if (result.Count == 0)
                    continue;
                shiftsToDisplay.Add(result);
            }
            
            return shiftsToDisplay;
        }

        public static void makeHashTable()
        {
            Hashtable shifts = new Hashtable();

        }
	}
}
